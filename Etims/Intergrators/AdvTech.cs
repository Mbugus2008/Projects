using Logging;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Etims.Intergrators
{
    public class AdvTech : Intergrators.integrator
    {
        private string Baseurl = "http://167.172.28.175:7000/api/v1";
        private string tin = "P700000001F";
        private string bhfid = "07";
        private string Cmckey = "9181F04676C24ECFB7115AA4BDF0B412CC6230E5B21447DABAA7";
        RestClient client = new RestClient();

        public AdvTech() { }

        public Results<Product> product(ref Product product)
        {
            Products products = new Products()
            {
                tin = tin,
                bhfId = bhfid,
                itemCd = product.itemCode,
                itemClsCd = product.itemClassificationCode,
                itemTyCd = product.itemTypeCode,
                itemNm = product.itemName,
                itemStdNm = null,
                orgnNatCd = "KE",
                pkgUnitCd = "NT",
                qtyUnitCd = "U",
                taxTyCd = "C",
                btchNo = null,
                bcd = null,
                dftPrc = (double)product.defaultPrice,
                grpPrcL1 = (double)product.defaultPrice,
                grpPrcL2 = (double)product.defaultPrice,
                grpPrcL3 = (double)product.defaultPrice,
                grpPrcL4 = (double)product.defaultPrice,
                grpPrcL5 = null,
                addInfo = null,
                sftyQty = null,
                isrcAplcbYn = "N",
                useYn = "Y",
                regrNm = "Admin",
                regrId = "Admin",
                modrNm = "Admin",
                modrId = "Admin"
            };
            var request = new RestRequest($"{Baseurl}/saveItem");
            request.AddHeader("tin", tin);
            request.AddHeader("bhfid", bhfid);
            request.AddHeader("Cmckey", Cmckey);
            request.AddParameter("application/json", JsonConvert.SerializeObject(products), ParameterType.RequestBody);
            IRestResponse response = client.ExecuteAsPost(request, "POST");
            Response<SalesResponse> res = JsonConvert.DeserializeObject<Response<SalesResponse>>(response.Content);
            if (res != null)
            {
                if (res.ResultCd == "000")
                {
                    //product.rcptSign = res.Data.RcptSign;
                    product.Sync = true;

                }
                else { product.Sync = false; product.Msg = res.ResultMsg; }
            }
            return new Results<Product>() { Contents = product };
        }

        public Results<Sale> sales(ref Sale sale)
        {
            Receipt receipt = new Receipt()
            {
                custTin = tin,// "P051139031T",
                custMblNo = null,
                rcptPbctDt = "20240401171902",
                rptNo = sale.invoiceNumber,// 514,
                trdeNm = "",
                adrs = "",
                topMsg = "",
                btmMsg = "",
                prchrAcptcYn = "Y"
            };
            List<Item> items = new List<Item>();
            foreach (var item1 in sale.itemList)
            {
                items.Add(new Item()
                {
                    itemSeq = 1,
                    itemCd = item1.ItemCode,// "KE1NTXU0000001",
                    itemClsCd = item1.ItemClassificationCode,//                    "70161600",
                    itemNm = item1.ItemName,// "Fresh Flowers",
                    bcd = null,
                    pkgUnitCd = "NT",
                    pkg = 1,
                    qtyUnitCd = "U",
                    qty = (int)item1.Quantity,// 1,
                    prc = 116,
                    splyAmt = 116,
                    dcRt = 0,
                    dcAmt = (double)item1.TotalAmount,// 0,
                    isrccCd = null,
                    isrccNm = null,
                    isrcRt = null,
                    isrcAmt = null,
                    taxTyCd = item1.TaxationTypeCode,// "B",
                    taxblAmt = (int)item1.TaxAmount,// 100,
                    taxAmt = 16,
                    totAmt = (double)item1.TotalAmount,// 116
                });
            }

            DateTime now = (DateTime)sale.saleDate;

            AdvTechSale adv = new AdvTechSale()
            {
                salesSttsCd = "02",
                cfmDt = now.ToString("yyyyMMddHHmmss"),// sale.saleDate.ToString(),// "20240401171902",
                salesDt = now.ToString("yyyyMMdd"),// "20240401",
                stockRlsDt = now.ToString("yyyyMMddHHmmss"),//"20240401171902",
                cnclReqDt = null,

                tin = "P700000001F",
                bhfId = "00",
                invcNo = sale.invoiceNumber,
                orgInvcNo = 0,
                custTin = tin,// "P051139031T",
                custNm = "JOYPET LTD",
                salesTyCd = "N",
                rcptTyCd = "S",
                pmtTyCd = "01",

                cnclDt = null,
                rfdDt = null,
                rfdRsnCd = null,
                totItemCnt = 1,
                taxblAmtA = 0,
                taxblAmtB = 100,
                taxblAmtC = 0,
                taxblAmtD = 0,
                taxblAmtE = 0,
                taxRtA = 0,
                taxRtB = 16,
                taxRtC = 0,
                taxRtD = 0,
                taxRtE = 8,
                taxAmtA = 0,
                taxAmtB = 16,
                taxAmtC = 0,
                taxAmtD = 0,
                taxAmtE = 0,
                totTaxblAmt = 116,
                totTaxAmt = 16,
                totAmt = 116,
                prchrAcptcYn = "Y",
                remark = null,
                regrId = "Admin",
                regrNm = "Admin",
                modrId = "Admin",
                modrNm = "Admin",

                receipt = receipt,
                itemList = items
            };


            var request = new RestRequest($"{Baseurl}/saveSale");
            request.AddHeader("tin", tin);
            request.AddHeader("bhfid", bhfid);
            request.AddHeader("Cmckey", Cmckey);
            request.AddParameter("application/json", JsonConvert.SerializeObject(adv), ParameterType.RequestBody);
            IRestResponse response = client.ExecuteAsPost(request, "POST");
            ApiResponse res = JsonConvert.DeserializeObject<ApiResponse>(response.Content);
            if (res != null)
            {
                switch (res.Status)
                {
                    case true:
                        sale.rcptSign = res.Data.CallBackUrlVerificationcall;
                        //sale.intrlData = res.Data.IntrlData;
                        sale.Sync = true; break;
                  
                    case false:
                        sale.Sync = false;
                        sale.Msg = res.Message;
                        if (res.Data.StatusCode == "10010")
                            sale.Sync = true;
                        break;
                }
            }
            return new Results<Sale> { Contents = sale };
        }
    }
    public class ApiResponse
    {
        public bool Status { get; set; }
        public Data Data { get; set; }
        public string Message { get; set; }
    }

    public class Data
    {
        public string KraResponse { get; set; }  // Deserialized JSON within kraResponse
        public string CallBackUrlVerificationcall { get; set; }
        public string KraUrlVerification { get; set; }
        public string StatusCode { get; set; }
        public string InvoiceNumber { get; set; }
        public KraReceiptResponseDto KraReceiptResponseDto { get; set; }
    }

    public class KraResponse
    {
        public string ResultCd { get; set; }
        public string ResultMsg { get; set; }
        public string ResultDt { get; set; }
        public KraData Data { get; set; }
    }

    public class KraReceiptResponseDto
    {
        public string ResultCd { get; set; }
        public string ResultMsg { get; set; }
        public string ResultDt { get; set; }
        public KraData Data { get; set; }
    }

    public class KraData
    {
        public int CurRcptNo { get; set; }
        public int TotRcptNo { get; set; }
        public string IntrlData { get; set; }
        public string RcptSign { get; set; }
        public string SdcDateTime { get; set; }
    }

    public class Response<T>
    {
        public string ResultCd { get; set; }
        public string ResultMsg { get; set; }
        public string ResultDt { get; set; }
        public T Data { get; set; }
    }
    public class SalesResponse
    {
        public int CurRcptNo { get; set; }
        public int TotRcptNo { get; set; }
        public string IntrlData { get; set; }
        public string RcptSign { get; set; }
        public string SdcDateTime { get; set; }
        [JsonIgnore]
        public DateTime SdcDateTimeParsed
        {
            get
            {
                return DateTime.ParseExact(SdcDateTime, "yyyyMMddHHmmss", null);
            }
        }
    }
    public class AdvTechSale
    {
        public string tin { get; set; }
        public string bhfId { get; set; }
        public string invcNo { get; set; }
        public int orgInvcNo { get; set; }
        public string custTin { get; set; }
        public string custNm { get; set; }
        public string salesTyCd { get; set; }
        public string rcptTyCd { get; set; }
        public string pmtTyCd { get; set; }
        public string salesSttsCd { get; set; }
        public string cfmDt { get; set; }

        [JsonIgnore]
        public DateTime CfmDateTime
        {
            get
            {
                return DateTime.ParseExact(cfmDt, "yyyyMMddHHmmss", null);
            }
        }

        public string salesDt { get; set; }

        [JsonIgnore]
        public DateTime SalesDate
        {
            get
            {
                return DateTime.ParseExact(salesDt, "yyyyMMdd", null);
            }
        }

        public string stockRlsDt { get; set; }

        [JsonIgnore]
        public DateTime StockRlsDateTime
        {
            get
            {
                return DateTime.ParseExact(stockRlsDt, "yyyyMMddHHmmss", null);
            }
        }

        public string cnclReqDt { get; set; }
        public string cnclDt { get; set; }
        public string rfdDt { get; set; }
        public string rfdRsnCd { get; set; }
        public int totItemCnt { get; set; }
        public int taxblAmtA { get; set; }
        public int taxblAmtB { get; set; }
        public int taxblAmtC { get; set; }
        public int taxblAmtD { get; set; }
        public int taxblAmtE { get; set; }
        public int taxRtA { get; set; }
        public int taxRtB { get; set; }
        public int taxRtC { get; set; }
        public int taxRtD { get; set; }
        public int taxRtE { get; set; }
        public int taxAmtA { get; set; }
        public int taxAmtB { get; set; }
        public int taxAmtC { get; set; }
        public int taxAmtD { get; set; }
        public int taxAmtE { get; set; }
        public int totTaxblAmt { get; set; }
        public int totTaxAmt { get; set; }
        public int totAmt { get; set; }
        public string prchrAcptcYn { get; set; }
        public string remark { get; set; }
        public string regrId { get; set; }
        public string regrNm { get; set; }
        public string modrId { get; set; }
        public string modrNm { get; set; }
        public Receipt receipt { get; set; }
        public List<Item> itemList { get; set; }
    }
    public class Receipt
    {
        public string custTin { get; set; }
        public string custMblNo { get; set; }
        public string rcptPbctDt { get; set; }

        [JsonIgnore]
        public DateTime RcptPbctDateTime
        {
            get
            {
                return DateTime.ParseExact(rcptPbctDt, "yyyyMMddHHmmss", null);
            }
        }

        public string rptNo { get; set; }
        public string trdeNm { get; set; }
        public string adrs { get; set; }
        public string topMsg { get; set; }
        public string btmMsg { get; set; }
        public string prchrAcptcYn { get; set; }
    }
    public class Item
    {
        public int itemSeq { get; set; }
        public string itemCd { get; set; }
        public string itemClsCd { get; set; }
        public string itemNm { get; set; }
        public string bcd { get; set; }
        public string pkgUnitCd { get; set; }
        public int pkg { get; set; }
        public string qtyUnitCd { get; set; }
        public int qty { get; set; }
        public int prc { get; set; }
        public int splyAmt { get; set; }
        public double dcRt { get; set; }
        public double dcAmt { get; set; }
        public string isrccCd { get; set; }
        public string isrccNm { get; set; }
        public int? isrcRt { get; set; }
        public int? isrcAmt { get; set; }
        public string taxTyCd { get; set; }
        public double taxblAmt { get; set; }
        public double taxAmt { get; set; }
        public double totAmt { get; set; }
    }

    public class Products
    {
        public string tin { get; set; }
        public string bhfId { get; set; }
        public string itemCd { get; set; }
        public string itemClsCd { get; set; }
        public string itemTyCd { get; set; }
        public string itemNm { get; set; }
        public string itemStdNm { get; set; }
        public string orgnNatCd { get; set; }
        public string pkgUnitCd { get; set; }
        public string qtyUnitCd { get; set; }
        public string taxTyCd { get; set; }
        public string btchNo { get; set; }
        public string bcd { get; set; }
        public double dftPrc { get; set; }
        public double grpPrcL1 { get; set; }
        public double grpPrcL2 { get; set; }
        public double grpPrcL3 { get; set; }
        public double grpPrcL4 { get; set; }
        public double? grpPrcL5 { get; set; }
        public string addInfo { get; set; }
        public string sftyQty { get; set; }
        public string isrcAplcbYn { get; set; }
        public string useYn { get; set; }
        public string regrNm { get; set; }
        public string regrId { get; set; }
        public string modrNm { get; set; }
        public string modrId { get; set; }
    }
}
