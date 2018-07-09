<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="wirecard.core.SuccessOrFailResponse"%>
<%@page contentType="text/html" pageEncoding="windows-1254"%>
<jsp:include page="layout.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1254">
        <title>Başarısız ödeme Bildirimi</title>
    </head>
    <body>
       <pre>
    <%
    	request.setCharacterEncoding("UTF-8");
    	SuccessOrFailResponse successOrFailResponse = new SuccessOrFailResponse();
    	successOrFailResponse.OrderId = request.getParameter("OrderId");
    	successOrFailResponse.MPAY = request.getParameter("MPAY");
        successOrFailResponse.Statuscode = request.getParameter("Statuscode");
        successOrFailResponse.ResultCode = request.getParameter("ResultCode");
        successOrFailResponse.ResultMessage = request.getParameter("ResultMessage");
        successOrFailResponse.LastTransactionDate = request.getParameter("LastTransactionDate");
        successOrFailResponse.MaskedCCNo = request.getParameter("MaskedCCNo");
        successOrFailResponse.CCTokenId = request.getParameter("CCTokenId");
        successOrFailResponse.ExtraParam = request.getParameter("ExtraParam");
        
    	
                 StringWriter sw = new StringWriter();
                 JAXB.marshal(successOrFailResponse, sw);	
		out.println("  <h1>Sonuç</h1>");
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>");
    %>
</pre>
    </body>
</html>
<jsp:include page="footer.jsp" />