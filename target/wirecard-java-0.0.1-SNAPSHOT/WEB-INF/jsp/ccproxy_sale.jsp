<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.entity.CreditCardInfo"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.request.CCProxySaleRequest"%>
<%@page import="wirecard.core.Settings"%>
<%@page import="java.util.UUID"%>
<%@page import="wirecard.core.entity.CardTokenization"%>
<jsp:include page="layout.jsp" />
<%@page contentType="text/html" pageEncoding="windows-1254"%>

<h2>CCProxySale</h2>
<br/>
<fieldset>
    <legend><label style="font-weight:bold;width:250px;">Proxy Sale Bilgileri</label></legend>
    <label style="font-weight:bold;">Servis Ad� &nbsp; :   &nbsp; </label> CCProxy<br>
    <label style="font-weight:bold;">Operasyon Ad� &nbsp; :&nbsp; </label> Sale <br>
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
        <div class="form-group">
            <label class="col-md-4 control-label" for="">  Para Birimi: </label>
            <div class="col-md-4">
                <select name="currencyCode">
                    <option value="TRY">TRY</option>
                    <option value="USD">USD</option>
                    <option value="EUR">EUR</option>
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
		   Setting ayarlar�m�z� al�yoruz. Formdan gelen bilgilerle CCProxySaleRequest s�n�f�m�z� dolduruyoruz.
		   MarketPlaceSale3DSecRequest ve Setting ayarlar�m�zla sayfam�z� post ediyoruz.
		*/
                UUID  uuid = UUID.randomUUID();
		Settings settings = new Settings();    
		settings.userCode="";
                settings.pin="";
		settings.baseUrl = "https://www.wirecard.com.tr/SGate/Gate"; //"Wirecard web servisleri API url'lerinin bilgisidir. 

                
		CCProxySaleRequest ccProxySaleRequest = new CCProxySaleRequest();
                ccProxySaleRequest.ServiceType = "CCProxy";
                ccProxySaleRequest.OperationType = "Sale";
                ccProxySaleRequest.MPAY = "";
                ccProxySaleRequest.CurrencyCode = request.getParameter("currencyCode");
                ccProxySaleRequest.IPAddress = "127.0.0.8";
                ccProxySaleRequest.PaymentContent = "BLGSYR01";
                ccProxySaleRequest.Description = "Bilgisayar";
                ccProxySaleRequest.InstallmentCount =Integer.parseInt(request.getParameter("installmentCount"));
                ccProxySaleRequest.ExtraParam = "";
                ccProxySaleRequest.Port = "123";
                ccProxySaleRequest.Token = new Token();
                ccProxySaleRequest.Token.UserCode = settings.userCode;
                ccProxySaleRequest.Token.Pin = settings.pin;
                
                ccProxySaleRequest.CreditCardInfo = new CreditCardInfo();
                ccProxySaleRequest.CreditCardInfo.CreditCardNo =request.getParameter("creditCardNo");
                ccProxySaleRequest.CreditCardInfo.OwnerName =request.getParameter("ownerName");
                ccProxySaleRequest.CreditCardInfo.ExpireYear =Integer.parseInt(request.getParameter("expireYear"));
                ccProxySaleRequest.CreditCardInfo.ExpireMonth =Integer.parseInt(request.getParameter("expireMonth"));
                ccProxySaleRequest.CreditCardInfo.Cvv =request.getParameter("cvv");
                ccProxySaleRequest.CreditCardInfo.Price = 1;//0,01 TL
                
                ccProxySaleRequest.CardTokenization = new CardTokenization();
                ccProxySaleRequest.CardTokenization.RequestType=0;
                ccProxySaleRequest.CardTokenization.CustomerId="01";
                ccProxySaleRequest.CardTokenization.ValidityPeriod=0;
                ccProxySaleRequest.CardTokenization.CCTokenId="";
		
		String ccProxySaleResponse = ccProxySaleRequest.execute(ccProxySaleRequest,settings); //"�deme Formu �deme servisi ba�lat�lmas� i�in gerekli servis �a��r�s�n� temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(ccProxySaleResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"�deme Formu �deme servis �a�r�s� sonucunda olu�an servis ��kt� parametrelerinin ekranda g�sterilmesini sa�lar"
	}
%>
<jsp:include page="footer.jsp" />