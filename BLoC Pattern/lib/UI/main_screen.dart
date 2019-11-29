import 'package:flutter/widgets.dart';
import 'package:restaurant_finder/BLoC/bloc_provider.dart';
import 'package:restaurant_finder/BLoC/location_bloc.dart';
import 'package:restaurant_finder/DataLayer/location.dart';
import 'package:restaurant_finder/UI/location_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // These widgets will automatically listen for events from the stream.
    // When a new event is received,
    // the builder closure will be executed, updating the widget tree

    // With StreamBuilder and the BLoC pattern,
    // there is no need to call setState() once in this entire tutorial
    return StreamBuilder<Location>(
      stream: BlocProvider.of<LocationBloc>(context).locationStream,
      builder: (location, snapshot) {
        final location = snapshot.data;

        if (location == null) {
          return LocationScreen();
        }

        return Container();
      },
    );
  }
}
