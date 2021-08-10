import 'dart:html';

import 'package:portfolio/models/design_process.dart';
import 'package:portfolio/utilities/constants.dart';
import 'package:portfolio/utilities/screen_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_grid.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
      title: "INNOVATOR",
      imagePath: "assets/innovate.png",
      subtitle: "I hack real life problems.\nInnovate solutions for them.",
  ),
  DesignProcess(
    title: "DEVELOP",
    imagePath: "assets/gamer.png",
    subtitle: "I work on many development fields\nlike mobile apps,websites etc",
  ),
  DesignProcess(
    title: "PHOTOGRAPHY",
    imagePath: "assets/camera2.png",
    subtitle: "I do photography for my hobby.\nYou can check my work on instagram",
  ),
  DesignProcess(
    title: "ROBOTICS",
    imagePath: "assets/robot2.png",
    subtitle: "I work on various robotics projects\nlike mini line follower robots and drones.",
  ),

];

class CvSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color.fromRGBO(102, 187, 182, 1),
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, 1000.0),
        tablet: _buildUi(context, 760.0),
        mobile: _buildUi(context, MediaQuery.of(context).size.width * .95),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    //we need the context to get maxWidth before the constraints below.
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "WORK HARD,\nDREAM BIG",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  //color: Color.fromRGBO(19, 20, 44, 1),
                  fontWeight: FontWeight.w900,
                  fontSize: 18.0,
                  height: 1.8,
                ),
              ),
              GestureDetector(
                  onTap: () => downloadFile("https://github.com/prahenstark/portfolio/raw/master/assets/Resume.pdf"),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    "DOWNLOAD RESUME",
                    style: GoogleFonts.oswald(
                      color: kPrimaryColor,
                      //color: Color.fromRGBO(19, 20, 44, 1),
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                ),
              ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            child: LayoutBuilder(
              builder: (_context, constraints) {
                return ResponsiveGridView.builder(
                  padding: EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  alignment: Alignment.topCenter,
                  gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 30.0,
                    maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                            ScreenHelper.isMobile(context)
                        ? constraints.maxWidth / 2.0
                        : 300.0,
                    //Hack to adjust child height
                    childAspectRatio: ScreenHelper.isDesktop(context)
                        ? 1.5
                        : MediaQuery.of(context).size.aspectRatio * 1.5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                child:FittedBox(
                                  fit: BoxFit.fill,
                                child: Image.asset(
                                  designProcesses[index].imagePath,
                                ),
                                ),
                              ),
                              SizedBox(width: 15.0),
                              Text(designProcesses[index].title,
                              style: GoogleFonts.oswald(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: kPrimaryColor,
                                //color: Color.fromRGBO(19, 20, 44, 1),
                              ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            designProcesses[index].subtitle,
                            style: TextStyle(
                              color: kCaptionColor,
                              //color: Color.fromRGBO(19, 20, 44, 1),
                              height: 1.5,
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      ),

                    );
                  },
                  itemCount: designProcesses.length,

                );
              },
            ),
          ),
          SizedBox(
              height: 5.0
          ),
        ],
      ),
    );
  }
}

downloadFile(url) {
  AnchorElement anchorElement = new AnchorElement(href: url);
  anchorElement.download = "Resume (Prahen Parija)";
  anchorElement.click();
}