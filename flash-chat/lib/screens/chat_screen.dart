import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

Firestore _firestore = Firestore.instance;
FirebaseUser loginUser;

class ChatScreen extends StatefulWidget {
  static String id = 'ChatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String messageText;

  void getCurrentUser() async {
    try {
      FirebaseUser currentUser = await _auth.currentUser();
      if (currentUser != null) {
        loginUser = currentUser;
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    final messages =
        await _firestore.collectionGroup("messages").getDocuments();
    for (var message in messages.documents) {
      print(message.data);
    }
  }

  // 這個是動態的listener只要db資料更新，就會被通知
  void messageStream() async {
    await for (var stream
        in _firestore.collectionGroup("messages").snapshots()) {
      for (var message in stream.documents) {
        print(message.data);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      controller.clear();
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loginUser.email,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  /*
            <QuerySnapshot>是firebase的data type，是因為在stream:中給予的是
            firebase的QuerySnapshot
            */
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("messages").snapshots(),
      // 這裡的snapshot是從flutter定義出來asyn_snapshot
      builder: (context, snapshot) {
        List<MessageBubble> messageWidgets = [];
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            ),
          );
        }
        //
        final messages = snapshot.data.documents.reversed;
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];

          MessageBubble bubble = MessageBubble(
            message: messageText,
            sender: messageSender,
            isMe: loginUser.email == messageSender,
          );
          messageWidgets.add(bubble);
        }
        // 要把ListView包在Expanded，是因為下面還有Container(text, send button)
        // 這樣ListView才知道要長多高
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.message, this.sender, this.isMe});

  final String message;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 讓每個氣泡不要連在一起
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(color: Colors.white, fontSize: 10.0),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
            // 陰影
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.lightGreen,
            child: Padding(
              // 讓藍色泡泡跟內部文字有個距離
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '$message',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
