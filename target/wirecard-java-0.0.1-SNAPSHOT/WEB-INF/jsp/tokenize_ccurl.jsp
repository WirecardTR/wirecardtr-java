<jsp:include page="layout.jsp" />
<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.Settings"%>
<%@page import="wirecard.core.request.TokenizeCCURLRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<h2> Url Yöntemi ile kart saklama</h2>


<fieldset>
    <legend><label style="font-weight:bold;width:250px;">Servis bilgileri</label></legend>
    <label style="font-weight:bold;">Servis Adı &nbsp; :   &nbsp; </label> WDTicket<br>
    <label style="font-weight:bold;">Operasyon Adı &nbsp; :&nbsp; </label> TokenizeCCURL <br>
    <label style="font-weight:bold;">UserCode  &nbsp;:  &nbsp;</label> Wirecard tarafından verilen değer <br>
    <label style="font-weight:bold;">Pin &nbsp;:  &nbsp;</label> Wirecard tarafından verilen değer <br>
    <label style="font-weight:bold;">ErrorURL &nbsp;:  &nbsp;</label> İşlem hatalı gerçekleşirse yönlendirilecek olan sayfa <br>
    <label style="font-weight:bold;">SuccessURL &nbsp;:  &nbsp;</label> İşlem başarılı gerçekleşirse yönlendirilecek olan sayfa <br>
    <label style="font-weight:bold;">CustomerId &nbsp;:  &nbsp;</label> Bu alan kredi kartıyla sizin istediğiniz degerler arasında iletisim kurulması için kullanılır. Kredi kartıyla fatura ödemesi, kredi kartıyla sipariş numarasında eşleşme için yada boş gönderilebilir. <br>
    <label style="font-weight:bold;">IPAddress &nbsp;:  &nbsp;</label>İşlem sahibine ait IP adresi <br>
    <label style="font-weight:bold;">ValidityPeriod &nbsp;:  &nbsp;</label>Tokenize edilen sifreli kartın geçerlilik suresi <br>

</fieldset>

<br />
<br />
<form action="" method="post" class="form-horizontal">
    <fieldset>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  CustomerId: </label>
            <div class="col-md-4">
                <input required="" value="" name="customerId" class="form-control input-md">
            </div>
        </div>

    </fieldset>
    <!-- Button -->
    <div class="form-group">
        <label class="col-md-4 control-label" for=""></label>
        <div class="col-md-4">
            <button type="submit" id="" name="" class="btn btn-danger">Url yöntemi ile kartı sakla</button>
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
   
		TokenizeCCURLRequest tokenizeCcUrl = new TokenizeCCURLRequest();  
                
                tokenizeCcUrl.ServiceType = "WDTicket";
                tokenizeCcUrl.OperationType = "TokenizeCCURL";
                tokenizeCcUrl.ErrorURL = "http://localhost:8084/wirecard-java/tokenizeerror.htm";
                tokenizeCcUrl.SuccessURL = "http://localhost:8084/wirecard-java/tokenizesuccess.htm";
                tokenizeCcUrl.CustomerId = request.getParameter("customerId"); 
                tokenizeCcUrl.IPAddress = "";
                tokenizeCcUrl.ValidityPeriod = 20;
                tokenizeCcUrl.Token = new Token();
                tokenizeCcUrl.Token.UserCode = settings.userCode;
                tokenizeCcUrl.Token.Pin = settings.pin;
                
                String tokenizeCcUrlResponse = tokenizeCcUrl.execute(tokenizeCcUrl,settings); //"Url yöntemi ile kart saklama servisi başlatılması için gerekli servis çağırısını temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(tokenizeCcUrlResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"Url yöntemi ile kart saklama servis çağrısı sonucunda oluşan servis çıktı parametrelerinin ekranda gösterilmesini sağlar"
	}
%>
<jsp:include page="footer.jsp" />