import 'dart:async';

import 'package:restaurant_finder/BLoC/bloc.dart';
import 'package:restaurant_finder/DataLayer/location.dart';
import 'package:restaurant_finder/DataLayer/restaurant.dart';
import 'package:restaurant_finder/DataLayer/zomato_client.dart';

class RestaurantQueryBloc implements Bloc {
  final Location location;
  final _client = ZomatoClient();
  final _controller = StreamController<List<Restaurant>>();

  Stream<List<Restaurant>> get stream => _controller.stream;
  RestaurantQueryBloc(this.location);

  void submitQuery(String query) async {
    final result = await _client.fetchRestaurants(location, query);
    _controller.sink.add(result);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
