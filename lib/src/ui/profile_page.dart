import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:the_cinema/src/ui/login_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: ThemeData.dark().cardColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Welcome!!",
              style: TextStyle(fontSize: 40),
            ),
            Image.network(
              "https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png",
              height: 200,
            ),
            BuildButton(
                data: "Logout",
                onPressed: () {
                  // TODO
                  BotToast.showText(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      text: "Login Successful",
                      align: Alignment.bottomCenter);
                }),
          ],
        ),
      ),
    );
  }
}
