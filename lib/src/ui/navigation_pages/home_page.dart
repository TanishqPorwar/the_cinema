import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:the_cinema/src/blocs/theme_bloc.dart';
import 'package:the_cinema/src/ui/login_page.dart';
import 'package:the_cinema/src/ui/movie_list.dart';
import 'package:the_cinema/src/ui/profile_page.dart';
import 'package:the_cinema/src/blocs/navigation_bloc/navigation_bloc.dart';

class Home extends StatelessWidget with NavigationState {
  final Function methodInParent;
  final Function methodInParent2;
  final bool loggedin;
  final AsyncSnapshot<dynamic> snapshot;
  final Function onMenuTap;
  final Function changeTheme;

  const Home({
    Key key,
    this.methodInParent,
    this.methodInParent2,
    this.loggedin,
    this.snapshot,
    this.onMenuTap,
    this.changeTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: SlidingUpPanel(
        /// this is seen when the panel is open
        /// if the user is logged-in then the panel
        /// is the [ProfilePage], if notthen its the [LoginForm]
        panel: (loggedin)
            // passing method, that updates the state of the homepage
            ? ProfilePage(methodInParent2)
            : LoginForm(methodInParent),

        // this is seen when the panel is closed
        collapsed: Container(
          // giving it a border radius
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
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
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(40))),
              leading: IconButton(icon: Icon(Icons.menu), onPressed: onMenuTap),
              // title
              title: Text('The Cinema'),
              actions: <Widget>[
                // Icon button to toggle between dark and light theme
                IconButton(
                  icon: Icon(Icons.brightness_6),
                  onPressed: changeTheme,
                ),

                // Icon button to filter the movies
                IconButton(
                    icon: Icon(Icons.sort),
                    onPressed: () {
                      showAlertDialog(context);
                    }),
                // can use a switch instead  of a icon button
                // Switch(
                //   value: snapshot.data,
                //   onChanged: tbloc.changeTheme,
                // )
              ],
            ),
            body: MovieList(),
          ),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
        backdropEnabled: true,
        parallaxEnabled: true,
        boxShadow: [
          BoxShadow(
              color: Colors.black54, blurRadius: 25, offset: Offset(0, -25)),
        ],
        color: Theme.of(context).primaryColor,
      ),
    );
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
