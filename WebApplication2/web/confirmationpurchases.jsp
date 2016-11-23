<%--
  Created by IntelliJ IDEA.
  User: Joshua
  Date: 11/4/2016
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="verifytoken.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Confirmation Purchase</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="validation.js"></script>
    <script>
        window.onload = function() {
            var priceElement = document.getElementById("price");
            priceElement.value = priceElement.innerHTML;
            priceElement.innerHTML = priceElement.innerHTML.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
            var numberInput = document.getElementById("quantity");
            numberInput.onkeydown = function (e) {
                // Allow: backspace, delete, tab, escape, enter and .
                if ([46, 8, 9, 27, 13, 110, 190].indexOf(e.keyCode) !== -1 ||
                        // Allow: Ctrl+A
                        (e.keyCode == 65 && e.ctrlKey === true) ||
                        // Allow: Ctrl+C
                        (e.keyCode == 67 && e.ctrlKey === true) ||
                        // Allow: Ctrl+X
                        (e.keyCode == 88 && e.ctrlKey === true) ||
                        // Allow: home, end, left, right
                        (e.keyCode >= 35 && e.keyCode <= 39)) {
                    // let it happen, don't do anything
                    return;
                }
                // Ensure that it is a number and stop the keypress
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                    e.preventDefault();
                }
            };
            numberInput.onkeyup = function(e) {
                var total = document.getElementById("totalprice");
                var price = document.getElementById("price").value;
                total.innerHTML = this.value*price;
                total.innerHTML = total.innerHTML.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
            }
            <%
                int userid;
                String full_name;
                String full_address;
                long postal_code;
                long phone_number;
                if (getCookie(request,"user_id")!=null){
                    userid=Integer.parseInt(getCookie(request,"user_id").getValue());
                    full_name=getCookie(request,"full_name").getValue();
                    full_address=getCookie(request,"full_address").getValue();
                    postal_code=Long.parseLong(getCookie(request,"postal_code").getValue());
                    phone_number=Long.parseLong(getCookie(request,"phone_number").getValue());
                }
                else
                {
                    userid=-1;
                    full_name="";
                    full_address="";
                    postal_code=0;
                    phone_number=0;
                }
                out.println("document.getElementById('consignee').value = \"" + full_name + "\";\n");
                out.println("document.getElementById('fulladdress').value = \"" + full_address + "\";\n");
                out.println("document.getElementById('postalcode').value = \"" + postal_code + "\";\n");
                out.println("document.getElementById('phonenumber').value = \"" + phone_number + "\";\n");
                
            %>
            
        };
        function numberCallback(event) {
            return event.charCode >= 48 && event.charCode <= 57;
        }
    </script>
</head>
<body>

<h2 class="pagetitle">Please Confirm your purchase</h2>

<form class="form" id="purchaseConfirmForm" action="confirmationpurchasesaction.jsp" onsubmit="return validateConfirmPurchase(this);" method="post">
    <input type="hidden" name="id_barang" value="<% out.println(request.getParameter("id_barang"));%>">
    <input type="hidden" name="userid_pembeli" value="<% out.println(request.getParameter("userid_pembeli"));%>">
    <input type="hidden" name="userid_penjual" value="<% out.println(request.getParameter("userid_penjual"));%>">
    <input type="hidden" name="nama_barang" value="<% out.println(request.getParameter("nama_barang"));%>">
    <input type="hidden" name="harga_barang" value="<% out.println(request.getParameter("harga_barang")); %>">
    <table class="confirm">
        <tr>
            <th>Product</th>
            <th>:</th>
            <th><% out.println(request.getParameter("nama_barang")); %></th>
        <tr>
            <th>Price</th>
            <th>:</th>
            <th>IDR <span id="price" ><% out.println(request.getParameter("harga_barang")); %></span></th>
        <tr>
            <th>Quantity</th>
            <th>:</th>
            <th><input type="text" name="quantity" id="quantity" value=1 autocomplete="off">pcs</input></th>
        <tr>
            <th>Total Price</th>
            <th>:</th>
            <%DecimalFormat formatter=new DecimalFormat("###,###,###",DecimalFormatSymbols.getInstance(Locale.GERMANY));
            %>
                
        <th>IDR <span id="totalprice"><% out.println(formatter.format(Long.parseLong(request.getParameter("harga_barang")))); %></span></th>
        <tr>
            <th>Delivery to</th>
            <th>:</th>
    </table>
    <br>

    <label for="consignee">Consignee</label><br>
    <input type="text" name="consignee" id="consignee" ><br>
    <label for="fulladdress">Full Address</label><br>

    <textarea rows="1.5" name="fulladdress" form="purchaseConfirmForm" class="Text" id="fulladdress" ></textarea>
    <label for="postalcode">Postal Code</label><br>
    <input type="text" name="postalcode" id="postalcode" ><br>
    <label for="phonenumber">Phone Number</label><br>
    <input type="text" name="phonenumber" id="phonenumber" ><br>
    <label for="creditcardnumber">12 Digits Credit Card Number</label><br>
    <input type="text" name="creditcardnumber" id="creditcardnumber" ><br>
    <label for="creditcardverification">3 Digits Card Verification Value</label><br>
    <input type="password" name="creditcardverification" id="creditcardverification" ><br>
    <div id="tombol"><input type="submit" class="button" value="Confirm" id="Confirm"></input>
        <input type="button" class="button" value="Cancel" onclick="window.history.back();">
    </div>
</form>


</body>
</html>