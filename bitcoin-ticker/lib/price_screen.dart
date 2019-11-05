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
  String selectedCurrencyBtc = 'USD';
  String currencyResultBtc = '?';
  String selectedCurrencyEth = 'USD';
  String currencyResultEth = '?';
  String selectedCurrencyLtc = 'USD';
  String currencyResultLtc = '?';
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
        value: selectedCurrencyBtc,
        items: dropdownMenuItems,
        onChanged: (value) async {
          var responseDataBTC =
              await networkHelper.getBitCoinCurrencyWithBTC(country: value);
          var responseDataETH =
              await networkHelper.getBitCoinCurrencyWithETH(country: value);
          var responseDataLTC =
              await networkHelper.getBitCoinCurrencyWithLTC(country: value);
          setState(() {
            selectedCurrencyBtc = value;
            selectedCurrencyEth = value;
            selectedCurrencyLtc = value;
            double cur_BTC = responseDataBTC["last"];
            double cur_ETH = responseDataETH["last"];
            double cur_LTC = responseDataLTC["last"];
            currencyResultBtc = cur_BTC.toStringAsFixed(0);
            currencyResultLtc = cur_ETH.toStringAsFixed(0);
            currencyResultEth = cur_LTC.toStringAsFixed(0);
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
        var responseDataBTC = await networkHelper.getBitCoinCurrencyWithBTC(
            country: currenciesList[selectedIndex]);
        var responseDataETH = await networkHelper.getBitCoinCurrencyWithETH(
            country: currenciesList[selectedIndex]);
        var responseDataLTC = await networkHelper.getBitCoinCurrencyWithLTC(
            country: currenciesList[selectedIndex]);
        setState(() {
          selectedCurrencyBtc = currenciesList[selectedIndex];
          selectedCurrencyEth = currenciesList[selectedIndex];
          selectedCurrencyLtc = currenciesList[selectedIndex];

          double cur_BTC = responseDataBTC["last"];
          double cur_ETH = responseDataETH["last"];
          double cur_LTC = responseDataLTC["last"];

          currencyResultBtc = cur_BTC.toString();
          currencyResultEth = cur_ETH.toString();
          currencyResultLtc = cur_LTC.toString();
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
                  '1 BTC = $currencyResultBtc $selectedCurrencyBtc',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
                  '1 ETH = $currencyResultEth $selectedCurrencyEth',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
                  '1 LTC = $currencyResultLtc $selectedCurrencyLtc',
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
