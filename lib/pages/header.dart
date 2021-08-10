import 'package:portfolio/home.dart';
import 'package:portfolio/utilities/constants.dart';
import 'package:portfolio/utilities/globals.dart';
import 'package:portfolio/utilities/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';





class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "P",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: GoogleFonts.oswald(
                    color: kPrimaryColor,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems.map(
          (item) => item.isButton
              ? MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kDangerColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: TextButton(
                      onPressed: item.onTap,
                      child: Text(
                        item.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              : MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    margin: EdgeInsets.only(right: 30.0),
                    child: GestureDetector(
                      onTap: item.onTap,
                      child: Text(
                        item.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
        ).toList()
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color.fromRGBO(25, 23, 26, 1),
      child: ScreenHelper(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(),
        ),
        //
        mobile: buildMobileHeader(),
        tablet: buildHeader(),
      ),
    );
  }
}

//mobile header
Widget buildMobileHeader() {
  return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            //Lets make a scaffold key and create a drawer
            //Restart server to make icon work.
            GestureDetector(
              //Lets open drawer using global key.
              onTap: (){
                Globals.scaffoldKey.currentState.openDrawer();
              },
              child: Icon(
                FlutterIcons.menu_fea,
                color: Colors.white,
                size: 28.0,
              ),
            )
          ],
        ),
      )
  );
}

//Lets plan for mobile and smaller width screens
Widget buildHeader() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
      children: [
        HeaderLogo(),
        HeaderRow(),
      ],
    ),
  );
}