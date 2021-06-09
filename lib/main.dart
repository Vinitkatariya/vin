import 'package:flutter/material.dart';
import 'package:farmland/screens/screens.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'config/cons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: kLightTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: BottomNavScreen(),
          );
        },
      ),
    );
  }
}
