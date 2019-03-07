<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.entity.ContactInfo"%>
<%@page import="wirecard.core.entity.FinancialInfo"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.request.MarketPlaceUpdateSubMerchantRequest"%>
<%@page import="wirecard.core.Settings"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%> 
<%@page import="wirecard.core.entity.AuthSignatoryInfo"%>

<jsp:include page="layout.jsp" />
<%@page contentType="text/html" pageEncoding="windows-1254"%>
<!DOCTYPE html>

<h2>Pazaryeri Güncelleme (Belge Ýle Doðrulama)</h2>


<fieldset>
    <legend><label style="font-weight:bold;width:250px;">MarketPlace Bilgileri</label></legend>
    <label style="font-weight:bold;">Servis Adý &nbsp; :   &nbsp; </label> CCMarketPlace<br>
    <label style="font-weight:bold;">Operasyon Adý &nbsp; :&nbsp; </label> UpdateSubPartner <br>
    <label style="font-weight:bold;">UserCode  &nbsp;:  &nbsp;</label> Wirecard tarafýndan verilen deðer <br>
    <label style="font-weight:bold;">Pin &nbsp;:  &nbsp;</label> Wirecard tarafýndan verilen deðer <br>
    <label style="font-weight:bold;">UniqueId &nbsp;:&nbsp;  </label> benzersiz id deðeri <br>
    <label style="font-weight:bold;">Ýþ Telefonu &nbsp;: &nbsp; </label>2121111111 <br>
    <label style="font-weight:bold;">Vergi Dairesi &nbsp;: &nbsp; </label>Ýstanbul <br>
    <label style="font-weight:bold;">Vergi Numarasý &nbsp;: &nbsp; </label>11111111111 <br>
    <label style="font-weight:bold;">Banka Adý &nbsp;: &nbsp; </label>Ziraat Bankasý <br>
    <label style="font-weight:bold;">IBAN &nbsp;: &nbsp; </label>TR330006100519786457841326 <br>
    <label style="font-weight:bold;">Banka Hesap Adý &nbsp;: &nbsp; </label>Fatih Coþkun <br>
    <label style="font-weight:bold;">Maðaza Ülkesi: &nbsp; : &nbsp;</label>TR<br>
    <label style="font-weight:bold;">Maðaza Þehri: &nbsp;</label>&nbsp; 34<br>
    <label style="font-weight:bold;">Maðaza Açýk Adresi &nbsp;: &nbsp;</label>Gayrettepe Mh. Yýldýz Posta Cd. D Plaza No:52 K:6 34349 Beþiktaþ / Ýstanbul<br>
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
                <input name="name" class="form-control input-md">
            </div>
        </div>


        <div class="form-group">
            <label class="col-md-4 control-label" for="">Maðazaya veya maðaza yetkilisine ait mobil telefon</label>
            <div class="col-md-4">
                <input name="mobilePhoneNumber" class="form-control input-md" required="">
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
                <input name="identityNumber" class="form-control input-md" required="">
            </div>
        </div>
         <div class="form-group">
            <label class="col-md-4 control-label" for="">SubPartner Id</label>
            <div class="col-md-4">
                <input name="subPartnerId" class="form-control input-md" required="">
            </div>
        </div>

    </fieldset>


    <!-- Button -->
    <div class="form-group">
        <label class="col-md-4 control-label" for=""></label>
        <div class="col-md-4">
            <button type="submit" id="" name="" class="btn btn-success">Maðaza Güncelle</button>
        </div>
    </div>
