<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.request.MarketPlaceCreateSubMerchantRequest"%>
<%@page import="wirecard.core.Settings"%>

<jsp:include page="layout.jsp" />
<%@page contentType="text/html" pageEncoding="windows-1254"%>
<!DOCTYPE html>

<h2>Alt �ye ��yeri Yaratma</h2>


<fieldset>
    <legend><label style="font-weight:bold;width:250px;">MarketPlace Bilgileri</label></legend>
    <label style="font-weight:bold;">Servis Ad� &nbsp; :   &nbsp; </label> WDTicket<br>
    <label style="font-weight:bold;">Operasyon Ad� &nbsp; :&nbsp; </label> CreateSPRegistrationURL <br>
    <label style="font-weight:bold;">UserCode  &nbsp;:  &nbsp;</label> Wirecard taraf�ndan verilen de�er <br>
    <label style="font-weight:bold;">Pin &nbsp;:  &nbsp;</label> Wirecard taraf�ndan verilen de�er <br>
    <label style="font-weight:bold;">UniqueId &nbsp;:&nbsp;  </label> benzersiz id de�eri <br>
    <label style="font-weight:bold;">�� Telefonu &nbsp;: &nbsp; </label>2121111111 <br>
    <label style="font-weight:bold;">Vergi Dairesi &nbsp;: &nbsp; </label>�stanbul <br>
    <label style="font-weight:bold;">Vergi Numaras� &nbsp;: &nbsp; </label>11111111111 <br>
    <label style="font-weight:bold;">Banka Ad� &nbsp;: &nbsp; </label>Ziraat Bankas� <br>
    <label style="font-weight:bold;">IBAN &nbsp;: &nbsp; </label>TR330006100519786457841326 <br>
    <label style="font-weight:bold;">Banka Hesap Ad� &nbsp;: &nbsp; </label>Fatih Co�kun <br>
    <label style="font-weight:bold;">Ma�aza �lkesi: &nbsp; : &nbsp;</label>TR<br>
    <label style="font-weight:bold;">Ma�aza �ehri: &nbsp;</label>&nbsp; 34<br>
    <label style="font-weight:bold;">Ma�aza A��k Adresi &nbsp;: &nbsp;</label>Gayrettepe Mh. Y�ld�z Posta Cd. D Plaza No:52 K:6 34349 Be�ikta� / �stanbul<br>
    <label style="font-weight:bold;">�mza Yetkilisi Ad� &nbsp;: &nbsp; </label>Ahmet<br>
    <label style="font-weight:bold;">�mza Yetkilisi Soyad� &nbsp;: &nbsp;</label>Y�lmaz<br>
    <label style="font-weight:bold;">�mza Yetkilisi Do�um Tarihi &nbsp;: &nbsp;</label>1970/10/29<br>
</fieldset>

<br />
<form action="" method="post" class="form-horizontal">
    <fieldset>
        <!-- Form Name -->
        <legend><label style="font-weight:bold;width:250px;">Market Place Detaylar�</label></legend>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Ma�aza Tipi:</label>
            <div class="col-md-4">

                <select name="subPartnerType">
                    <option value=1>Individual - �ah�s firmas�</option>
                    <option value=2>PrivateCompany - �zel �irket</option>
                    <option value=3>Corporation - Kurumsal</option>


                </select>
            </div>
        </div>


    </fieldset>


    <!-- Button -->
    <div class="form-group">
        <label class="col-md-4 control-label" for=""></label>
        <div class="col-md-4">
            <button type="submit" id="" name="" class="btn btn-success">Ma�aza Yarat</button>
        </div>
    </div>
</form>
<%
	request.setCharacterEncoding("UTF-8");

	if ("POST".equalsIgnoreCase(request.getMethod())) {
	
		/* 
		   Setting ayarlar�m�z� al�yoruz. Formdan gelen bilgilerle MarketPlaceCreateSubMerchantRequest s�n�f�m�z� dolduruyoruz.
		   MarketPlaceCreateSubMerchantRequest ve Setting ayarlar�m�zla sayfam�z� post ediyoruz.
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
                
                
               
                
		String marketPlaceCreateSubMerchantResponse = marketPlaceCreateSubMerchantRequest.execute(marketPlaceCreateSubMerchantRequest,settings); //"Pazaryeri Olu�turma servisi ba�lat�lmas� i�in gerekli servis �a��r�s�n� temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(marketPlaceCreateSubMerchantResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"MarketPlace  g�ncelleme servis �a�r�s� sonucunda olu�an servis ��kt� parametrelerinin ekranda g�sterilmesini sa�lar"
	}
%>

<jsp:include page="footer.jsp" />