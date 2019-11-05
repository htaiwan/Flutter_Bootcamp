import 'dart:core';
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';
import 'networking.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String currencyResult = '?';
  NetworkHelper networkHelper = NetworkHelper();

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownMenuItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      DropdownMenuItem<String> item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownMenuItems.add(item);
    }

    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropdownMenuItems,
        onChanged: (value) async {
          var responseData =
              await networkHelper.getBitCoinCurrency(country: value);
          setState(() {
            selectedCurrency = value;
            double cur = responseData["last"];
            currencyResult = cur.toStringAsFixed(0);
          });
        });
  }

  CupertinoPicker iOSPicker() {
    List<Text> dropdownMenuItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      Text item = Text(currenciesList[i]);
      dropdownMenuItems.add(item);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) async {
        var responseData = await networkHelper.getBitCoinCurrency(
            country: currenciesList[selectedIndex]);
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          currencyResult = responseData["last"].toStringAS;
        });
      },
      children: dropdownMenuItems,
    );
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
                  '1 BTC = $currencyResult $selectedCurrency',
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
              child: Platform.isIOS ? iOSPicker() : androidDropdown()),
        ],
      ),
    );
  }
}
