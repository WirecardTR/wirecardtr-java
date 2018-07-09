<jsp:include page="layout.jsp" />
<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.Settings"%>
<%@page import="wirecard.core.request.SubScriberChangePriceRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<h2> Abonelik Ücreti Değiştirme</h2>


<form action="" method="post">
    <!-- Text input-->
    <div class="form-group">
        <div class="row">

            <label class="col-md-12 control-label" for="">Abonelik Numarası</label>
            <div class="col-md-3">
                <input name="subscriberId" type="text" value=""  class="form-control" required="">
            </div>
        </div>
         <div class="row">

            <label class="col-md-12 control-label" for="">Abonelik Ücreti</label>
            <div class="col-md-3">
                <input name="price" type="text" value=""  class="form-control" required="">
            </div>
        </div>
        <div class="row">
            <label class="col-md-12 control-label" for=""></label>
            <div class="col-md-4">
                <br />
                <button type="submit" id="" name="" class="btn btn-danger">Abonelik Ücretini Güncelle </button>
            </div>
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
                
		settings.userCode="20923";
                settings.pin="535D7D1B5DA6407EB7F6";
		settings.baseUrl = "https://www.wirecard.com.tr/SGate/Gate"; //"Wirecard web servisleri API url'lerinin bilgisidir. 
   
		SubScriberChangePriceRequest subScriberChangePrice = new SubScriberChangePriceRequest();  
                
                subScriberChangePrice.ServiceType = "SubscriberManagementService";
                subScriberChangePrice.OperationType = "ChangePriceBySubscriber";
              
                subScriberChangePrice.Description = "Odeme Guncelleme";
               
                subScriberChangePrice.Price = request.getParameter("price"); 
                subScriberChangePrice.SubscriberId = request.getParameter("subscriberId");
                subScriberChangePrice.ValidFrom="20190703";
                subScriberChangePrice.Token = new Token();
                subScriberChangePrice.Token.UserCode = settings.userCode;
                subScriberChangePrice.Token.Pin = settings.pin;
                
                String subScriberChangePriceResponse = subScriberChangePrice.execute(subScriberChangePrice,settings); //"Abonelik ücreti güncelleme servisi başlatılması için gerekli servis çağırısını temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(subScriberChangePriceResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"Abonelik ücreti güncelleme servis çağrısı sonucunda oluşan servis çıktı parametrelerinin ekranda gösterilmesini sağlar"
	}
%>
<jsp:include page="footer.jsp" />