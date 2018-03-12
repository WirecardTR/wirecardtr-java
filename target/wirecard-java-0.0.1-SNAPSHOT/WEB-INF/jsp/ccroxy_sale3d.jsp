<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.entity.CreditCardInfo"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.util.UUID"%>
<%@page import="wirecard.core.request.CCProxySale3DRequest"%>
<%@page import="wirecard.core.entity.CardTokenization"%>
<%@page import="wirecard.core.Settings"%>
<jsp:include page="layout.jsp" />
<%@page contentType="text/html" pageEncoding="windows-1254"%>

<h2>CCProxySale 3D Secure</h2>
<br/>
<fieldset>
    <legend><label style="font-weight:bold;width:250px;">Proxy Sale 3D Secure Bilgileri</label></legend>
    <label style="font-weight:bold;">Servis Ad� &nbsp; :   &nbsp; </label> CCProxy<br>
    <label style="font-weight:bold;">Operasyon Ad� &nbsp; :&nbsp; </label> Sale3DSEC <br>
    <label style="font-weight:bold;">UserCode  &nbsp;:  &nbsp;</label> Wirecard taraf�ndan verilen de�er <br>
    <label style="font-weight:bold;">Pin &nbsp;:  &nbsp;</label> Wirecard taraf�ndan verilen de�er <br>
    <label style="font-weight:bold;">Fiyat &nbsp;:  &nbsp;</label> 0,01 TL <br>
    <label style="font-weight:bold;">MPAY &nbsp;:  &nbsp;</label> Benzersiz i�lem numaras�. Bu parametre i�lem sonucunda aynen bize geri g�nderilir. <br>
    <label style="font-weight:bold;">Ipaddress &nbsp;:  &nbsp;</label>��lem yapan kullan�c�n�n ip adresi<br>
    <label style="font-weight:bold;">��lem ��eri�i &nbsp;:  &nbsp;</label>Bilgisayar �demesi <br>
    <label style="font-weight:bold;">A��klama &nbsp;:  &nbsp;</label>�deme i�leminin tan�m� <br>
    <label style="font-weight:bold;">Ekstra Parametre &nbsp;:  &nbsp;</label>Bu alan�n bo� olarak g�nderilmesi gerekmektedir. <br>
    
     
</fieldset>


<form action="" method="post" class="form-horizontal">
    <fieldset>
        <!-- Form Name -->
        <legend><label style="font-weight:bold;width:250px;">Kart Bilgileriyle �deme</label></legend>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="">Kart Sahibi Ad� Soyad�:</label>
            <div class="col-md-4">
                <input value="Ahmet Y�lmaz" name="ownerName" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  Kart Numaras�:</label>
            <div class="col-md-4">
                <input value="4282209004348015" name="creditCardNo" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  Son Kullanma Tarihi Ay/Y�l: </label>
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
            <label class="col-md-4 control-label" for="">  Taksit Say�s�: </label>
            <div class="col-md-4">
                
                <select name="installmentCount">
                    <option value="0">Pe�in</option>
                    <option value="3">3</option>
                    <option value="6">6</option>
                    <option value="9">9</option>

                </select>
            </div>
        </div>
    </fieldset>
    <!-- Button -->
    <div class="form-group">
        <label class="col-md-4 control-label" for=""></label>
        <div class="col-md-4">
            <button type="submit" id="" name="" class="btn btn-danger"> �deme Yap</button>
        </div>
    </div>
</form>

<%
	request.setCharacterEncoding("UTF-8");

	if ("POST".equalsIgnoreCase(request.getMethod())) {
	
		/* 
		   Setting ayarlar�m�z� al�yoruz. Formdan gelen bilgilerle CCProxySale3DRequest s�n�f�m�z� dolduruyoruz.
		   MarketPlaceSale3DSecRequest ve Setting ayarlar�m�zla sayfam�z� post ediyoruz.
		*/
                UUID  uuid = UUID.randomUUID();
		Settings settings = new Settings();    
		settings.userCode="";
                settings.pin="";
		settings.baseUrl = "https://www.wirecard.com.tr/SGate/Gate"; //"Wirecard web servisleri API url'lerinin bilgisidir. 

                
		CCProxySale3DRequest ccProxySale3dRequest = new CCProxySale3DRequest();
                ccProxySale3dRequest.ServiceType = "CCProxy";
                ccProxySale3dRequest.OperationType = "Sale3DSEC";
                ccProxySale3dRequest.MPAY = "";
                ccProxySale3dRequest.IPAddress = "127.0.0.8";
                ccProxySale3dRequest.PaymentContent = "BLGSYR01";
                ccProxySale3dRequest.Description = "Bilgisayar";
                ccProxySale3dRequest.InstallmentCount =Integer.parseInt(request.getParameter("installmentCount"));
                ccProxySale3dRequest.ExtraParam = "";
                ccProxySale3dRequest.Port = "123";
                ccProxySale3dRequest.ErrorURL = "http://localhost:8084/wirecard-java/error.htm";
                ccProxySale3dRequest.SuccessURL = "http://localhost:8084/wirecard-java/success.htm";
                ccProxySale3dRequest.Token = new Token();
                ccProxySale3dRequest.Token.UserCode = settings.userCode;
                ccProxySale3dRequest.Token.Pin = settings.pin;
                
                ccProxySale3dRequest.CreditCardInfo = new CreditCardInfo();
                ccProxySale3dRequest.CreditCardInfo.CreditCardNo =request.getParameter("creditCardNo");
                ccProxySale3dRequest.CreditCardInfo.OwnerName =request.getParameter("ownerName");
                ccProxySale3dRequest.CreditCardInfo.ExpireYear =Integer.parseInt(request.getParameter("expireYear"));
                ccProxySale3dRequest.CreditCardInfo.ExpireMonth =Integer.parseInt(request.getParameter("expireMonth"));
                ccProxySale3dRequest.CreditCardInfo.Cvv =request.getParameter("cvv");
                ccProxySale3dRequest.CreditCardInfo.Price = 1;//0,01 TL
                
                ccProxySale3dRequest.CardTokenization = new CardTokenization();
                ccProxySale3dRequest.CardTokenization.RequestType=0;
                ccProxySale3dRequest.CardTokenization.CustomerId="01";
                ccProxySale3dRequest.CardTokenization.ValidityPeriod=0;
                ccProxySale3dRequest.CardTokenization.CCTokenId=uuid.toString();
		String ccProxySale3dResponse = ccProxySale3dRequest.execute(ccProxySale3dRequest,settings); //"�deme Formu �deme servisi ba�lat�lmas� i�in gerekli servis �a��r�s�n� temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(ccProxySale3dResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"�deme Formu �deme servis �a�r�s� sonucunda olu�an servis ��kt� parametrelerinin ekranda g�sterilmesini sa�lar"
	}
%>
<jsp:include page="footer.jsp" />