</form>
<%
	request.setCharacterEncoding("UTF-8");

	if ("POST".equalsIgnoreCase(request.getMethod())) {
	
		/* 
		   Setting ayarlarýmýzý alýyoruz. Formdan gelen bilgilerle MarketPlaceUpdateSubMerchantRequest sýnýfýmýzý dolduruyoruz.
		   MarketPlaceUpdateSubMerchantRequest ve Setting ayarlarýmýzla sayfamýzý post ediyoruz.
		*/
                Date myDate = new Date();
                String date=new SimpleDateFormat("yyyy-MM-dd").format(myDate);
                
		Settings settings = new Settings();
		settings.userCode="";
                settings.pin="";
		settings.baseUrl = "https://www.wirecard.com.tr/SGate/Gate"; //"Wirecard web servisleri API url'lerinin bilgisidir. 
		
		MarketPlaceUpdateSubMerchantRequest marketPlaceUpdateSubMerchantRequest = new MarketPlaceUpdateSubMerchantRequest();  
                
                
                
                marketPlaceUpdateSubMerchantRequest.ServiceType="CCMarketPlace";
		marketPlaceUpdateSubMerchantRequest.OperationType="UpdateSubPartner";   
                marketPlaceUpdateSubMerchantRequest.UniqueId = "123456";
                marketPlaceUpdateSubMerchantRequest.SubPartnerType=request.getParameter("subPartnerType");
                marketPlaceUpdateSubMerchantRequest.Name=request.getParameter("name");
                marketPlaceUpdateSubMerchantRequest.BranchName=request.getParameter("name");
                marketPlaceUpdateSubMerchantRequest.SubPartnerId=Integer.parseInt(request.getParameter("subPartnerId"));
                
                
                marketPlaceUpdateSubMerchantRequest.Token= new Token();
                marketPlaceUpdateSubMerchantRequest.Token.Pin=settings.pin;
                marketPlaceUpdateSubMerchantRequest.Token.UserCode=settings.userCode;
                
                
                marketPlaceUpdateSubMerchantRequest.ContactInfo= new ContactInfo();
                marketPlaceUpdateSubMerchantRequest.ContactInfo.Country = "TR";
                marketPlaceUpdateSubMerchantRequest.ContactInfo.City = "34";
                marketPlaceUpdateSubMerchantRequest.ContactInfo.Address = "Gayrettepe Mh. Yýldýz Posta Cd. D Plaza No:52 K:6 34349 Beþiktaþ / Ýstanbul";
                marketPlaceUpdateSubMerchantRequest.ContactInfo.MobilePhone =request.getParameter("mobilePhoneNumber");
                marketPlaceUpdateSubMerchantRequest.ContactInfo.BusinessPhone = "2121111111";
                marketPlaceUpdateSubMerchantRequest.ContactInfo.Email =request.getParameter("emailAddress");
                marketPlaceUpdateSubMerchantRequest.ContactInfo.InvoiceEmail =request.getParameter("invoiceEmailAddress");
                
                marketPlaceUpdateSubMerchantRequest.FinancialInfo = new FinancialInfo();
                marketPlaceUpdateSubMerchantRequest.FinancialInfo.IdentityNumber =request.getParameter("identityNumber");
                marketPlaceUpdateSubMerchantRequest.FinancialInfo.TaxOffice = "Ýstanbul";
                marketPlaceUpdateSubMerchantRequest.FinancialInfo.TaxNumber = "11111111111";
                marketPlaceUpdateSubMerchantRequest.FinancialInfo.BankName = "0012";
                marketPlaceUpdateSubMerchantRequest.FinancialInfo.IBAN = "TR330006100519786457841326";
                
                marketPlaceUpdateSubMerchantRequest.AuthSignatoryInfo = new AuthSignatoryInfo();
                marketPlaceUpdateSubMerchantRequest.AuthSignatoryInfo.Name = "Ahmet";
                marketPlaceUpdateSubMerchantRequest.AuthSignatoryInfo.Surname = "Yaþar";
                marketPlaceUpdateSubMerchantRequest.AuthSignatoryInfo.BirthDate = date;
                
		String marketPlaceUpdateSubMerchantResponse = marketPlaceUpdateSubMerchantRequest.execute(marketPlaceUpdateSubMerchantRequest,settings); //"Pazaryeri Oluþturma servisi baþlatýlmasý için gerekli servis çaðýrýsýný temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(marketPlaceUpdateSubMerchantResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"MarketPlace  güncelleme servis çaðrýsý sonucunda oluþan servis çýktý parametrelerinin ekranda gösterilmesini saðlar"
	}
%>

<jsp:include page="footer.jsp" />