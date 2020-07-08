import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_cinema/src/ui/navigation_pages/home_page.dart';
import 'package:the_cinema/src/ui/navigation_pages/about_page.dart';
import 'package:the_cinema/src/ui/navigation_pages/booking_page.dart';

enum NavigationEvents {
  HomeClickEvent,
  BookingClickEvent,
  AboutClickEvent,
}

abstract class NavigationState {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationState> {
  final Function methodInParent;
  final Function methodInParent2;
  final bool loggedin;
  final AsyncSnapshot<dynamic> snapshot;
  final Function onMenuTap;
  final Function changeTheme;

  NavigationBloc({
    this.methodInParent,
    this.methodInParent2,
    this.loggedin,
    this.snapshot,
    this.onMenuTap,
    this.changeTheme,
  });

  @override
  get initialState => Home(
        methodInParent: methodInParent,
        methodInParent2: methodInParent2,
        onMenuTap: onMenuTap,
        loggedin: loggedin,
        changeTheme: changeTheme,
        snapshot: snapshot,
      );

  @override
  Stream<NavigationState> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomeClickEvent:
        yield Home(
          methodInParent: methodInParent,
          methodInParent2: methodInParent2,
          onMenuTap: onMenuTap,
          loggedin: loggedin,
          changeTheme: changeTheme,
          snapshot: snapshot,
        );
        break;

      case NavigationEvents.BookingClickEvent:
        yield BookingPage(
          onMenuTap: onMenuTap,
        );
        break;

      case NavigationEvents.AboutClickEvent:
        yield AboutPage(
          onMenuTap: onMenuTap,
        );
        break;
    }
  }
}
