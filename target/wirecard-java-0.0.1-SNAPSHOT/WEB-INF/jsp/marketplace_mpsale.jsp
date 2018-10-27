<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.entity.CreditCardInfo"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.util.UUID"%>
<%@page import="wirecard.core.request.MarketPlaceMpSaleRequest"%>
<%@page import="wirecard.core.entity.CardTokenization"%>
<%@page import="wirecard.core.Settings"%>
<%@page contentType="text/html" pageEncoding="windows-1254"%>
<jsp:include page="layout.jsp" />
<fieldset>
    <legend><label style="font-weight:bold;width:250px;">MarketPlace Bilgileri</label></legend>
    <label style="font-weight:bold;">Servis Adý &nbsp; :   &nbsp; </label> CCMarketPlace<br>
    <label style="font-weight:bold;">Operasyon Adý &nbsp; :&nbsp; </label> MPSale <br>
    <label style="font-weight:bold;">UserCode  &nbsp;:  &nbsp;</label> Wirecard tarafýndan verilen deðer <br>
    <label style="font-weight:bold;">Pin &nbsp;:  &nbsp;</label> Wirecard tarafýndan verilen deðer <br>
    <label style="font-weight:bold;">Fiyat &nbsp;:  &nbsp;</label> 0,01 TL <br>
    <label style="font-weight:bold;">MPAY &nbsp;:  &nbsp;</label> Benzersiz iþlem numarasý. Bu parametre iþlem sonucunda aynen bize geri gönderilir. <br>
    <label style="font-weight:bold;">Ipaddress &nbsp;:  &nbsp;</label>Ýþlem yapan kullanýcýnýn ip adresi<br>
    <label style="font-weight:bold;">Ýþlem Ýçeriði &nbsp;:  &nbsp;</label>Bilgisayar Ödemesi <br>
    <label style="font-weight:bold;">Açýklama &nbsp;:  &nbsp;</label>Ödeme iþleminin tanýmý <br>
    <label style="font-weight:bold;">Ekstra Parametre &nbsp;:  &nbsp;</label>Bu alanýn boþ olarak gönderilmesi gerekmektedir. <br>
    <label style="font-weight:bold;">CCTokenId &nbsp;:  &nbsp;</label>Ödeme iþlemi için kullanýlacak kredi kartý için oluþturulmuþ benzersiz token deðeri<br>
</fieldset>

<br/>
<br/>
<form action="" method="post" class="form-horizontal">
    <fieldset>
        <!-- Form Name -->
        <legend><label style="font-weight:bold;width:250px;">Kart Bilgileri</label></legend>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Kart Sahibi Adý Soyadý:</label>
            <div class="col-md-4">
                <input value="Ahmet Yýlmaz" name="ownerName" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  Kart Numarasý:</label>
            <div class="col-md-4">
                <input value="4282209004348015" name="creditCardNo" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  Son Kullanma Tarihi Ay/Yýl: </label>
            <div class="col-md-4">
                <input value="12" name="expireMonth" class="form-control input-md" width="50px">
                <input value="2022" name="expireYear" class="form-control input-md" width="50px">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  CVC: </label>
            <div class="col-md-4">
                <input value="123" name="cvv" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  SubPartnerId: </label>
            <div class="col-md-4">
                <input value="" name="subPartnerId" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  Taksit Sayýsý: </label>
            <div class="col-md-4">

                <select name="installmentCount">
                    <option value="0">Peþin</option>
                    <option value="3">3</option>
                    <option value="6">6</option>
                    <option value="9">9</option>

                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  Para Birimi: </label>
            <div class="col-md-4">
                <select name="currencyCode">
                    <option value="TRY">TRY</option>
                    <option value="USD">USD</option>
                    <option value="EUR">EUR</option>
                </select>
            </div>
        </div>
    </fieldset>
    <!-- Button -->
    <div class="form-group">
        <label class="col-md-4 control-label" for=""></label>
        <div class="col-md-4">
            <button type="submit" id="" name="" class="btn btn-danger"> 3D Secure Olmadan Ödeme Yap</button>
        </div>
    </div>
