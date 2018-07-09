<%@page import="javax.xml.bind.JAXB"%>
<%@page import="java.io.StringWriter"%>
<%@page import="wirecard.core.Helper"%>
<%@page import="wirecard.core.TokenizeSuccesOrFailResponse"%>
<%@page contentType="text/html" pageEncoding="windows-1254"%>
<jsp:include page="layout.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <title>Baþarýsýz Kart Saklama</title>
    </head>
    <body>
         <pre>
    <%  
    	request.setCharacterEncoding("UTF-8");
    	TokenizeSuccesOrFailResponse successOrFailResponse = new TokenizeSuccesOrFailResponse();
        
        successOrFailResponse.StatusCode = request.getParameter("StatusCode");
        successOrFailResponse.ResultCode = request.getParameter("ResultCode");
        successOrFailResponse.ResultMessage = request.getParameter("ResultMessage");
        
    	
                 StringWriter sw = new StringWriter();
                 JAXB.marshal(successOrFailResponse, sw);	
		out.println("  <h1>Sonuç</h1>");
		out.println("<pre>" + Helper.prettyPrintXml(sw.toString()) + "</pre>");
    %>
</pre>
    </body>
  
</html>
<jsp:include page="footer.jsp" />