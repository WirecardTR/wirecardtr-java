<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.request.MarketplaceReleasePaymentRequest"%>
<%@page import="wirecard.core.Settings"%>
<%@page import="java.util.UUID"%>

<jsp:include page="layout.jsp" />
<%@page contentType="text/html" pageEncoding="windows-1254"%>
<fieldset>
    <legend><label style="font-weight:bold;width:250px;">Release Payment </label></legend>
    <label style="font-weight:bold;">Servis Ad� &nbsp; :   &nbsp; </label> CCMarketPlace<br>
    <label style="font-weight:bold;">Operasyon Ad� &nbsp; :&nbsp; </label> ReleasePayment <br>
    <label style="font-weight:bold;">UserCode  &nbsp;:  &nbsp;</label> Wirecard taraf�ndan verilen de�er <br>
    <label style="font-weight:bold;">Pin &nbsp;:  &nbsp;</label> Wirecard taraf�ndan verilen de�er <br>
    <label style="font-weight:bold;">Komisyon Oran� &nbsp;:  &nbsp;</label> 100 //1*100 komisyon oran� 100 ile �arp�larak g�nderilir. <br>
    <label style="font-weight:bold;">MPAY &nbsp;:  &nbsp;</label> �deme esnas�nda g�nderilen MPay de�eri eklenmelidir. <br>
    <label style="font-weight:bold;">OrderId &nbsp;:  &nbsp;</label> �demenin Benzersiz Id de�eri <br>
    <label style="font-weight:bold;">A��klama &nbsp;:  &nbsp;</label> Bilgisayar �demesi <br>
</fieldset>

<br />
<br />
<form action="" method="post" class="form-horizontal">
    <fieldset>
        <!-- Form Name -->
        <legend><label style="font-weight:bold;width:250px;">SubPartner Bilgileri</label></legend>
        <!-- Text input-->   
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  SubPartnerId: </label>
            <div class="col-md-4">
                <input value="" name="subPartnerId" class="form-control input-md">
            </div>
        </div>

    </fieldset>
    <!-- Button -->
    <div class="form-group">
        <label class="col-md-4 control-label" for=""></label>
        <div class="col-md-4">
            <button type="submit" id="" name="" class="btn btn-danger"> �deme Onay� Ver</button>
        </div>
    </div>
</form>
<%
	request.setCharacterEncoding("UTF-8");

	if ("POST".equalsIgnoreCase(request.getMethod())) {
                String guid = UUID.randomUUID().toString();
		/* 
		   Setting ayarlar�m�z� al�yoruz. Formdan gelen bilgilerle MarketplaceReleasePaymentRequest s�n�f�m�z� dolduruyoruz.
		   MarketplaceReleasePaymentRequest ve Setting ayarlar�m�zla sayfam�z� post ediyoruz.
		*/
		Settings settings = new Settings();
		settings.userCode="";
                settings.pin="";
		settings.baseUrl = "https://www.wirecard.com.tr/SGate/Gate"; //"Wirecard web servisleri API url'lerinin bilgisidir. 
		
		MarketplaceReleasePaymentRequest marketplaceReleasePaymentRequest = new MarketplaceReleasePaymentRequest();  
                
                marketplaceReleasePaymentRequest.ServiceType = "CCMarketPlace";
                marketplaceReleasePaymentRequest.OperationType = "ReleasePayment";
               
                marketplaceReleasePaymentRequest.Token = new Token();
                marketplaceReleasePaymentRequest.Token.UserCode = settings.userCode;
                marketplaceReleasePaymentRequest.Token.Pin = settings.pin;
                marketplaceReleasePaymentRequest.SubPartnerId = Integer.parseInt(request.getParameter("subPartnerId"));
                marketplaceReleasePaymentRequest.CommissionRate = 100; //%1
                marketplaceReleasePaymentRequest.MPAY = "";
                marketplaceReleasePaymentRequest.OrderId=guid;
                marketplaceReleasePaymentRequest.Description = "Bilgisayar �demesi";
  
		String marketplaceReleasePaymentResponse = MarketplaceReleasePaymentRequest.execute(marketplaceReleasePaymentRequest,settings); //"MarketPlace ReleasePayment servisi ba�lat�lmas� i�in gerekli servis �a��r�s�n� temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(marketplaceReleasePaymentResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"MarketPlace  ReleasePayment servis �a�r�s� sonucunda olu�an servis ��kt� parametrelerinin ekranda g�sterilmesini sa�lar"
                
        }
%>
<jsp:include page="footer.jsp" />