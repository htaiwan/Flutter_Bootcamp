import 'dart:async';

import 'package:restaurant_finder/BLoC/bloc.dart';
import 'package:restaurant_finder/DataLayer/location.dart';

class LocationBloc implements Bloc {
  Location _location;
  Location get selectedLocation => _location;

  // 原來管理stream, 且此stream只處理Location型別的資料
  final _locationController = StreamController<Location>();

  // exposes a public getter
  Stream<Location> get locationStream => _locationController.stream;

  // This function represents the input for the BLoC
  void selectLocation(Location location) {
    _location = location;
    _locationController.sink.add(location);
  }

  @override
  void dispose() {
    _locationController.close();
  }
}
