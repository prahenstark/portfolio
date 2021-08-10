import 'package:portfolio/pages/education_section.dart';
import 'package:portfolio/pages/footer.dart';
import 'package:portfolio/utilities/constants.dart';
import 'package:portfolio/utilities/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/header_items.dart';
import 'pages/carousel.dart';
import 'pages/cv_section.dart';
import 'pages/header.dart';


ScrollController _controller = ScrollController();

List<HeaderItems> headerItems = [
  HeaderItems(title: "HOME", onTap: () {
    _controller.animateTo(
      /* distance from the top of the listView where you want to animate your list to*/
    150.0,
    duration: Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
    );

  }),
  HeaderItems(title: "ABOUT", onTap: () {
    _controller.animateTo(
      /* distance from the top of the listView where you want to animate your list to*/
    650.0,
    duration: Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
    );

  }),
  HeaderItems(title: "EDUCATION", onTap: () {
    _controller.animateTo(
      /* distance from the top of the listView where you want to animate your list to*/
    1250.0,
    duration: Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
    );

  }),
  HeaderItems(title: "CONTACT", onTap: () {
    _controller.animateTo(
      /* distance from the top of the listView where you want to animate your list to*/
    1900.0,
    duration: Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
    );

  }),
  HeaderItems(
    title: "HIRE ME",
    onTap: () async{
        const url = 'mailto:parijaprahen@gmail.com?subject=We want to hire you&body=Please write why you want to hire me';
        if (await canLaunch(url)){
          await launch(url);
        }else{
          throw 'Could not launch $url';
        }
    },
    isButton: true,
  ),
];

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return headerItems[index].isButton ? MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kDangerColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 28.0),
                      child: TextButton(
                        onPressed: headerItems[index].onTap,
                        child: Text(headerItems[index].title,
                        style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ) : ListTile(
                    title: Text(
                      headerItems[index].title,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10.0);
                },
                itemCount: headerItems.length),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Header(),
              ),
              Carousel(),
              SizedBox(
                height: 20.0,
              ),
              CvSection(),
              SizedBox(
                height: 50.0,
              ),
              EducationSection(),
              SizedBox(
                height: 50.0,
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
