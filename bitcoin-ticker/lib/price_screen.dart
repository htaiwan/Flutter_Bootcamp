import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  List<DropdownMenuItem> getDropdownMenuItems() {
    List<DropdownMenuItem<String>> dropdownMenuItems = [];

    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      DropdownMenuItem<String> item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownMenuItems.add(item);
    }

    return dropdownMenuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            // https://api.flutter.dev/flutter/material/DropdownButton-class.html
            child: DropdownButton<String>(
                value: selectedCurrency,
                items: getDropdownMenuItems(),
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
