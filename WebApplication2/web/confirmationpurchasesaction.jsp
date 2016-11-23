<%-- 
    Document   : confirmationpurchasesaction
    Created on : Nov 13, 2016, 3:38:51 PM
    Author     : ASUS
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="verifytoken.jsp" %>
<!DOCTYPE html>
    <%-- start web service invocation --%><hr/>
    <%
        int userid;
        if (getCookie(request,"user_id")!=null){
            userid=Integer.parseInt(getCookie(request,"user_id").getValue());
            out.println("<input type=\"hidden\" name=\"userid\" value="+userid+">");
        }
        else
        {
            userid=-1;
        }
	market.Market_Service service = new market.Market_Service();
	market.Market port = service.getMarketPort();
	 // TODO initialize WS operation arguments here
	int idPembeli = userid;
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	java.lang.String consignee = request.getParameter("consignee");
	java.lang.String fullAddress = request.getParameter("fulladdress");
	int postalCode = Integer.parseInt(request.getParameter("postalcode"));
	long phoneNumber = Long.parseLong(request.getParameter("phonenumber"));
	long ccNumber = Long.parseLong(request.getParameter("creditcardnumber"));
	int ccVerification = Integer.parseInt(request.getParameter("creditcardverification"));
	java.lang.String namaBarang = request.getParameter("nama_barang");
	long hargaBarang = Long.parseLong(request.getParameter("harga_barang").trim());
	int idPenjual = Integer.parseInt(request.getParameter("userid_penjual").trim());
        int idBarang = Integer.parseInt(request.getParameter("id_barang").trim());
        String namafoto="";
        
        try {
             // TODO initialize WS operation arguments here
            // TODO process result here
             namafoto = port.getNamaBarang(idBarang);
        } catch (Exception ex) {
            namafoto="exception get nama foto";
        }
	// TODO process result here
	String redirect="";
        try{
            boolean result = port.confirmationPurchase(idPembeli, quantity, consignee, fullAddress, postalCode, phoneNumber, ccNumber, ccVerification, namaBarang, hargaBarang, idPenjual,  namafoto,idBarang);
        } catch(Exception ex){
            redirect=redirect+"/sales.jsp";
        }
        redirect=redirect+"/purchases.jsp";
        
	
        redirectTo(request,out,redirect);
    
    

    %>
    <%-- end web service invocation --%><hr/>

