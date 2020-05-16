import 'package:flutter/material.dart';
import 'package:the_cinema/src/splash_screen.dart';
import 'package:flutter/services.dart';

void main() {
  /// fix orientation to [potraitUp]
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MaterialApp(
            theme: ThemeData.dark(),
            home: SplashScreen(),
          )));
}
