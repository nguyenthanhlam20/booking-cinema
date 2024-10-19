using System.Net.Http;

namespace Services.VNPays;
public interface IVNPayService
{
    string CreatePaymentUrl(HttpContext context, VnPaymentRequestModel model);
    VnPaymentResponseModel PaymentExecute(IQueryCollection collections);
}
