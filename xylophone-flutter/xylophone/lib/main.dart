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
  void _playSound({int soundsNumber}) {
    final AudioCache player = AudioCache();
    player.play('note$soundsNumber.wav');
  }

  Expanded _buildRow({int soundsNumber, Color color}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          _playSound(soundsNumber: soundsNumber);
        },
        color: color,
      ),
    );
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
            _buildRow(soundsNumber: 1, color: Colors.red),
            _buildRow(soundsNumber: 2, color: Colors.orange),
            _buildRow(soundsNumber: 3, color: Colors.yellow),
            _buildRow(soundsNumber: 4, color: Colors.green),
            _buildRow(soundsNumber: 5, color: Colors.greenAccent),
            _buildRow(soundsNumber: 6, color: Colors.blue),
            _buildRow(soundsNumber: 7, color: Colors.purple),
          ],
        ),
      ),
    );
  }
}
