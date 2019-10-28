import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XyloPhoneApp());

class XyloPhoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  void _playSound(int number) {
    final AudioCache player = AudioCache();
    player.play('note$number.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xylophone'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                _playSound(1);
              },
              color: Colors.red,
            ),
            FlatButton(
              onPressed: () {
                _playSound(2);
              },
              color: Colors.orange,
            ),
            FlatButton(
              onPressed: () {
                _playSound(3);
              },
              color: Colors.yellow,
            ),
            FlatButton(
              onPressed: () {
                _playSound(4);
              },
              color: Colors.green,
            ),
            FlatButton(
              onPressed: () {
                _playSound(5);
              },
              color: Colors.greenAccent,
            ),
            FlatButton(
              onPressed: () {
                _playSound(6);
              },
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                _playSound(7);
              },
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
