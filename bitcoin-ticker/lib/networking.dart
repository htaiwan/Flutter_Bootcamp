import 'dart:convert';

import 'package:http/http.dart' as http;

const host = "https://apiv2.bitcoinaverage.com";

class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  Future getBitCoinCurrencyWithBTC({country: String}) async {
    String url = "$host/indices/global/ticker/BTC$country";
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future getBitCoinCurrencyWithETH({country: String}) async {
    String url = "$host/indices/global/ticker/ETH$country";
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future getBitCoinCurrencyWithLTC({country: String}) async {
    String url = "$host/indices/global/ticker/LTC$country";
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
