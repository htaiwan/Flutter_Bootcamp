import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'ChatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseAuth _auth;
  Firestore _firestore;

  FirebaseUser loginUser;
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
    _auth = FirebaseAuth.instance;
    _firestore = Firestore.instance;
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
            /*
            <QuerySnapshot>是firebase的data type，是因為在stream:中給予的是
            firebase的QuerySnapshot
            */
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection("messages").snapshots(),
              // 這裡的snapshot是從flutter定義出來asyn_snapshot
              builder: (context, snapshot) {
                List<Text> messageWidgets = [];
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.lightBlue,
                    ),
                  );
                }

                final messages = snapshot.data.documents;
                for (var message in messages) {
                  final messageText = message.data['text'];
                  final messageSender = message.data['sender'];
                  final messageWidget = Text(
                    '$messageText 來自 $messageSender',
                    style: TextStyle(color: Colors.white),
                  );
                  messageWidgets.add(messageWidget);
                }
                return Column(
                  children: messageWidgets,
                );
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
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
