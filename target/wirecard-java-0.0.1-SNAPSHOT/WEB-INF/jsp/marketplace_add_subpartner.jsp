<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.entity.ContactInfo"%>
<%@page import="wirecard.core.entity.FinancialInfo"%>
<%@page import="wirecard.core.entity.AuthSignatoryInfo"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%> 
<%@page import="wirecard.core.request.MarketPlaceAddSubMerchantRequest"%>
<%@page import="wirecard.core.Settings"%>
<%@page import="java.util.UUID"%>
<jsp:include page="layout.jsp" />
<%@page contentType="text/html" pageEncoding="windows-1254"%>
<h2>Pazaryeri Oluþturma</h2>


<fieldset>
    <legend><label style="font-weight:bold;width:250px;">MarketPlace Bilgileri</label></legend>
    <label style="font-weight:bold;">Servis Adý &nbsp; :   &nbsp; </label> CCMarketPlace<br>
    <label style="font-weight:bold;">Operasyon Adý &nbsp; :&nbsp; </label> AddSubPartner <br>
    <label style="font-weight:bold;">UserCode  &nbsp;:  &nbsp;</label> Wirecard tarafýndan verilen deðer <br>
    <label style="font-weight:bold;">Pin &nbsp;:  &nbsp;</label> Wirecard tarafýndan verilen deðer <br>
    <label style="font-weight:bold;">UniqueId &nbsp;:&nbsp;  </label> benzersiz id deðeri <br>
    <label style="font-weight:bold;">Ýþ Telefonu &nbsp;: &nbsp; </label>2121111111 <br>
    <label style="font-weight:bold;">Vergi Dairesi &nbsp;: &nbsp; </label>Ýstanbul <br>
    <label style="font-weight:bold;">Vergi Numarasý &nbsp;: &nbsp; </label>11111111111 <br>
    <label style="font-weight:bold;">Banka Adý &nbsp;: &nbsp; </label>Ziraat Bankasý <br>
    <label style="font-weight:bold;">IBAN &nbsp;: &nbsp; </label>TR330006100519786457841326 <br>
    <label style="font-weight:bold;">Banka Hesap Adý &nbsp;: &nbsp; </label>Fatih Coþkun <br>
    <label style="font-weight:bold;">Maðaza Ülkesi&nbsp;:&nbsp;</label>TR<br>
    <label style="font-weight:bold;">Maðaza Þehri &nbsp;</label>&nbsp; 34<br>
    <label style="font-weight:bold;">Maðaza Açýk Adresi</label>Gayrettepe Mh. Yýldýz Posta Cd. D Plaza No:52 K:6 34349 Beþiktaþ / Ýstanbul<br>
    <label style="font-weight:bold;">Ýmza Yetkilisi Adý &nbsp;: &nbsp; </label>Ahmet<br>
    <label style="font-weight:bold;">Ýmza Yetkilisi Soyadý &nbsp;: &nbsp;</label>Yýlmaz<br>
    <label style="font-weight:bold;">Ýmza Yetkilisi Doðum Tarihi &nbsp;: &nbsp;</label>1970/10/29<br>
    
</fieldset>

