import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_finder/BLoC/bloc_provider.dart';
import 'package:restaurant_finder/BLoC/restaurant_query_bloc.dart';
import 'package:restaurant_finder/DataLayer/location.dart';
import 'package:restaurant_finder/DataLayer/restaurant.dart';
import 'package:restaurant_finder/UI/restaurant_tile.dart';

import 'favorite_screen.dart';

class RestaurantScreen extends StatelessWidget {
  final Location location;
  const RestaurantScreen({Key key, @required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => FavoriteScreen())),
          )
        ],
      ),
      body: _buildSearch(context),
    );
  }

  Widget _buildSearch(BuildContext context) {
    final bloc = RestaurantQueryBloc(location);

    return BlocProvider<RestaurantQueryBloc>(
      bloc: bloc,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: '你想在哪裡吃'),
              onChanged: (query) => bloc.submitQuery(query),
            ),
          ),
          Expanded(
            child: _buildStreamBuilder(bloc),
          ),
        ],
      ),
    );
  }

  Widget _buildStreamBuilder(RestaurantQueryBloc bloc) {
    return StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot) {
          final results = snapshot.data;
          if (results == null) {
            return Center(
                child: Text('Enter a restaurant name or cuisine type'));
          }

          if (results.isEmpty) {
            return Center(child: Text('No Results'));
          }

          return _buildSearchResults(results);
        });
  }

  _buildSearchResults(List<Restaurant> results) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final restaurant = results[index];
          return RestaurantTile(restaurant: restaurant);
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: results.length);
  }
}
