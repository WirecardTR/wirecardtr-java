<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.entity.ContactInfo"%>
<%@page import="wirecard.core.entity.FinancialInfo"%>
<%@page import="wirecard.core.entity.AuthSignatoryInfo"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%> 
<%@page import="wirecard.core.request.BinQueryRequest"%>
<%@page import="wirecard.core.Settings"%>
<%@page import="java.util.UUID"%>
<jsp:include page="layout.jsp" />
<%@page contentType="text/html" pageEncoding="windows-1254"%>
<h2>BIN Sorgulama</h2>


<fieldset>
    <legend><label style="font-weight:bold;width:250px;">BIN Sorgulama Bilgileri</label></legend>
    <label style="font-weight:bold;">Servis Ad� &nbsp; :   &nbsp; </label> MerchantQueries<br>
    <label style="font-weight:bold;">Operasyon Ad� &nbsp; :&nbsp; </label> BinQueryOperation <br>
    <label style="font-weight:bold;">UserCode  &nbsp;:  &nbsp;</label> Wirecard taraf�ndan verilen de�er <br>
    <label style="font-weight:bold;">Pin &nbsp;:  &nbsp;</label> Wirecard taraf�ndan verilen de�er <br>
    <label style="font-weight:bold;">BIN &nbsp;:&nbsp;  </label> Kredi kart� numaran�z�n ilk 6 hanesi <br>

    
</fieldset>

<br />
<form action="" method="post" class="form-horizontal">
    <fieldset>
        <!-- Form Name -->
        <legend><label style="font-weight:bold;width:250px;">BIN Sorgulama</label></legend>

        <!-- Text input-->
        
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Kredi kart� numaran�z�n ilk 6 hanesi</label>
            <div class="col-md-4">
                <input  name="bin" class="form-control input-md">
            </div>
        </div>
     
        

    </fieldset>

   
    <!-- Button -->
    <div class="form-group">
        <label class="col-md-4 control-label" for=""></label>
        <div class="col-md-4">
            <button type="submit" id="" name="" class="btn btn-success">BIN Sorgula</button>
        </div>
    </div>
</form>

<%
	request.setCharacterEncoding("UTF-8");

	if ("POST".equalsIgnoreCase(request.getMethod())) {
	
		/* 
		   Setting ayarlar�m�z� al�yoruz. Formdan gelen bilgilerle MarketPlaceAddSubMerchantRequest s�n�f�m�z� dolduruyoruz.
		   MarketPlaceAddSubMerchantRequest ve Setting ayarlar�m�zla sayfam�z� post ediyoruz.
		*/
                Date myDate = new Date();
                String date=new SimpleDateFormat("yyyy-MM-dd").format(myDate);
                
		Settings settings = new Settings();
		settings.userCode="";
                settings.pin="";
		settings.baseUrl = "https://www.wirecard.com.tr/SGate/Gate"; //"Wirecard web servisleri API url'lerinin bilgisidir. 
		
		BinQueryRequest binQueryRequest = new BinQueryRequest();  
                
                
                
                binQueryRequest.ServiceType="MerchantQueries";
		binQueryRequest.OperationType="BinQueryOperation";   
                binQueryRequest.BIN = request.getParameter("bin");
                
                
                
                binQueryRequest.Token= new Token();
                binQueryRequest.Token.Pin=settings.pin;
                binQueryRequest.Token.UserCode=settings.userCode;
                

                
                
                String binQueryResponse = binQueryRequest.execute(binQueryRequest,settings); //"Pazaryeri Olu�turma servisi ba�lat�lmas� i�in gerekli servis �a��r�s�n� temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(binQueryResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"Pazaryeri  Olu�turma servis �a�r�s� sonucunda olu�an servis ��kt� parametrelerinin ekranda g�sterilmesini sa�lar"
	}
%>


<jsp:include page="footer.jsp" />