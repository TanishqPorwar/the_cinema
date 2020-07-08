import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:the_cinema/src/blocs/theme_bloc.dart';
import 'package:the_cinema/src/ui/custom_menu_layout/custom_menu_layout.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// [StreamBuilder] to change the theme of the app
    /// checks if the [tbloc.darkThemeEnabled] snapshot data
    /// is true then sets theme to dark
    /// if its false, then light theme
    return StreamBuilder(
      stream: tbloc.darkThemeEnabled,
      initialData: true,
      builder: (context, snapshot) => MaterialApp(
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: snapshot.data
            ? ThemeData.dark()
            : ThemeData.light().copyWith(
                primaryColor: Colors.teal,
                accentColor: Colors.teal[600],
              ),
        home: CustomMenuLayout(snapshot),
      ),
    );
  }
}
