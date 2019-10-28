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
      home: Scaffold(
        appBar: AppBar(
          title: Text('XyloPhoneApp'),
        ),
        body: Center(
          child: FlatButton(
            onPressed: () {
              final player = AudioCache();
              player.play('note1.wav');
            },
            child: Text('Press'),
          ),
        ),
      ),
    );
  }
}
