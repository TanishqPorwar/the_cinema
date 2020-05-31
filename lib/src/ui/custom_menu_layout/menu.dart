import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_cinema/src/blocs/navigation_bloc/navigation_bloc.dart';

class Menu extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> scaleAnimation;

  const Menu({Key key, this.slideAnimation, this.scaleAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationEvents.HomeClickEvent);
                },
              ),
              ListTile(
                title: Text('Booking'),
                leading: Icon(Icons.card_membership),
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationEvents.BookingClickEvent);
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationEvents.AboutClickEvent);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
