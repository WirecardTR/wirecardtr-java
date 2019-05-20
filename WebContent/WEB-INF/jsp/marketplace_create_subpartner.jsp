<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.request.MarketPlaceCreateSubMerchantRequest"%>
<%@page import="wirecard.core.Settings"%>

<jsp:include page="layout.jsp" />
<%@page contentType="text/html" pageEncoding="windows-1254"%>
<!DOCTYPE html>

<h2>Alt Üye Ýþyeri Yaratma</h2>


<fieldset>
    <legend><label style="font-weight:bold;width:250px;">MarketPlace Bilgileri</label></legend>
    <label style="font-weight:bold;">Servis Adý &nbsp; :   &nbsp; </label> WDTicket<br>
    <label style="font-weight:bold;">Operasyon Adý &nbsp; :&nbsp; </label> CreateSPRegistrationURL <br>
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
                    <option value=1>Individual - Þahýs firmasý</option>
                    <option value=2>PrivateCompany - Özel þirket</option>
                    <option value=3>Corporation - Kurumsal</option>


                </select>
            </div>
        </div>


    </fieldset>


    <!-- Button -->
    <div class="form-group">
        <label class="col-md-4 control-label" for=""></label>
        <div class="col-md-4">
            <button type="submit" id="" name="" class="btn btn-success">Maðaza Yarat</button>
        </div>
    </div>
</form>
<%
	request.setCharacterEncoding("UTF-8");

	if ("POST".equalsIgnoreCase(request.getMethod())) {
	
		/* 
		   Setting ayarlarýmýzý alýyoruz. Formdan gelen bilgilerle MarketPlaceCreateSubMerchantRequest sýnýfýmýzý dolduruyoruz.
		   MarketPlaceCreateSubMerchantRequest ve Setting ayarlarýmýzla sayfamýzý post ediyoruz.
		*/
               
                
		Settings settings = new Settings();
		settings.userCode="";
                settings.pin="";
		settings.baseUrl = "https://www.wirecard.com.tr/SGate/Gate"; //"Wirecard web servisleri API url'lerinin bilgisidir. 
		
		MarketPlaceCreateSubMerchantRequest marketPlaceCreateSubMerchantRequest = new MarketPlaceCreateSubMerchantRequest();  
                
                
                
                marketPlaceCreateSubMerchantRequest.ServiceType="WDTicket";
		marketPlaceCreateSubMerchantRequest.OperationType="CreateSPRegistrationURL";   
                marketPlaceCreateSubMerchantRequest.UniqueId = 5000;
                marketPlaceCreateSubMerchantRequest.SubPartnerType=Integer.parseInt(request.getParameter("subPartnerType"));
                
                
                marketPlaceCreateSubMerchantRequest.Token= new Token();
                marketPlaceCreateSubMerchantRequest.Token.Pin=settings.pin;
                marketPlaceCreateSubMerchantRequest.Token.UserCode=settings.userCode;
                
                
               
                
		String marketPlaceCreateSubMerchantResponse = marketPlaceCreateSubMerchantRequest.execute(marketPlaceCreateSubMerchantRequest,settings); //"Pazaryeri Oluþturma servisi baþlatýlmasý için gerekli servis çaðýrýsýný temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(marketPlaceCreateSubMerchantResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"MarketPlace  güncelleme servis çaðrýsý sonucunda oluþan servis çýktý parametrelerinin ekranda gösterilmesini saðlar"
	}
%>

<jsp:include page="footer.jsp" />