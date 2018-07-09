<jsp:include page="layout.jsp" />
<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.Settings"%>
<%@page import="wirecard.core.request.TokenizeCCRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<h2> Direk kart saklama</h2>


<fieldset>
    <legend><label style="font-weight:bold;width:250px;">Servis bilgileri</label></legend>
    <label style="font-weight:bold;">Servis Adı &nbsp; :   &nbsp; </label> CCTokenizationService<br>
    <label style="font-weight:bold;">Operasyon Adı &nbsp; :&nbsp; </label> TokenizeCC <br>
    <label style="font-weight:bold;">UserCode  &nbsp;:  &nbsp;</label> Wirecard tarafından verilen değer <br>
    <label style="font-weight:bold;">Pin &nbsp;:  &nbsp;</label> Wirecard tarafından verilen değer <br>
    <label style="font-weight:bold;">IPAddress &nbsp;:  &nbsp;</label>İşlem sahibine ait IP adresi <br>
    <label style="font-weight:bold;">ValidityPeriod &nbsp;:  &nbsp;</label>Tokenize edilen sifreli kartın geçerlilik suresi <br>
</fieldset>

<br />
<br />
<form action="" method="post" class="form-horizontal">
    <fieldset>
        <!-- Form Name -->
        <legend><label style="font-weight:bold;width:250px;">Kart Bilgileri</label></legend>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Kart Sahibi Adı Soyadı:</label>
            <div class="col-md-4">
                <input value="Ahmet Yılmaz" name="ownerName" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  Kart Numarası:</label>
            <div class="col-md-4">
                <input value="4282209004348015" name="creditCardNo" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  Son Kullanma Tarihi Ay/Yıl: </label>
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
            <label class="col-md-4 control-label" for="">  CustomerId: </label>
            <div class="col-md-4">
                <input value="" name="customerId" class="form-control input-md">
            </div>
        </div>
    </fieldset>
    <!-- Button -->
    <div class="form-group">
        <label class="col-md-4 control-label" for=""></label>
        <div class="col-md-4">
            <button type="submit" id="" name="" class="btn btn-danger"> Kart Sakla</button>
        </div>
    </div>
</form>
<%
	request.setCharacterEncoding("UTF-8");

	if ("POST".equalsIgnoreCase(request.getMethod())) {
	
		/* 
		   Setting ayarlarımızı alıyoruz. Formdan gelen bilgilerle MarketPlaceSale3DSecRequest sınıfımızı dolduruyoruz.
		   Abonelik ücreti güncelleme ve Setting ayarlarımızla sayfamızı post ediyoruz.
		*/
               
		Settings settings = new Settings();
                
		settings.userCode="";
                settings.pin="";
		settings.baseUrl = "https://www.wirecard.com.tr/SGate/Gate"; //"Wirecard web servisleri API url'lerinin bilgisidir. 
   
		TokenizeCCRequest tokenizeCcUrl = new TokenizeCCRequest();  
                
                tokenizeCcUrl.ServiceType = "CCTokenizationService";
                tokenizeCcUrl.OperationType = "TokenizeCC";
                
                tokenizeCcUrl.CreditCardNumber = request.getParameter("creditCardNo"); 
                tokenizeCcUrl.NameSurname =request.getParameter("ownerName"); 
                tokenizeCcUrl.ExpiryDate =request.getParameter("expireMonth") +"/"+ request.getParameter("expireYear");
                tokenizeCcUrl.CustomerId = request.getParameter("customerId"); 
                tokenizeCcUrl.CVV = request.getParameter("cvv"); 
                tokenizeCcUrl.IPAddress = "";
                tokenizeCcUrl.ValidityPeriod = 20;
                
                tokenizeCcUrl.Token = new Token();
                tokenizeCcUrl.Token.UserCode = settings.userCode;
                tokenizeCcUrl.Token.Pin = settings.pin;
                
                String tokenizeCcUrlResponse = tokenizeCcUrl.execute(tokenizeCcUrl,settings); //"Direk Kart Saklama yöntemi ile kart saklama servisi başlatılması için gerekli servis çağırısını temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(tokenizeCcUrlResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"Direk Kart Saklama yöntemi servis çağrısı sonucunda oluşan servis çıktı parametrelerinin ekranda gösterilmesini sağlar"
	}
%>
<jsp:include page="footer.jsp" />