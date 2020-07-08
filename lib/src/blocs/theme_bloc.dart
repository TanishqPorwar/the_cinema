import 'dart:async';

class ThemeBloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final tbloc = ThemeBloc();

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// enum ThemeEvents { DarkEvent, LightEvent }

// abstract class ThemeState {}

// class DarkMode extends ThemeState {
//   static ThemeData themeData() => ThemeData.dark();
// }

// class LightMode extends ThemeState {
//   static ThemeData themeData() => ThemeData.light().copyWith(
//         primaryColor: Colors.teal,
//         accentColor: Colors.teal[600],
//       );
// }

// class ThemeBloc extends Bloc<ThemeEvents, ThemeState> {
//   @override
//   ThemeState get initialState => DarkMode();

//   @override
//   Stream<ThemeState> mapEventToState(ThemeEvents event) async* {
//     switch (event) {
//       case ThemeEvents.DarkEvent:
//         yield DarkMode();
//         break;
//       case ThemeEvents.LightEvent:
//         yield LightMode();
//         break;
//       default:
//     }
//   }
// }
