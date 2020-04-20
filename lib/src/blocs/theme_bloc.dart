import 'dart:async';

class ThemeBloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final tbloc = ThemeBloc();
