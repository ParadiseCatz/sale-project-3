<%--
  Created by IntelliJ IDEA.
  User: Joshua
  Date: 11/4/2016
  Time: 3:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols" %>
<%@page import="java.util.Locale"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="verifytoken.jsp" %>
<html ng-app="catalogApp">
<head>
    <title>Catalog</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="js/angular.min.js"></script>
    <script>
        
        var catalogApp = angular.module('catalogApp', []);
        
        catalogApp.factory('$parentScope', function($window) {
            return $window.parent.angular.element($window.frameElement).scope();
        });
        
        catalogApp.controller();
        
        catalogApp.controller('UserCtrl', function($scope, $parentScope) {
            $scope.userclick = function(userid, username) {
                $parentScope.$emit('userClick', { id: userid, username:username} );
            };
        });
        window.onload = function() {
            var likeButtons = document.querySelectorAll(".like, .liked");
            for (var i = 0; i < likeButtons.length; i++) {
                var likeButton = likeButtons[i];
                likeButton.onclick = function () {
                    var productId = this.dataset.productId;
                    if (this.className == "like") {
                        var xhttp = new XMLHttpRequest();
                        xhttp.onreadystatechange = function() {
                            if (this.readyState == 4) {
                                if (this.status == 200) {
                                    var likeNum = document.getElementById("productlikes#".concat(productId));
                                    likeNum.innerHTML++;
                                } else {
                                    alert("Ups! There's Something Wrong :(\n".concat(this.responseText));
                                }
                            }
                        };
                        xhttp.open("GET", "likeaction.jsp?productid=".concat(productId).concat("&userid=").concat(<%out.print(getCookie(request, "user_id").getValue());%>), true);
                        xhttp.send();
                        this.className = "liked";
                        this.innerHTML = "LIKED";
                    } else {
                        var xhttp = new XMLHttpRequest();
                        xhttp.onreadystatechange = function() {
                            if (this.readyState == 4) {
                                if (this.status == 200) {
                                    var likeNum = document.getElementById("productlikes#".concat(productId));
                                    likeNum.innerHTML--;
                                } else {
                                    alert("Ups! There's Something Wrong :(\n".concat(this.responseText));
                                }
                            }
                        };
                        xhttp.open("GET", "unlikeaction.jsp?productid=".concat(productId).concat("&userid=").concat(<%out.print(getCookie(request, "user_id").getValue());%>), true);
                        xhttp.send();
                        this.className = "like";
                        this.innerHTML = "LIKE";
                    }

                }
            }
        };
    </script>
</head>
<body>
<h2 class="pagetitle">What are you going to buy today?</h2>
<hr>
<form action="catalog.jsp"  method="GET">
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
    %>
    <input name="searchkey" type="text" placeholder="Search catalog ..." id="Search" autofocus="1">
    <input type="submit" value="GO" id="GO" class="button">
    <br>
    <label for="filter" class="filter">by</label> <br>
    <input type="radio" name="filter" value="product" checked="">Product<br>
    <input type="radio" name="filter" value="store">Store<br>
</form> 
<br>
    <div ng-controller="UserCtrl">
    <%-- start web service invocation --%><hr/>
    <%
    if (userid!=-1){
        try {
             // TODO initialize WS operation arguments here
            int userID = userid;
            java.lang.String searchType = request.getParameter("filter");
            java.lang.String searchKey = request.getParameter("searchkey");
            // TODO process result here
            java.util.List<market.Produk> result = port.listCatalog(userID, searchType, searchKey);

            for (market.Produk temp:result){
                //Looping melakukan print catalog
                out.println("<div class=\"username\" ng-click=userclick(" + temp.getIdPenjual() + ",\"" + temp.getUsername() + "\")>" + "<span id=\"bullet\">•  </span>" +temp.getUsername() + "</div>");
                out.println("<div class=\"tanggal\"> added this on "+ temp.getWaktuDitambahkan() + "</div>");
                out.println("<hr>");
                out.println("<div class=\"container\">");
                out.println("<div class=\"divGambar\">");

                //TODO BENERIN PRINT FOTO
                out.println("<img src=\"" + temp.getNamaFoto() + "\" class=\"GambarKatalog\">");
                //TODO

                out.println("</div>");
                out.println("<div class=\"divDesc\">");
                out.println("<span class=\"NamaBarang\">"+ temp.getNamaBarang()+"</span><br>");
                DecimalFormat formatter=new DecimalFormat("###,###,###",DecimalFormatSymbols.getInstance(Locale.GERMANY));

                out.println("<span class=\"HargaBarang\"> IDR " + formatter.format(temp.getHarga()) + "</span><br>");
                out.println("<span class=\"DeskripsiBarang\">"+ temp.getDeskripsi() +"</span><br>");
                out.println("</div>");
                out.println("<div class=\"divLike\">");
                String id_barang=Integer.toString(temp.getId());
                String jumlah_like=Integer.toString(temp.getJumlahLike());
                out.println("<span id=\"productlikes#"+id_barang+"\">" +jumlah_like+"</span> likes<br>");
                String jumlah_beli=Integer.toString(temp.getJumlahBeli());
                out.println(jumlah_beli +"  purchases<br><br>");


                int idUser = userid;
                int idBarang = temp.getId();
                boolean resultLike = false;
                try {
                    resultLike = port.checkLike(idUser, idBarang);
                } catch (Exception e) {

                }
                if (!resultLike) {
                    //kasus jika sudah like
                    out.println("<span class=\"like\" data-product-id=\"" + idBarang + "\">LIKE");
                } else {
                    //kasus jika belum like
                    out.println("<span class=\"liked\" data-product-id=\"" + idBarang + "\">LIKED");
                }
                out.println("</span>");
                String urlPurchase;
                urlPurchase = "confirmationpurchases.jsp?userid_pembeli=" + idUser
                        + "&userid_penjual=" + temp.getIdPenjual() + "&nama_barang="
                        + temp.getNamaBarang()
                        + "&harga_barang=" + temp.getHarga() + "&id_barang="
                        + temp.getId();
                out.println("<a href=\"" + urlPurchase + "\" class=\"buy\">BUY</a>");
                out.println("</div>");
                out.println("</div>");
                out.println("<br><hr>");





            }

        } catch (Exception ex) {
            // TODO handle custom exceptions here

            out.println("<h1>" + ex.toString()+"</h1>");
        }
    }
    else
    {
        out.println("<h1>Cookie NULL</h1>");
    }
        %>

    </div>
    
    <%-- end web service invocation --%>

   


</body>
</html>