<br />
<form action="" method="post" class="form-horizontal">
    <fieldset>
        <!-- Form Name -->
        <legend><label style="font-weight:bold;width:250px;">Market Place Detaylarý</label></legend>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Maðaza Tipi:</label>
            <div class="col-md-4">
               
                <select name="subPartnerType">
                    <option value="Individual">Individual - Þahýs firmasý</option>
                    <option value="PrivateCompany">PrivateCompany - Özel þirket</option>
                    <option value="Corporation">Corporation - Kurumsal</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Maðaza Adý</label>
            <div class="col-md-4">
                <input  name="name" class="form-control input-md">
            </div>
        </div>
     
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Maðazaya veya maðaza yetkilisine ait mobil telefon</label>
            <div class="col-md-4">
                <input name="mobilePhoneNumber" class="form-control input-md">
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-4 control-label" for="">Maðazaya veya maðaza yetkilisine ait email adresi</label>
            <div class="col-md-4">
                <input name="emailAddress" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Fatura email adresi</label>
            <div class="col-md-4">
                <input name="invoiceEmailAddress" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Maðaza sahibine veya yetkilisine ait TC kimlik numarasý</label>
            <div class="col-md-4">
                <input name="identityNumber" class="form-control input-md">
            </div>
        </div>

    </fieldset>

   
    <!-- Button -->
    <div class="form-group">
        <label class="col-md-4 control-label" for=""></label>
        <div class="col-md-4">
            <button type="submit" id="" name="" class="btn btn-success">Maðaza Oluþtur</button>
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
		
		MarketPlaceAddSubMerchantRequest marketPlaceAddSubMerchantRequest = new MarketPlaceAddSubMerchantRequest();  
                
                
                
                marketPlaceAddSubMerchantRequest.ServiceType="CCMarketPlace";
		marketPlaceAddSubMerchantRequest.OperationType="AddSubPartner";   
                marketPlaceAddSubMerchantRequest.UniqueId = "123456";
                marketPlaceAddSubMerchantRequest.SubPartnerType=request.getParameter("subPartnerType");
                marketPlaceAddSubMerchantRequest.Name=request.getParameter("name");
                marketPlaceAddSubMerchantRequest.BranchName=request.getParameter("name");
                
                
                marketPlaceAddSubMerchantRequest.Token= new Token();
                marketPlaceAddSubMerchantRequest.Token.Pin=settings.pin;
                marketPlaceAddSubMerchantRequest.Token.UserCode=settings.userCode;
                
                
                marketPlaceAddSubMerchantRequest.ContactInfo= new ContactInfo();
                marketPlaceAddSubMerchantRequest.ContactInfo.Country = "TR";
                marketPlaceAddSubMerchantRequest.ContactInfo.City = "34";
                marketPlaceAddSubMerchantRequest.ContactInfo.Address = "Gayrettepe Mh. Yýldýz Posta Cd. D Plaza No:52 K:6 34349 Beþiktaþ / Ýstanbul";
                marketPlaceAddSubMerchantRequest.ContactInfo.MobilePhone =request.getParameter("mobilePhoneNumber");
                marketPlaceAddSubMerchantRequest.ContactInfo.BusinessPhone = "2121111111";
                marketPlaceAddSubMerchantRequest.ContactInfo.Email =request.getParameter("emailAddress");
                marketPlaceAddSubMerchantRequest.ContactInfo.InvoiceEmail =request.getParameter("invoiceEmailAddress");
                
                
                marketPlaceAddSubMerchantRequest.FinancialInfo = new FinancialInfo();
                marketPlaceAddSubMerchantRequest.FinancialInfo.IdentityNumber =request.getParameter("identityNumber");
                marketPlaceAddSubMerchantRequest.FinancialInfo.TaxOffice = "Ýstanbul";
                marketPlaceAddSubMerchantRequest.FinancialInfo.TaxNumber = "11111111111";
                marketPlaceAddSubMerchantRequest.FinancialInfo.BankName = "0012";
                marketPlaceAddSubMerchantRequest.FinancialInfo.IBAN = "TR330006100519786457841326";
                
                marketPlaceAddSubMerchantRequest.AuthSignatoryInfo = new AuthSignatoryInfo();
                marketPlaceAddSubMerchantRequest.AuthSignatoryInfo.Name = "Ahmet";
                marketPlaceAddSubMerchantRequest.AuthSignatoryInfo.Surname = "Yaþar";
                marketPlaceAddSubMerchantRequest.AuthSignatoryInfo.BirthDate = date;

                

                
                
                String marketPlaceAddSubMerchantResponse = marketPlaceAddSubMerchantRequest.execute(marketPlaceAddSubMerchantRequest,settings); //"Pazaryeri Oluþturma servisi baþlatýlmasý için gerekli servis çaðýrýsýný temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(marketPlaceAddSubMerchantResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"Pazaryeri  Oluþturma servis çaðrýsý sonucunda oluþan servis çýktý parametrelerinin ekranda gösterilmesini saðlar"
	}
%>


<jsp:include page="footer.jsp" />