</form>
<%
	request.setCharacterEncoding("UTF-8");

	if ("POST".equalsIgnoreCase(request.getMethod())) {
	
		/* 
		   Setting ayarlarýmýzý alýyoruz. Formdan gelen bilgilerle MarketPlaceMpSaleRequest sýnýfýmýzý dolduruyoruz.
		   MarketPlaceMpSaleRequest ve Setting ayarlarýmýzla sayfamýzý post ediyoruz.
		*/
                
                UUID  uuid = UUID.randomUUID();
		Settings settings = new Settings();
		settings.userCode="20923";
                settings.pin="535D7D1B5DA6407EB7F6";
		settings.baseUrl = "https://www.wirecard.com.tr/SGate/Gate"; //"Wirecard web servisleri API url'lerinin bilgisidir. 
		
		MarketPlaceMpSaleRequest marketPlaceMpSaleRequest = new MarketPlaceMpSaleRequest();
                marketPlaceMpSaleRequest.ServiceType = "CCMarketPlace";
                marketPlaceMpSaleRequest.OperationType = "MPSale";
                marketPlaceMpSaleRequest.MPAY = "01";
                marketPlaceMpSaleRequest.CurrencyCode =request.getParameter("currencyCode");
                marketPlaceMpSaleRequest.IPAddress = "127.0.0.1";
                marketPlaceMpSaleRequest.Port = "123";
                marketPlaceMpSaleRequest.Description = "Bilgisayar";
                marketPlaceMpSaleRequest.InstallmentCount =Integer.parseInt(request.getParameter("installmentCount"));
                marketPlaceMpSaleRequest.CommissionRate = 100; //komisyon oraný 1. 100 ile çarpýlýp gönderiliyor
                marketPlaceMpSaleRequest.ExtraParam = "";
                marketPlaceMpSaleRequest.PaymentContent = "BLGSYR01";
                marketPlaceMpSaleRequest.Price = 1;//0,01 TL
                marketPlaceMpSaleRequest.SubPartnerId = Integer.parseInt(request.getParameter("subPartnerId"));
                
                marketPlaceMpSaleRequest.Token = new Token();
                marketPlaceMpSaleRequest.Token.UserCode = settings.userCode;
                marketPlaceMpSaleRequest.Token.Pin = settings.pin;
                
                marketPlaceMpSaleRequest.CreditCardInfo = new CreditCardInfo();
                marketPlaceMpSaleRequest.CreditCardInfo.CreditCardNo =request.getParameter("creditCardNo");
                marketPlaceMpSaleRequest.CreditCardInfo.OwnerName =request.getParameter("ownerName");
                marketPlaceMpSaleRequest.CreditCardInfo.ExpireYear =Integer.parseInt(request.getParameter("expireYear"));
                marketPlaceMpSaleRequest.CreditCardInfo.ExpireMonth =Integer.parseInt(request.getParameter("expireMonth"));
                marketPlaceMpSaleRequest.CreditCardInfo.Cvv =request.getParameter("cvv");
  
                marketPlaceMpSaleRequest.CardTokenization = new CardTokenization();
                marketPlaceMpSaleRequest.CardTokenization.RequestType=0;
                marketPlaceMpSaleRequest.CardTokenization.CustomerId="01";
                marketPlaceMpSaleRequest.CardTokenization.ValidityPeriod=0;
                marketPlaceMpSaleRequest.CardTokenization.CCTokenId="";
                
               
                
		String marketPlaceMpSaleResponse = marketPlaceMpSaleRequest.execute(marketPlaceMpSaleRequest,settings); //"MarketPlace MarketPlaceMpSaleRequest servisi baþlatýlmasý için gerekli servis çaðýrýsýný temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(marketPlaceMpSaleResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"MarketPlace  MarketPlaceMpSaleRequest servis çaðrýsý sonucunda oluþan servis çýktý parametrelerinin ekranda gösterilmesini saðlar"
	}
%>


<jsp:include page="footer.jsp" />