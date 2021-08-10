import 'package:portfolio/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (_) => ThemeModel(),
    //   child: Consumer(
    //     builder: (context, ThemeModel themeNotifier, child) {
          return MaterialApp(
            title: "My Portfolio Website",
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            darkTheme: Theme.of(context).copyWith(
                platform: TargetPlatform.android,
                scaffoldBackgroundColor: kBackgroundColor,
                primaryColor: kPrimaryColor,
                canvasColor: kBackgroundColor,
                textTheme: GoogleFonts.latoTextTheme()),
            builder: (context, widget) => ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, widget),
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(450, name: MOBILE),
                ResponsiveBreakpoint.resize(800, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: TABLET),
                ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                ResponsiveBreakpoint.resize(2460, name: "4K"),
              ],
              background: Container(
                color: kBackgroundColor,
              ),
            ),
            home: Home(),
          );
    //     },
    //   ),
    // );
  }
}
