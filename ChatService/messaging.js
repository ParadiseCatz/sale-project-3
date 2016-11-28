/**
 * Created by anthony on 11/25/16.
 */


var request = require('request');

function sendMessageToUser(deviceId, message) {
    request({
        url: 'https://fcm.googleapis.com/fcm/send',
        method: 'POST',
        headers: {
            'Content-Type' :' application/json',
            'Authorization': 'key=AIzaSyCo8P-XQNdYTrpxf1Jhe1W3zQa2C0Ina1I'
        },
        body: JSON.stringify(
            { "data": {
                "message": message
            },
                "to" : deviceId
            }
        )
    }, function(error, response, body) {
        if (error) {
            console.error(error, response, body);
        }
        else if (response.statusCode >= 400) {
            console.error('HTTP Error: '+response.statusCode+' - '+response.statusMessage+'\n'+body);
        }
        else {
            console.log('Done!');
        }
    });
}

module.exports = function (io, connection) {
    var allClients = [];
    io.on('connection', function (socket) {
        socket.on('client_connect', function(data){
            connection.query('SELECT DISTINCT id FROM `session`;',[],
            function(error,results,fields){
                if (error) {
                        console.log('error list online: ' + error);
                        return;
                    }
                var onlineList=results.slice();
                //debug onlineList
                console.log(onlineList);
                socket.emit('list_online',{
                    list:onlineList
                });
            })
        });
        
        socket.on('client_send', function (data) {
            connection.query(
                'SELECT token FROM `session` WHERE id=?;' +
                'SELECT token FROM `session` WHERE id=?;',
                [
                    data.senderID,
                    data.recipientID
                ],
                function (error, results, fields) {
                    var senderToken, recipientToken;
                    if (error) {
                        console.log('error register session to database: ' + error);
                        return;
                    }
                    console.log(results);
                    senderToken = results[0][0].token;
                    recipientToken = results[1][0].token;
                    sendMessageToUser(
                        senderToken,
                        {
                            message: data.message,
                            fromRecipient: false
                        }
                    );
                    sendMessageToUser(
                        recipientToken,
                        {
                            message: data.message,
                            fromRecipient: true
                        }
                    );
                });
            console.log(data);
        });
        socket.on('token_send', function (data) {
            console.log("userid = " + data.userID + " connected");
            allClients.push({socket:socket, token:data.token, id:data.userID});
            sendMessageToUser(
                data.token,
                { message: 'Hello puf'}
            );
            connection.query(
                'INSERT INTO `session` (`id`, `token`) VALUES (?, ?)',
                [data.userID, data.token],
                function (error, results, fields) {
                    if (error) {
                        console.log('error register session to database: ' + error);
                    }
                });
        });

        socket.on('disconnect', function() {
            var token, id;
            for (var i = 0; i < allClients.length; ++i) {
                if (allClients[i].socket == socket) {
                    token = allClients[i].token;
                    id = allClients[i].id;
                    allClients.splice(i, 1);
                    break;
                }
            }
            console.log("userid = " + id + " disconnected");
            connection.query(
                'DELETE FROM `session` WHERE token = ?',
                [token],
                function (error, results, fields) {
                    if (error) {
                        console.log('error unregister session to database: ' + error);
                    }
                });
        });
    });
};
