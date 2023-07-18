import 'package:flutter/widgets.dart';
import 'package:state_management/state.dart';

class AppStateHolder extends StatefulWidget {
  const AppStateHolder({required this.child, Key? key}) : super(key: key);

  final Widget child;

  static AppStateHolderState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateHolderState>()!;
  }

  @override
  AppStateHolderState createState() => AppStateHolderState();
}

class AppStateHolderState extends State<AppStateHolder> {
  CounterState _counterState = CounterState(counter: 0);

  void add() {
    int newCounter = _counterState.counter + 1;
    setState(() {
      _counterState = _counterState.copyWith(counter: newCounter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      _counterState,
      child: widget.child,
    );
  }
}
