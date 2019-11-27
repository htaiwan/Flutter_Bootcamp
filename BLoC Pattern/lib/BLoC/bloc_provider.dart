import 'package:flutter/widgets.dart';
import 'package:restaurant_finder/BLoC/bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  static Type _providerType<T>() => T;

  // The of method allows widgets to retrieve the BlocProvider from a descendant in the widget tree with the current build context.
  // This is a very common pattern in Flutter.
  static T of<T extends Bloc>(BuildContext context) {
    final type = _providerType<BlocProvider<T>>();
    final BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  @override
  _BlocProviderState createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  // the only reason why the provider inherits from StatefulWidget is to get access to the dispose method.
  // When this widget is removed from the tree, Flutter will call the dispose method, which will in turn, close the stream
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
