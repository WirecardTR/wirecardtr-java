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
    <label style="font-weight:bold;">Servis Adý &nbsp; :   &nbsp; </label> MerchantQueries<br>
    <label style="font-weight:bold;">Operasyon Adý &nbsp; :&nbsp; </label> BinQueryOperation <br>
    <label style="font-weight:bold;">UserCode  &nbsp;:  &nbsp;</label> Wirecard tarafýndan verilen deðer <br>
    <label style="font-weight:bold;">Pin &nbsp;:  &nbsp;</label> Wirecard tarafýndan verilen deðer <br>
    <label style="font-weight:bold;">BIN &nbsp;:&nbsp;  </label> Kredi kartý numaranýzýn ilk 6 hanesi <br>

    
</fieldset>

<br />
<form action="" method="post" class="form-horizontal">
    <fieldset>
        <!-- Form Name -->
        <legend><label style="font-weight:bold;width:250px;">BIN Sorgulama</label></legend>

        <!-- Text input-->
        
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Kredi kartý numaranýzýn ilk 6 hanesi</label>
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
		   Setting ayarlarýmýzý alýyoruz. Formdan gelen bilgilerle MarketPlaceAddSubMerchantRequest sýnýfýmýzý dolduruyoruz.
		   MarketPlaceAddSubMerchantRequest ve Setting ayarlarýmýzla sayfamýzý post ediyoruz.
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
                

                
                
                String binQueryResponse = binQueryRequest.execute(binQueryRequest,settings); //"Pazaryeri Oluþturma servisi baþlatýlmasý için gerekli servis çaðýrýsýný temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(binQueryResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"Pazaryeri  Oluþturma servis çaðrýsý sonucunda oluþan servis çýktý parametrelerinin ekranda gösterilmesini saðlar"
	}
%>


<jsp:include page="footer.jsp" />