<%@page import="wirecard.core.entity.Token"%>
<%@page import="wirecard.core.entity.ContactInfo"%>
<%@page import="wirecard.core.entity.FinancialInfo"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.request.MarketPlaceAddSubMerchantRequest"%>
<%@page import="wirecard.core.Settings"%>
<%@page import="java.util.UUID"%>
<jsp:include page="layout.jsp" />
<%@page contentType="text/html" pageEncoding="windows-1254"%>


<h2>Pro Api Y�ntemi �le �deme </h2>
<hr/>

<form action="" method="post" class="form-horizontal">
  <p>
    <form action="" method="post">
        <table class="table">
            <thead>
                <tr>
                    <th>
                        �r�n Id
                    </th>
                    <th>
                        �r�n A��klamas�
                    </th>
                    <th>
                        Birim Fiyat
                    </th>
                    <th>
                        Unit
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        0
                    </td>
                    <td>
                        Telefon
                    </td>
                    <td>
                        0.01 TL
                    </td>
                    <td>
                        1
                    </td>
                </tr>

            </tbody>
        </table>
        <hr/>
        �deme Y�ntemi:
        <br/>
        <select name="paymentTypeId">
            <option value="1">Tek �ekim</option>
            <option value="2">Ayl�k abonelik (iletilen miktar her ay otomatik �ekilir)</option>
            <option value="3">Haftal�k abonelik (iletilen miktar her hafta otomatik �ekilir)</option>
            <option value="4">2 haftal�k abonelik</option>
            <option value="5">3 ayl�k abonelik</option>
            <option value="6">6 ayl�k abonelik</option>
            <option value="7">Ayl�k denemeli (ilk ay �cretlendirme yap�lmaz)</option>
            <option value="8">Haftal�k denemeli (ilk hafta �cretlendirme yap�lmaz)</option>
            <option value="9">2 haftal�k denemeli (ilk 2 hafta �cretlendirme yap�lmaz)</option>
            <option value="10">3 ayl�k denemeli</option>
            <option value="11">6 ayl�k denemeli</option>
            <option value="13">30 g�nl�k</option>
            <option value="14">G�nl�k abonelik</option>
        </select>
        <br />
        <br />
        
        �r�n Kategorisi: 
        <br />
        <select name="productCategoryId">
            <option value="1">Fiziksel �r�n</option>
            <option value="2">Oyun</option>
            <option value="3">Dijital ��erik</option>
            <option value="4">Servis </option>
            <option value="5">Sosyal A�/Arkada�l�k </option>
            <option value="6">Aidat/Otomat </option>
            <option value="7">Bahis </option>
            <option value="8">Sigorta </option>
            <option value="10">Kamu - bilet - fastfood </option>
            <option value="11">Cep Sigorta </option>
            <option value="12">Kutu Oyun </option>
            <option value="14">Mobil Uygulama / Mobil Market </option>
            <option value="15">E�itim </option>
            <option value="16">Ba��� (sadece Turkcell aboneleri ba��� �demesi yapabilir) </option>
            <option value="19">Sa�l�k </option>
            <option value="20">White Label Adult </option>
           
        </select>
        <br />
        <br />
        <button type="submit" id="" name="" class="btn btn-danger">Sms �le �deme Yap</button>
    
    </form>
<%-- start web service invocation --%><hr/>
               <%
              request.setCharacterEncoding("UTF-8");

            if ("POST".equalsIgnoreCase(request.getMethod())) 
            {
               try {
                   
               /*
                   Api Plus soap �a�r�s�n�n ba�lat�ld��� k�sm� temsil etmektedir.
                   �nput ve token bilgileri doldurularak otomatik service �a�r�s� ba�lat�l�r.
               */  
               
               Settings settings = new Settings();
               settings.userCode="";
               settings.pin="";  
               com._3pay.services.SaleService service = new com._3pay.services.SaleService();
               com._3pay.services.SaleServiceSoap port = service.getSaleServiceSoap();
               com._3pay.services.MAuthToken token = new com._3pay.services.MAuthToken();
               com._3pay.services.MSaleTicketInput input = new com._3pay.services.MSaleTicketInput();
               
               input.setMPAY("");
               input.setContent("Bilgisayar");
               input.setSendOrderResult(true);
               input.setPaymentTypeId(Integer.parseInt(request.getParameter("paymentTypeId")));
               input.setReceivedSMSObjectId("00000000-0000-0000-0000-000000000000");  
               // input.setProductList(mSale);
               input.setSendNotificationSMS(true);
               input.setOnSuccessfulSMS("basarili odeme yaptiniz");
               input.setOnErrorSMS("basarisiz odeme yaptiniz");
               input.setRequestGsmOperator(0);        
               input.setRequestGsmType(0);
               input.setUrl("http://localhost:8084/wirecard-java/pro_api.htm");
               input.setSuccessfulPageUrl("http://localhost:8084/wirecard-java/success.php");
               input.setErrorPageUrl("http://localhost:8084/wirecard-java/fail.php");
               input.setCountry("");
               input.setCurrency("");
               input.setExtra("");
               input.setTurkcellServiceId("0");
               
               token.setUserCode(settings.userCode);
               token.setPin(settings.pin);
               
               com._3pay.services.MSaleTicketOutput result = port.saleWithTicket(token, input);

               StringWriter sw = new StringWriter();
               JAXB.marshal(result, sw);
		
               out.println("  <h1>Sonu�</h1>");
               out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); 
               } catch (Exception ex) {
               
               }
            }
               %>
               <%-- end web service invocation --%><hr/>
  <jsp:include page="footer.jsp" />