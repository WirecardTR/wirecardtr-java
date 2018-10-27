<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.entity.CreditCardInfo"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.request.MarketPlaceWDTicketMpSale3dSecureRequest"%>
<%@page import="wirecard.core.Settings"%>
<%@page import="java.util.UUID"%>
<%@page contentType="text/html" pageEncoding="windows-1254"%>
<jsp:include page="layout.jsp" />
<fieldset>
    <legend><label style="font-weight:bold;width:250px;">Ödeme Bilgileri</label></legend>
    <label style="font-weight:bold;">Servis Adý &nbsp; :   &nbsp; </label> WDTicket<br>
    <label style="font-weight:bold;">Operasyon Adý &nbsp; :&nbsp; </label> MPSale3DSECWithUrl <br>
    <label style="font-weight:bold;">UserCode  &nbsp;:  &nbsp;</label> Wirecard tarafýndan verilen deðer <br>
    <label style="font-weight:bold;">Pin &nbsp;:  &nbsp;</label> Wirecard tarafýndan verilen deðer <br>
    <label style="font-weight:bold;">Fiyat &nbsp;:  &nbsp;</label> 0,01 TL <br>
    <label style="font-weight:bold;">MPAY &nbsp;:  &nbsp;</label> Benzersiz iþlem numarasý. Bu parametre iþlem sonucunda aynen bize geri gönderilir. <br>
    <label style="font-weight:bold;">Ýþlem Ýçeriði &nbsp;:  &nbsp;</label>Bilgisayar Ödemesi <br>
    <label style="font-weight:bold;">Comission Rate &nbsp;:  &nbsp;</label>1 <br>
    <label style="font-weight:bold;">Açýklama &nbsp;:  &nbsp;</label>Ödeme iþleminin tanýmý <br>
    <label style="font-weight:bold;">Ekstra Parametre &nbsp;:  &nbsp;</label>Bu alanýn boþ olarak gönderilmesi gerekmektedir. <br>
</fieldset>

<br />
<br />
<form action="" method="post" class="form-horizontal">
    <fieldset>
     
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  SubPartnerId: </label>
            <div class="col-md-4">
                <input value="" name="subPartnerId" class="form-control input-md">
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
            <button type="submit" id="" name="" class="btn btn-danger"> Ortak ödeme formu ile ödeme yap</button>
        </div>
    </div>
</form>

<%
	request.setCharacterEncoding("UTF-8");

	if ("POST".equalsIgnoreCase(request.getMethod())) {
	
		/* 
		   Setting ayarlarýmýzý alýyoruz. Formdan gelen bilgilerle MarketPlaceSale3DSecRequest sýnýfýmýzý dolduruyoruz.
		   MarketPlaceSale3DSecRequest ve Setting ayarlarýmýzla sayfamýzý post ediyoruz.
		*/
                UUID  uuid = UUID.randomUUID();
		Settings settings = new Settings();
                
		settings.userCode="20923";
                settings.pin="535D7D1B5DA6407EB7F6";
		settings.baseUrl = "https://www.wirecard.com.tr/SGate/Gate"; //"Wirecard web servisleri API url'lerinin bilgisidir. 
   
		MarketPlaceWDTicketMpSale3dSecureRequest marketPlaceSale3DSecRequest = new MarketPlaceWDTicketMpSale3dSecureRequest();  
                
                marketPlaceSale3DSecRequest.ServiceType = "WDTicket";
                marketPlaceSale3DSecRequest.OperationType = "MPSale3DSECWithUrl";
                marketPlaceSale3DSecRequest.MPAY = "";
                marketPlaceSale3DSecRequest.CurrencyCode =request.getParameter("currencyCode");
                marketPlaceSale3DSecRequest.Description = "Bilgisayar";
                marketPlaceSale3DSecRequest.CommissionRate = 100; //komisyon oraný 1. 100 ile çarpýlýp gönderiliyor
                marketPlaceSale3DSecRequest.Price = 1; //komisyon oraný 1. 100 ile çarpýlýp gönderiliyor
                marketPlaceSale3DSecRequest.ExtraParam = "";
                marketPlaceSale3DSecRequest.PaymentContent = "BLGSYR01";
                marketPlaceSale3DSecRequest.SubPartnerId =Integer.parseInt(request.getParameter("subPartnerId"));
                marketPlaceSale3DSecRequest.ErrorURL = "http://localhost:8084/wirecard-java/fail.htm";
                marketPlaceSale3DSecRequest.SuccessURL = "http://localhost:8084/wirecard-java/success.htm";
                
                marketPlaceSale3DSecRequest.Token = new Token();
                marketPlaceSale3DSecRequest.Token.UserCode = settings.userCode;
                marketPlaceSale3DSecRequest.Token.Pin = settings.pin;
                
                String marketPlaceSale3DSecResponse = marketPlaceSale3DSecRequest.execute(marketPlaceSale3DSecRequest,settings); //"Pazaryeri 3DSecure servisi baþlatýlmasý için gerekli servis çaðýrýsýný temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(marketPlaceSale3DSecResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"MarketPlace  3DSecure servis çaðrýsý sonucunda oluþan servis çýktý parametrelerinin ekranda gösterilmesini saðlar"
	}
%>
<jsp:include page="footer.jsp" />