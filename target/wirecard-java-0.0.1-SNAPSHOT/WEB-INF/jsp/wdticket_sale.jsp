<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.request.WDTicketPaymentFormRequest"%>
<%@page import="wirecard.core.Settings"%>
<jsp:include page="layout.jsp" />
<%@page contentType="text/html" pageEncoding="windows-1254"%>

<form action="" method="post" class="form-horizontal">
<h2>SaleURLProxy</h2>
<fieldset>
    <table class="table">
        <thead>
            <tr>
                <th>
                    �r�n Ad�
                </th>
                <th>
                    ��lem ��eri�i
                </th>
               
                <th>
                    ��lem Tutar�
                </th>
                 <th>
                   Para birimi (CurrencyCode)
                </th>
                <th>
                    ��lem Tipi
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    Bilgisayar
                </td>
                <td>
                    BLGSYR01
                </td>
                <td>
                   0,01 TL
                </td>
                <td>
                    TRY/USD/EUR -->TRY
                </td>
                <td>
                  1 //Tek �ekim
                </td>
            </tr>
        </tbody>
    </table>
</fieldset>

	<fieldset>
		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for=""></label>
			<div class="col-md-4">
				<button type="submit" name="submit" id=""  class="btn btn-success">�deme Yap</button>
			</div>
		</div>
	</fieldset>
</form>

<%
	request.setCharacterEncoding("UTF-8");

	if ("POST".equalsIgnoreCase(request.getMethod())) {
	
		/* 
		   Setting ayarlar�m�z� al�yoruz. Formdan gelen bilgilerle WDTicketPaymentFormRequest s�n�f�m�z� dolduruyoruz.
		   WDTicketPaymentFormRequest ve Setting ayarlar�m�zla sayfam�z� post ediyoruz.
		*/
                
		Settings settings = new Settings();
		settings.userCode="";
                settings.pin="";
		settings.baseUrl = "https://www.wirecard.com.tr/SGate/Gate"; //"Wirecard web servisleri API url'lerinin bilgisidir. 
		
		WDTicketPaymentFormRequest wDTicketPaymentFormRequest = new WDTicketPaymentFormRequest();  
                
                wDTicketPaymentFormRequest.ServiceType = "WDTicket";
                wDTicketPaymentFormRequest.OperationType = "SaleURLProxy";
                wDTicketPaymentFormRequest.MPAY = "";
                wDTicketPaymentFormRequest.CurrencyCode = "TRY";
                wDTicketPaymentFormRequest.Price=1;
                wDTicketPaymentFormRequest.ErrorURL="http://localhost:8084/wirecard-java/fail.htm";
                wDTicketPaymentFormRequest.SuccessURL="http://localhost:8084/wirecard-java/success.htm";
                wDTicketPaymentFormRequest.ExtraParam="";
                wDTicketPaymentFormRequest.PaymentContent="Bilgisayar";
                wDTicketPaymentFormRequest.Description="BLGSYR01";
                wDTicketPaymentFormRequest.PaymentTypeId=1;
                wDTicketPaymentFormRequest.InstallmentOptions=0;

                wDTicketPaymentFormRequest.Token = new Token();
                wDTicketPaymentFormRequest.Token.UserCode = settings.userCode;
                wDTicketPaymentFormRequest.Token.Pin = settings.pin;
  
                wDTicketPaymentFormRequest.CustomerInfo = new CustomerInfo();
                wDTicketPaymentFormRequest.CustomerInfo.CustomerName = "ahmet";
                wDTicketPaymentFormRequest.CustomerInfo.CustomerSurname = "y�lmaz";
                wDTicketPaymentFormRequest.CustomerInfo.CustomerEmail = "ahmet.yilmaz@gmail.com";
                wDTicketPaymentFormRequest.Language = "TR";
                
		String wDTicketPaymentFormResponse = wDTicketPaymentFormRequest.execute(wDTicketPaymentFormRequest,settings); //"WDTicket 3d Secure olmadan �deme servis ba�lat�lmas� i�in gerekli servis �a��r�s�n� temsil eder."
		StringWriter sw = new StringWriter();
                JAXB.marshal(wDTicketPaymentFormResponse, sw);
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); //"WDTicket 3d Secure olmadan �deme servis �a�r�s� sonucunda olu�an servis ��kt� parametrelerinin ekranda g�sterilmesini sa�lar"
	}
%>


<jsp:include page="footer.jsp" />

