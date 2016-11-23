<%--
  Created by IntelliJ IDEA.
  User: anthony
  Date: 11/13/16
  Time: 3:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="verifytoken.jsp" %>
<%
    if(getCookie(request, "token") != null){
        try {
            String token = getCookie(request, "token").getValue();
            String url = AppConfig.get("identity_service_url") + "/Logout?token=" + token;
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            int responseCode = con.getResponseCode();
            if (responseCode == 200) {
                tokenCookie.setMaxAge(0);
                response.addCookie(tokenCookie);
                redirectToLogin(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }



%>
