var socket = io.connect('http://localhost:3000');
//userList = array yang berisi ID
var userList=[];
socket.emit('client_connect',{});
socket.on('list_online',function(data){
    for (i=0;i<data.list.length;i++){
        userList[i]=data.list[i]["id"];
    }
    
    document.getElementById('frame').contentWindow.location.reload(true);
}); 
(function() {
    chatapp = angular.module('myApp', []);
    chatapp.controller('ChatCtrl', function($scope) {
        $scope.messages = [];
        $scope.chatboxDisable = true;
        $scope.chatRecipientName = "";
        console.log($scope.chatboxDisable);
        $scope.sendMessage = function() {
            socket.emit('client_send', {
                message: $scope.messageText,
                token: Cookies.get('chat_token'),
                recipientID: $scope.chatRecipientID,
                senderID: Cookies.get('user_id'),
                senderUsername: Cookies.get('username')
            });
            $scope.messageText = "";
        };
        
        messaging.onMessage(function(payload) {
            console.log("Message received. ", payload);
            var data = jQuery.parseJSON( payload.data.message);
            var kelas;
            if (data.fromRecipient==true){
                $scope.chatRecipientName = data.senderUsername;
                kelas="recipient";
                if (data.senderID != $scope.chatRecipientID) {
                    $scope.messages = [];
                }
                $scope.chatRecipientID = data.senderID;
            }
            else
            {
                kelas="sender";
            }
            
            $scope.chatboxDisable = false;
            $scope.messages.push({
                content: data.message,
                class: kelas
            });
            $scope.$apply();
        });

        $scope.$on('initiateChat', function(event, user) {
            console.log(user.id + " " + user.username + " ASD1qsdasdas");
            $scope.chatboxDisable = false;
            $scope.chatRecipientName = user.username;
            if (user.id != $scope.chatRecipientID) {
                $scope.messages = [];
            }
            $scope.chatRecipientID = user.id;
            $scope.$apply();
        });
    });

    chatapp.controller('UserClickListener', function($scope) {
        $scope.$on('userClick', function(event, user) {
            $scope.$emit('bridgeInitiateChat', user);
        });
    });

    chatapp.controller('UserChatBridge', function($scope) {
        $scope.$on('bridgeInitiateChat', function(event, user) {
            $scope.$broadcast('initiateChat', user);
        });
    });

    // Initialize Firebase
    var config = {
        apiKey: "AIzaSyCG6PJ1HGtrFeq87NUPOcUfgbkQMIlyadY",
        authDomain: "tubes3-f2a93.firebaseapp.com",
        databaseURL: "https://tubes3-f2a93.firebaseio.com",
        storageBucket: "tubes3-f2a93.appspot.com",
        messagingSenderId: "977487034374"
    };
    firebase.initializeApp(config);
    const messaging = firebase.messaging();

    messaging.requestPermission()
        .then(function() {
            console.log('Notification permission granted.');
            // TODO(developer): Retrieve an Instance ID token for use with FCM.
            // ...
        })
        .catch(function(err) {
            console.log('Unable to get permission to notify.', err);
        });

    messaging.getToken()
        .then(function(currentToken) {
            if (currentToken) {
                socket.emit('token_send', {
                    token: currentToken,
                    userID: Cookies.get('user_id')
                });
                Cookies.set('chat_token', currentToken);
                // updateUIForPushEnabled(currentToken);
            } else {
                // Show permission request.
                console.log('No Instance ID token available. Request permission to generate one.');
                // Show permission UI.
                // updateUIForPushPermissionRequired();
                // setTokenSentToServer(false);
            }
        })
        .catch(function(err) {
            console.log('An error occurred while retrieving token. ', err);
            // showToken('Error retrieving Instance ID token. ', err);
            // setTokenSentToServer(false);
        });
    
}());


