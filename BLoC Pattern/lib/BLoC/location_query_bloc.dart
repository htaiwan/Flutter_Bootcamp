import 'dart:async';

import 'package:restaurant_finder/BLoC/bloc.dart';
import 'package:restaurant_finder/DataLayer/location.dart';
import 'package:restaurant_finder/DataLayer/zomato_client.dart';

class LocationQueryBloc implements Bloc {
  final _client = ZomatoClient();

  final _locationQueryController = StreamController<List<Location>>();

  Stream<List<Location>> get locationStream => _locationQueryController.stream;

  void submitQuery(String query) async {
    final result = await _client.fetchLocations(query);
    _locationQueryController.sink.add(result);
  }

  @override
  void dispose() {
    _locationQueryController.close();
  }
}
