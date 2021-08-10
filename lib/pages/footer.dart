import 'package:portfolio/models/footer_items.dart';
import 'package:portfolio/utilities/constants.dart';
import 'package:portfolio/utilities/screen_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';


final List<FooterItems> footerItems = [
  FooterItems(
    iconPath: "assets/navigator.png",
    title: "ADDRESS",
    text1: "In front of BANKI AUTO. COLLEGE" ,
    text2: "College Road , Banki , Cuttack",
  ),
  FooterItems(
    iconPath: "assets/telephone.png",
    title: "PHONE",
    text1: "+91 7539870451" ,
    text2: "+91 9938461275",
  ),
  FooterItems(
    iconPath: "assets/gmail.png",
    title: "EMAIL",
    text1: "parijaprahen@gmail.com" ,
    text2: "prahenstark002@gmail.com",
  ),
  FooterItems(
    iconPath: "assets/whatsapp.png",
    title: "WHATSAPP CHAT",
    text1: "+91 7539870451" ,
    text2: "",
  ),

];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(1000.0, context),
        tablet: _buildUi(700.0, context),
        mobile: _buildUi(MediaQuery.of(context).size.width * .95, context),
      ),
    );
  }
}


Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => Container(
                      height: 120.0,
                      width: ScreenHelper.isMobile(context)
                          ? constraints.maxWidth / 2.0 - 20.0
                          : constraints.maxWidth / 4.0 - 20.0,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  footerItem.iconPath,
                                  width: 25.0,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  footerItem.title,
                                  style: GoogleFonts.oswald(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${footerItem.text1}\n",
                                    style: TextStyle(
                                      color: kCaptionColor,
                                      height: 1.8,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "${footerItem.text2}\n",
                                    style: TextStyle(
                                      color: kCaptionColor,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () async{
                        const url = "https://github.com/prahenstark";
                        if (await canLaunch(url)){
                        await launch(url);
                        }else{
                        throw 'Could not launch $url';
                        }
                        },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click ,
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          child:FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                              "assets/github.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 15.0
                    ),
                    GestureDetector(
                      onTap: () async{
                        const url = "https://www.instagram.com/_staaark_/";
                        if (await canLaunch(url)){
                          await launch(url);
                        }else{
                          throw 'Could not launch $url';
                        }
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          child:FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                              "assets/instagram.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 15.0
                    ),
                    GestureDetector(
                      onTap: () async{
                        const url = "https://t.me/Prahen_parija";
                        if (await canLaunch(url)){
                          await launch(url);
                        }else{
                          throw 'Could not launch $url';
                        }
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          child:FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                              "assets/telegram.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 15.0
                    ),
                    GestureDetector(
                      onTap: () async{
                        const url = "https://www.facebook.com/prahenparija.parija";
                        if (await canLaunch(url)){
                        await launch(url);
                        }else{
                        throw 'Could not launch $url';
                        }
                        },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          child:FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                              "assets/facebook.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 15.0
                    ),
                    GestureDetector(
                      onTap: () async{
                        const url = "https://www.linkedin.com/in/prahen-parija-13aa611b4?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BTa9brlroR5yRzB1kNQBScw%3D%3D";
                        if (await canLaunch(url)){
                          await launch(url);
                        }else{
                          throw 'Could not launch $url';
                        }
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          child:FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                              "assets/linkedin.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 15.0
                    ),
                    GestureDetector(
                      onTap: () async{
                        const url = "https://twitter.com/prahen_parija";
                        if (await canLaunch(url)){
                          await launch(url);
                        }else{
                          throw 'Could not launch $url';
                        }
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          child:FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(
                              "assets/twitter.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: ScreenHelper.isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Copyright (c) 2021 Prahen Parija. All rights Reserved",
                      style: TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "|",
                          style: TextStyle(
                            color: kCaptionColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 40,),
            ],
          );
        },
      ),
    ),
  );

}


