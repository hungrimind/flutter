import 'package:flutter/widgets.dart';

class CounterState {
  CounterState({
    required this.counter,
  });

  final int counter;

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}

class Provider extends InheritedWidget {
  const Provider(this.data, {Key? key, required Widget child})
      : super(key: key, child: child);

  final CounterState data;

  static CounterState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.data;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return data != oldWidget.data;
  }
}
