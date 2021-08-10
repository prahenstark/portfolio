import 'package:portfolio/models/carousel_item_model.dart';
import 'package:portfolio/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


List<CarouselItemModel> carouselItems = List.generate(5,
        (index) => CarouselItemModel(
            text: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Hi there! My name is  ",
                    style: GoogleFonts.oswald(
                      color: kPrimaryColor,
                      //color: Color.fromRGBO(19, 20, 44, 1),
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    )
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Text(
                    "PRAHEN\nPARIJA",
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      //color: Color.fromRGBO(19, 20, 44, 1),
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                      "Computer Engineer",
                      style: GoogleFonts.oswald(
                        color: kPrimaryColor,
                        //color: Color.fromRGBO(19, 20, 44, 1),
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      )
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Text(
                    "From Odisha",
                    style: TextStyle(
                      color: kCaptionColor,
                      //color: Colors.black87,
                      fontSize: 15.0,
                      height: 1.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          "I work on various fields.",
                          style: TextStyle(
                            color: kCaptionColor,
                            //color: Colors.black87,
                            fontSize: 15.0,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () {},
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              "Got a project?  Let's talk.",
                              style: TextStyle(
                                height: 1.5,
                                color: Colors.white,
                                //color: Color.fromRGBO(62, 87, 83, 1),
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Text(
                            "This website is under development! Some buttons ",
                            style: TextStyle(
                              color: kCaptionColor,
                              //color: Colors.black87,
                              fontSize: 15.0,
                              height: 1.0,
                            ),
                          ),
                          SizedBox(height: 2),
                      Text(
                        "may not work.",
                        style: TextStyle(
                          color: kCaptionColor,
                          //color: Colors.black87,
                          fontSize: 15.0,
                          height: 1.0,
                        ),
                      ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "Last updated on ",
                                style: TextStyle(
                                  color: kCaptionColor,
                                  //color: Colors.black87,
                                  fontSize: 15.0,
                                  height: 1.0,
                                ),
                              ),
                              Text(
                                "11th August 2021",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  //color: Colors.black87,
                                  fontSize: 15.0,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        //color: Color.fromRGBO(19, 20, 44, 1),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: 48.0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 28.0,
                      ),
                      child: TextButton(
                        onPressed: () async{
                          const url = 'mailto:parijaprahen@gmail.com?subject=Write your subject&body=Write your query';
                          if (await canLaunch(url)){
                            await launch(url);
                          }else{
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text(
                          "DROP A MAIL",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            image: Container(
                child: Image.asset(
                "assets/personme2.png",
                fit: BoxFit.contain,
                    ),
                  ),
                ),
              );