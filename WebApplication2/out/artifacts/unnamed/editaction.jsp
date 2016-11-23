<%--
  Created by IntelliJ IDEA.
  User: anthony
  Date: 11/13/16
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="verifytoken.jsp" %>
<%
    String productid = request.getParameter("idbarang");
    String namaBarang = request.getParameter("namabarang");
    String description = request.getParameter("description");
    String price = request.getParameter("price");

    if (
        productid != null &&
        namaBarang != null &&
        description != null &&
        price != null
    ) {
        try {
            boolean result = port.editProduct(productid, namaBarang, description, price);
            if (result) {
                redirectTo(request, out, "/yourproduct.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            redirectTo(request, out, "/login.jsp");
            e.printStackTrace();
        }
    } else {
        out.println(productid + " ");
        out.println(namaBarang + " ");
        out.println(description + " ");
        out.println(price + " ");
//        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }


%>
