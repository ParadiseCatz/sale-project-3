<%--
  Created by IntelliJ IDEA.
  User: Joshua
  Date: 11/4/2016
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="verifytoken.jsp" %>
<!DOCTYPE html>
<html  ng-app=myApp >
<head>
    <title>Sale Project</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="js/angular.min.js"></script>
    <script src="js/socket.io.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/js.cookie.js"></script>
    <script src="https://www.gstatic.com/firebasejs/3.6.1/firebase.js"></script>
    <script src="https://www.gstatic.com/firebasejs/3.6.1/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/3.6.1/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/3.6.1/firebase-database.js"></script>
    <script src="https://www.gstatic.com/firebasejs/3.6.1/firebase-messaging.js"></script>

    <script src="js/app.js"></script>
    <script>
        function resizeIframe(obj) {
            obj.height = obj.contentDocument.documentElement.scrollHeight + 'px';
            obj.width = obj.contentWindow.document.body.scrollWidth + 'px';
            var navpages = {
                "catalog": "catalog.jsp",
                "yourproducts": "yourproduct.jsp",
                "addproduct": "addproduct.jsp",
                "sales": "sales.jsp",
                "purchases": "purchases.jsp"
            }
            for (var x in navpages) {
                var button = document.getElementById(x);
                button.classList.remove("active");
                var href = obj.contentWindow.location.href;
                var src = href.substr(href.lastIndexOf('/') + 1);
                if (src == "login.jsp") {
                    location.href = "login.jsp";
                }
                if (src == navpages[x]) {
                    button.className += "active";
                }
            }
        }
        window.onload = function() {
            var navpages = {
                "catalog": "catalog.jsp",
                "yourproducts": "yourproduct.jsp",
                "addproduct": "addproduct.jsp",
                "sales": "sales.jsp",
                "purchases": "purchases.jsp"
            }
            for (var key in navpages) {
                var createClickHandler =
                        function(key) {
                            return function() {
                                document.getElementById("frame").src = navpages[key];
                                resizeIframe(document.getElementById("frame"));
                            };
                        };
                var button = document.getElementById(key);
                button.onclick = createClickHandler(key);
            }
        };
    </script>
</head>
<body>

<h1 id="title"><span id="Sale">Sale</span><span id="Project">Project</span></h1>
<div id="account">Hi, <span id="username"><%
    if (getCookie(request, "full_name") != null)
        out.print(getCookie(request, "full_name").getValue());
    else
        out.print("NULL");

%></span><br><span id="logout"><a href="logout.jsp" class="logout" >logout</a></span></div>

<table class="navbar">
    <tr>
        <td id="catalog">Catalog</td>
        <td id="yourproducts">Your Products</td>
        <td id="addproduct">Add Product</td>
        <td id="sales">Sales</td>
        <td id="purchases">Purchases</td>
    </tr>
</table>

<div ng-controller="UserChatBridge">
    <div class="chatbox" ng-controller="ChatCtrl" ng-hide="chatboxDisable">
        
        <div id="topChat">
            <span class="bullet">•  </span>{{chatRecipientName}}
            <button ng-click="chatboxDisable = true" id="xButton">x</button>
        </div>
        <hr>
        <div>
            <div class="bubble-dialog">
                <div ng-repeat="message in messages track by $index" ng-class="{'bubble-left' : message.class == 'recipient', 'bubble-right' : message.class == 'sender'}">{{message.content}}</div>

            </div>
            <hr>
            <div id="bottomChat">
                <form ng-submit="sendMessage()">
                    <input type="text" ng-model="messageText" placeholder="Type your message here" />
                    <input type="submit" value="Kirim" id="kirimButton" />
                </form>
            </div>
            
        </div>
    </div>

    <div ng-controller="UserClickListener">
        <iframe id="frame" src="catalog.jsp" onload="resizeIframe(this)" frameborder=0 scrolling="no"></iframe>
    </div>
</div>


</body>
</html>