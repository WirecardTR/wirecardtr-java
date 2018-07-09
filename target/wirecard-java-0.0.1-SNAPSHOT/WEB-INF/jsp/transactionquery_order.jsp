<jsp:include page="layout.jsp" />
<%@page import="wirecard.core.Helper"%>
<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.Settings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h2> Sipariş numarası ile işlem sorgulama</h2>

<form action="" method="post">
    <!-- Text input-->
    <div class="form-group">
        <div class="row">

            <label class="col-md-12 control-label" for="">Sipariş Numarası</label>
            <div class="col-md-3">
                <input name="orderId" type="text" value=""  class="form-control" required="">
            </div>
        </div>
        <div class="row">
            <label class="col-md-12 control-label" for=""></label>
            <div class="col-md-4">
                <br />
                <button type="submit" id="" name="" class="btn btn-danger">Sorgula </button>
            </div>
        </div>
       
    </div>
</form>
<%-- start web service invocation --%><hr/>
             <%
                 request.setCharacterEncoding("UTF-8");

            if ("POST".equalsIgnoreCase(request.getMethod())) {
                 try {
                     
                   /*
                           OrderId ile sorgulama soap çağrısının başlatıldığı kısmı temsil etmektedir.
                           Input ve token bilgileri doldurularak otomatik service çağrısı başlatılır.
                   */    
                 Settings settings = new Settings();
		 settings.userCode="";
                 settings.pin="";  
                 
                  com._3pay.services.SaleService service = new com._3pay.services.SaleService();
                  com._3pay.services.SaleServiceSoap port = service.getSaleServiceSoap12();
                  com._3pay.services.MAuthToken token = new com._3pay.services.MAuthToken();
                  token.setUserCode(settings.userCode);
                  token.setPin(settings.pin);
                  java.lang.String orderId = request.getParameter("orderId");
                  com._3pay.services.MSaleOutput result = port.getSaleResult(token, orderId);
                 StringWriter sw = new StringWriter();
                 JAXB.marshal(result, sw);
		
                 out.println("  <h1>Sonuç</h1>");
                 out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>"); 

                 } catch (Exception ex) {
                 // TODO handle custom exceptions here
                 }
            }
             %>
<jsp:include page="footer.jsp" />

