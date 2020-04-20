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
}
