<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.entity.CreditCardInfo"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.util.UUID"%>
<%@page import="wirecard.core.request.CCProxySale3DRequest"%>
<%@page import="wirecard.core.entity.CardTokenization"%>
<%@page import="wirecard.core.Settings"%>
<jsp:include page="layout.jsp" />
<%@page contentType="text/html" pageEncoding="windows-1254"%>

<h2>CCProxySale 3D Secure</h2>
<br/>
<fieldset>
    <legend><label style="font-weight:bold;width:250px;">Proxy Sale 3D Secure Bilgileri</label></legend>
    <label style="font-weight:bold;">Servis Adý &nbsp; :   &nbsp; </label> CCProxy<br>
    <label style="font-weight:bold;">Operasyon Adý &nbsp; :&nbsp; </label> Sale3DSEC <br>
    <label style="font-weight:bold;">UserCode  &nbsp;:  &nbsp;</label> Wirecard tarafýndan verilen deðer <br>
    <label style="font-weight:bold;">Pin &nbsp;:  &nbsp;</label> Wirecard tarafýndan verilen deðer <br>
    <label style="font-weight:bold;">Fiyat &nbsp;:  &nbsp;</label> 0,01 TL <br>
    <label style="font-weight:bold;">MPAY &nbsp;:  &nbsp;</label> Benzersiz iþlem numarasý. Bu parametre iþlem sonucunda aynen bize geri gönderilir. <br>
    <label style="font-weight:bold;">Ipaddress &nbsp;:  &nbsp;</label>Ýþlem yapan kullanýcýnýn ip adresi<br>
    <label style="font-weight:bold;">Ýþlem Ýçeriði &nbsp;:  &nbsp;</label>Bilgisayar Ödemesi <br>
    <label style="font-weight:bold;">Açýklama &nbsp;:  &nbsp;</label>Ödeme iþleminin tanýmý <br>
    <label style="font-weight:bold;">Ekstra Parametre &nbsp;:  &nbsp;</label>Bu alanýn boþ olarak gönderilmesi gerekmektedir. <br>
    
     
</fieldset>


<form action="" method="post" class="form-horizontal">
    <fieldset>
        <!-- Form Name -->
        <legend><label style="font-weight:bold;width:250px;">Kart Bilgileriyle Ödeme</label></legend>

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
            <button type="submit" id="" name="" class="btn btn-danger"> Ödeme Yap</button>
        </div>
    </div>
</form>

<%
	request.setCharacterEncoding("UTF-8");

	if ("POST".equalsIgnoreCase(request.getMethod())) {
	
		/* 
		   Setting ayarlarýmýzý alýyoruz. Formdan gelen bilgilerle CCProxySale3DRequest sýnýfýmýzý dolduruyoruz.
		   MarketPlaceSale3DSecRequest ve Setting ayarlarýmýzla sayfamýzý post ediyoruz.
		*/
                UUID  uuid = UUID.randomUUID();
		Settings settings = new Settings();    
		settings.userCode="";
                settings.pin="";
		settings.baseUrl = "https://www.wirecard.com.tr/SGate/Gate"; //"Wirecard web servisleri API url'lerinin bilgisidir. 

                
		CCProxySale3DRequest ccProxySale3dRequest = new CCProxySale3DRequest();
                ccProxySale3dRequest.ServiceType = "CCProxy";
                ccProxySale3dRequest.OperationType = "Sale3DSEC";
                ccProxySale3dRequest.MPAY = "";
                ccProxySale3dRequest.CurrencyCode = request.getParameter("currencyCode");
                ccProxySale3dRequest.IPAddress = "127.0.0.8";
                ccProxySale3dRequest.PaymentContent = "BLGSYR01";
                ccProxySale3dRequest.Description = "Bilgisayar";
                ccProxySale3dRequest.InstallmentCount =Integer.parseInt(request.getParameter("installmentCount"));
                ccProxySale3dRequest.ExtraParam = "";
                ccProxySale3dRequest.Port = "123";
                ccProxySale3dRequest.ErrorURL = "http://localhost:8084/wirecard-java/fail.htm";
                ccProxySale3dRequest.SuccessURL = "http://localhost:8084/wirecard-java/success.htm";
                ccProxySale3dRequest.Token = new Token();
                ccProxySale3dRequest.Token.UserCode = settings.userCode;
                ccProxySale3dRequest.Token.Pin = settings.pin;
                
                ccProxySale3dRequest.CreditCardInfo = new CreditCardInfo();
                ccProxySale3dRequest.CreditCardInfo.CreditCardNo =request.getParameter("creditCardNo");
                ccProxySale3dRequest.CreditCardInfo.OwnerName =request.getParameter("ownerName");
                ccProxySale3dRequest.CreditCardInfo.ExpireYear =Integer.parseInt(request.getParameter("expireYear"));
                ccProxySale3dRequest.CreditCardInfo.ExpireMonth =Integer.parseInt(request.getParameter("expireMonth"));
                ccProxySale3dRequest.CreditCardInfo.Cvv =request.getParameter("cvv");
                ccProxySale3dRequest.CreditCardInfo.Price = 1;//0,01 TL
                
                ccProxySale3dRequest.CustomerInfo = new CustomerInfo();
                ccProxySale3dRequest.CustomerInfo.CustomerName = "ahmet";
                ccProxySale3dRequest.CustomerInfo.CustomerSurname = "yýlmaz";
                ccProxySale3dRequest.CustomerInfo.CustomerEmail = "ahmet.yilmaz@gmail.com";


                ccProxySale3dRequest.Language = "TR";
                
                ccProxySale3dRequest.CardTokenization = new CardTokenization();
                ccProxySale3dRequest.CardTokenization.RequestType=0;
                ccProxySale3dRequest.CardTokenization.CustomerId="01";
                ccProxySale3dRequest.CardTokenization.ValidityPeriod=0;
                ccProxySale3dRequest.CardTokenization.CCTokenId="";
		String ccProxySale3dResponse = ccProxySale3dRequest.execute(ccProxySale3dRequest,settings); //"Ödeme Formu ödeme servisi baþlatýlmasý için gerekli servis çaðýrýsýný temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(ccProxySale3dResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"Ödeme Formu ödeme servis çaðrýsý sonucunda oluþan servis çýktý parametrelerinin ekranda gösterilmesini saðlar"
	}
%>
<jsp:include page="footer.jsp" />