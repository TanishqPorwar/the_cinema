import 'package:flutter/material.dart';
import 'package:the_cinema/src/blocs/theme_bloc.dart';
import 'package:the_cinema/src/ui/login_page.dart';
import 'package:the_cinema/src/ui/profile_page.dart';
import 'ui/movie_list.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
        theme: snapshot.data
            ? ThemeData.dark()
            : ThemeData.light().copyWith(
                primaryColor: Colors.teal,
                accentColor: Colors.teal[600],
              ),
        home: HomePage(snapshot),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  var snapshot;
  HomePage(this.snapshot);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var to check if the user is logged-in
  bool loggedin = false;
  // the border radius of the collapsed slide-up panel
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // the body of the app is the slidingUpPanel
      body: SlidingUpPanel(
        /// this is seen when the panel is open
        /// if the user is logged-in then the panel
        /// is the [ProfilePage], if notthen its the [LoginForm]
        panel: (loggedin)
            // passing method, that updates the state of the homePage
            ? ProfilePage(methodInParent2)
            : LoginForm(methodInParent),

        // this is seen when the panel is closed
        collapsed: Container(
          // giving it a border radius
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, borderRadius: radius),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Profile",
                  style: TextStyle(fontSize: 20),
                ),
                // gap
                SizedBox(height: 20),
                // circular rectangle
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                        width: 300, height: 8, color: Colors.white30)),
              ],
            ),
          ),
        ),

        // the main body of the slidingUpPanel
        body: Center(
          child: Scaffold(
            // appBar
            appBar: AppBar(
              // title
              title: Text('The Cinema'),
              actions: <Widget>[
                // Icon button to toggle between dark and light theme
                IconButton(
                    icon: widget.snapshot.data
                        ? Icon(Icons.brightness_2)
                        : Icon(Icons.brightness_7),
                    onPressed: () {
                      tbloc.changeTheme(!widget.snapshot.data);
                    }),

                // Icon button to filter the movies
                IconButton(
                    icon: Icon(Icons.sort),
                    onPressed: () {
                      showAlertDialog(context);
                    }),
                // can use a switch instead  of a icon button
                // Switch(
                //   value: widget.snapshot.data,
                //   onChanged: tbloc.changeTheme,
                // )
              ],
            ),
            body: MovieList(),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text('Menu'),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  ListTile(
                    title: Text('Booking'),
                    leading: Icon(Icons.card_membership),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        borderRadius: radius,
        backdropEnabled: true,
        parallaxEnabled: true,
        boxShadow: [
          BoxShadow(color: Colors.black87, blurRadius: 25),
        ],
        color: Theme.of(context).primaryColor,
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

  // alert dialog to filter
  showAlertDialog(BuildContext context) {
    showDialog(
      // if barrierDismissible is true, alertDialog is dismissed
      // if user taps outside the dialog
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Filter"),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // dropdown buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Language : "),
                    DropButton("none", ['Hindi', 'English', 'Kannada']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Location : "),
                    DropButton("none", ['Rajajinagar', 'Peenya', 'Whitefield']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Show-time : "),
                    DropButton("none", ['10:00 AM', '1:30 PM', '6:30 PM']),
                  ],
                ),
              ],
            ),
          ),
          contentPadding: EdgeInsets.all(25.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          actions: <Widget>[
            // apply button, onPressed closes the alert dialog
            FlatButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop('dialog'),
                child: Text("Apply")),
          ],
        );
      },
    );
  }
}

// DropDownButton
class DropButton extends StatefulWidget {
  // the current of intial string that is selected
  String cur;
  // list of items in the dropDown menu
  List<String> items;
  DropButton(this.cur, this.items);
  @override
  _DropButtonState createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: widget.cur,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String newVal) {
        setState(() {
          widget.cur = newVal;
        });
      },
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
    );
  }
}
