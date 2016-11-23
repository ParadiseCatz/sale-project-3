<%--
  Created by IntelliJ IDEA.
  User: anthony
  Date: 11/13/16
  Time: 2:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="verifytoken.jsp" %>
<%
    String productid = request.getParameter("productid");
    String userid = request.getParameter("userid");
    if(productid != null && userid != null){
        try {
            boolean result = port.unlikeProduct(productid, userid);

            if (!result) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            }
        } catch (Exception e) {
            redirectTo(request, out, "/login.jsp");
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
        }
    }



%>
