import 'package:flutter/material.dart';
import 'package:the_cinema/src/blocs/theme_bloc.dart';
import 'package:the_cinema/src/ui/login_page.dart';
import 'package:the_cinema/src/ui/profile_page.dart';
import 'ui/movie_list.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: tbloc.darkThemeEnabled,
      initialData: true,
      builder: (context, snapshot) => MaterialApp(
        theme: snapshot.data
            ? ThemeData.dark()
            : ThemeData.light().copyWith(
                primaryColor: Colors.teal,
                accentColor: Colors.teal[600],
                // textTheme: ThemeData.dark().textTheme,
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
  bool loggedin = false;
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        panel: (loggedin)
            ? ProfilePage(methodInParent2)
            : LoginForm(methodInParent),
        collapsed: Container(
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
                SizedBox(height: 20),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                        width: 300, height: 8, color: Colors.white30)),
              ],
            ),
          ),
        ),
        body: Center(
          child: Scaffold(
            appBar: AppBar(
              title: Text('The Cinema'),
              actions: <Widget>[
                IconButton(
                    icon: widget.snapshot.data
                        ? Icon(Icons.brightness_2)
                        : Icon(Icons.brightness_7),
                    onPressed: () {
                      tbloc.changeTheme(!widget.snapshot.data);
                    }),
                IconButton(
                    icon: Icon(Icons.sort),
                    onPressed: () {
                      showAlertDialog(context);
                    }),
                // Switch(
                //   value: widget.snapshot.data,
                //   onChanged: tbloc.changeTheme,
                // )
              ],
            ),
            body: MovieList(),
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

  showAlertDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Filter"),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
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

class DropButton extends StatefulWidget {
  String cur;
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
      // icon: Icon(Icons.arrow_downward),
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
