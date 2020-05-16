import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginForm extends StatefulWidget {
  Function function;
  LoginForm(this.function);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  /// Variable to store the email id
  String _emailid;

  /// Variable to store the password
  String _password;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: double.infinity,
      alignment: Alignment.center,
      // wrapping the tfs and button in a scroll view
      // so that we can scroll when the keyboard is open
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign In',
              style: Theme.of(context).textTheme.title,
            ),

            // gap
            SizedBox(height: 30.0),

            // the form
            Form(
              child: Column(
                children: <Widget>[
                  _buildEmailTF(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildPasswordTF()
                ],
              ),
            ),

            // gap
            SizedBox(
              height: 30,
            ),

            // build forgot password and login
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // forgot password
                InkWell(
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {}),

                // gap
                SizedBox(
                  width: 20,
                ),

                // login button
                Flexible(
                  child: BuildButton(
                    data: "Login",
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    onPressed: () {
                      // widget.parent{
                      widget.function();
                      Fluttertoast.showToast(msg: "Welcome!!");
                      // };
                    },
                  ),
                ),
              ],
            ),

            // gap
            SizedBox(
              height: 20,
            ),

            // the divider
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // the divider
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),

                // the text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "or",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

                // the divider
                Expanded(
                    child: Divider(
                  color: Colors.grey,
                )),
              ],
            ),

            // gap
            SizedBox(
              height: 20,
            ),

            // The register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BuildButton(
                    data: "register",
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    onPressed: () {
                      Fluttertoast.showToast(msg: "Registered");
                    }),
              ],
            ),

            // gap
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  // building the email textfield(tf)
  Widget _buildEmailTF() {
    return Container(
      decoration: TextFormFieldShadow(),
      child: TextFormField(
        style: Theme.of(context).textTheme.subhead,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.emailAddress,
        decoration: TextFormFieldPrefix(
            hintText: "Email",
            icon: Icon(
              Icons.person,
            )),
        validator: (String value) {
          if (value.length == 0) return "empty";
          return null;
        },
        onSaved: (String value) => _emailid = value,
      ),
    );
  }

  // building the password tf
  Widget _buildPasswordTF() {
    return Container(
      decoration: TextFormFieldShadow(),
      child: TextFormField(
        obscureText: true,
        style: Theme.of(context).textTheme.subhead,
        decoration: TextFormFieldPrefix(
            hintText: "Password",
            icon: Icon(
              Icons.lock,
            )),
        validator: (String value) {
          if (value.length == 0) return "empty";
          return null;
        },
        onSaved: (String value) => _password = value,
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  final String data;
  final void Function() onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  BuildButton({
    @required this.data,
    @required this.onPressed,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.all(0),
  });
  @override
  Widget build(BuildContext context) {
    TextStyle buttonTextStyle = TextStyle(
      color: Colors.white,
      letterSpacing: 1.5,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'OpenSans',
    );
    ;

    if (MediaQuery.of(context).size.height <= 580) {
      buttonTextStyle = buttonTextStyle.copyWith(fontSize: 12);
    }

    return RaisedButton(
        elevation: 5.0,
        onPressed: onPressed,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        color: Color(0xff24213B),
        child: RichText(
          text: TextSpan(
            text: data,
            style: buttonTextStyle,
          ),
        ));
  }
}

/// The shadow for text form fields
class TextFormFieldShadow extends BoxDecoration {
  TextFormFieldShadow()
      : super(
          // to get a curved border
          borderRadius: BorderRadius.circular(10.0),
          // to give a shadow to the tf
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        );
}

/// The prefix icon for text form fields
class TextFormFieldPrefix extends InputDecoration {
  TextFormFieldPrefix({
    @required String hintText,
    @required Widget icon,
    Color color = const Color(0xff2F3857),
    double topLeftRadius = 10,
    double bottomLeftRadius = 10,
  }) : super(
            hintText: hintText,
            prefixIcon: Container(
              decoration: BoxDecoration(
                  color: Color(0xff2F3857),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  )),
              child: icon,
            ),
            prefix: SizedBox(
              width: 10,
            ));
}
