import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('你想在哪裡吃？'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: '輸入地點'),
              onChanged: (query) {
                print(query);
              },
            ),
          ),
          Expanded(
            child: _buildResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildResults() {
    return Center(
      child: Text('輸入地點'),
    );
  }
}
