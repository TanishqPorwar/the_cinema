import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_cinema/src/blocs/theme_bloc.dart';
import 'package:the_cinema/src/ui/navigation_pages/about_page.dart';
import 'package:the_cinema/src/ui/navigation_pages/booking_page.dart';
import 'package:the_cinema/src/ui/navigation_pages/home_page.dart';
import 'package:the_cinema/src/ui/profile_page.dart';
import 'menu.dart';
import 'dashboard.dart';
import 'package:the_cinema/src/blocs/navigation_bloc/navigation_bloc.dart';

class CustomMenuLayout extends StatefulWidget {
  var snapshot;
  CustomMenuLayout(this.snapshot);
  @override
  _CustomMenuLayoutState createState() => _CustomMenuLayoutState();
}

class _CustomMenuLayoutState extends State<CustomMenuLayout>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  // var to check if the user is logged-in
  bool loggedin = false;
  BorderRadius radius = BorderRadius.all(Radius.circular(40));

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onMenuTap() {
    setState(() {
      if (isCollapsed)
        _controller.forward();
      else
        _controller.reverse();
      isCollapsed = !isCollapsed;
    });
  }

  void onMenuItemClicked() {
    setState(() {
      _controller.reverse();
      isCollapsed = !isCollapsed;
    });
  }

  void changeTheme() {
    setState(() {
      tbloc.changeTheme(!widget.snapshot.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      // the body of the app is the slidingUpPanel
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(
          methodInParent: methodInParent,
          methodInParent2: methodInParent2,
          onMenuTap: onMenuTap,
          snapshot: widget.snapshot,
          loggedin: loggedin,
          changeTheme: changeTheme,
        ),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, state) {
                return Menu(
                  slideAnimation: _slideAnimation,
                  scaleAnimation: _menuScaleAnimation,
                  selectedIndex: mapStateToIndex(state),
                  onMenuItemClicked: onMenuItemClicked,
                );
              },
            ),
            Dashboard(
              duration: duration,
              isCollapsed: isCollapsed,
              screenWidth: screenWidth,
              scaleAnimation: _scaleAnimation,
              radius: radius,
              child: BlocBuilder<NavigationBloc, NavigationState>(
                builder: (context, state) {
                  return state as Widget;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// these methods are called from the [loginForm] and [ProfilePage] to set
  /// the state of the home page
  methodInParent() {
    setState(() {
      loggedin = true;
    });
  }

  methodInParent2() {
    setState(() {
      loggedin = false;
    });
  }

  mapStateToIndex(state) {
    if (state is Home) {
      return 0;
    } else if (state is BookingPage) {
      return 1;
    } else if (state is AboutPage) {
      return 2;
    } else {
      return 0;
    }
  }
}
