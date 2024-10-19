﻿using System.Net.Http;

namespace Services.VNPays;
public class VnPayService : IVnPayService
{
    private readonly IConfiguration _config;

    public VnPayService(IConfiguration config)
    {
        _config = config;
    }

    public string CreatePaymentUrl(HttpContext context, VnPaymentRequestModel model)
    {
        var tick = DateTime.Now.Ticks.ToString();

        var vnpay = new VnPayLibrary();
        vnpay.AddRequestData("vnp_Version", _config["VnPay:Version"]);
        vnpay.AddRequestData("vnp_Command", _config["VnPay:Command"]);
        vnpay.AddRequestData("vnp_TmnCode", _config["VnPay:TmnCode"]);
        vnpay.AddRequestData("vnp_Amount", (model.Amount * 100).ToString()); // Convert to string

        vnpay.AddRequestData("vnp_CreateDate", model.CreatedDate.ToString("yyyyMMddHHmmss"));
        vnpay.AddRequestData("vnp_CurrCode", _config["VnPay:CurrCode"]);
        vnpay.AddRequestData("vnp_IpAddr", context.Connection.RemoteIpAddress.ToString()); // Get IP address
        vnpay.AddRequestData("vnp_Locale", _config["VnPay:Locale"]);

        vnpay.AddRequestData("vnp_OrderInfo", "Thanh toán cho đơn hàng:" + model.OrderId);
        vnpay.AddRequestData("vnp_OrderType", "other");
        vnpay.AddRequestData("vnp_ReturnUrl", _config["VnPay:PaymentBackReturnUrl"]);

        vnpay.AddRequestData("vnp_TxnRef", tick);

        var paymentUrl = vnpay.CreateRequestUrl(_config["VnPay:BaseUrl"], _config["VnPay:HashSecret"]);

        return paymentUrl;
    }


    public VnPaymentResponseModel PaymentExecute(IQueryCollection collections)
    {
        var vnpay = new VnPayLibrary();
        foreach (var (key, value) in collections)
        {
            if (!string.IsNullOrEmpty(key) && key.StartsWith("vnp_"))
            {
                vnpay.AddResponseData(key, value.ToString());
            }
        }

        var vnp_orderId = long.Parse(vnpay.GetResponseData("vnp_TxnRef")); // Parse to long
        var vnp_TransactionId = long.Parse(vnpay.GetResponseData("vnp_TransactionNo")); // Parse to long
        var vnp_SecureHash = collections.FirstOrDefault(p => p.Key == "vnp_SecureHash").Value;
        var vnp_ResponseCode = vnpay.GetResponseData("vnp_ResponseCode");
        var vnp_OrderInfo = vnpay.GetResponseData("vnp_OrderInfo");

        bool checkSignature = vnpay.ValidateSignature(vnp_SecureHash, _config["VnPay:HashSecret"]);
        if (!checkSignature)
        {
            return new VnPaymentResponseModel
            {
                Success = false
            };
        }

        return new VnPaymentResponseModel
        {
            Success = true,
            PaymentMethod = "VnPay",
            OrderDescription = vnp_OrderInfo,
            OrderId = vnp_orderId.ToString(),
            TransactionId = vnp_TransactionId.ToString(),
            Token = vnp_SecureHash,
            VnPayResponseCode = vnp_ResponseCode
        };
    }
}
