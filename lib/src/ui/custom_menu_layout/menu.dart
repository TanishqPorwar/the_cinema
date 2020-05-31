import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_cinema/src/blocs/navigation_bloc/navigation_bloc.dart';

class Menu extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> scaleAnimation;
  final int selectedIndex;
  final void Function() onMenuItemClicked;
  const Menu(
      {Key key,
      this.slideAnimation,
      this.scaleAnimation,
      this.selectedIndex,
      this.onMenuItemClicked})
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
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: getColorFromIndex(0, context),
                    fontWeight: getFontWeightFromIndex(0, context),
                  ),
                ),
                leading: Icon(
                  Icons.home,
                  color: getColorFromIndex(0, context),
                ),
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationEvents.HomeClickEvent);
                  onMenuItemClicked();
                },
              ),
              ListTile(
                title: Text(
                  'Booking',
                  style: TextStyle(
                    color: getColorFromIndex(1, context),
                    fontWeight: getFontWeightFromIndex(1, context),
                  ),
                ),
                leading: Icon(
                  Icons.card_membership,
                  color: getColorFromIndex(1, context),
                ),
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationEvents.BookingClickEvent);
                  onMenuItemClicked();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: getColorFromIndex(2, context),
                ),
                title: Text(
                  'About',
                  style: TextStyle(
                    color: getColorFromIndex(2, context),
                    fontWeight: getFontWeightFromIndex(2, context),
                  ),
                ),
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationEvents.AboutClickEvent);
                  onMenuItemClicked();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  getColorFromIndex(int i, BuildContext context) {
    if (selectedIndex == i) {
      return Theme.of(context).accentColor;
    } else {
      return Theme.of(context).textTheme.bodyText1.color;
    }
  }

  getFontWeightFromIndex(int i, BuildContext context) {
    if (selectedIndex == i) {
      return FontWeight.w900;
    } else {
      return FontWeight.normal;
    }
  }
}
