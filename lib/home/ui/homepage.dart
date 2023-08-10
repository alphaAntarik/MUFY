import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mufy/podcast/podcast.dart';

import '../../episode/episodepage.dart';
import '../../models/todaystop_at_to_right_blend.dart';
import '../../search/ui/searchpage.dart';
import 'headtabview.dart';
import 'homemain.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? b1pressed;
  bool? b2pressed;
  bool? b3pressed;
  final controller = FadeInController();

  @override
  void initState() {
    super.initState();
    // Your initialization code here
    b1pressed = true;
    b2pressed = false;
    b3pressed = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      // body: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       colors: [
      //         Colors.deepPurple.shade800.withOpacity(0.8),
      //         Colors.deepPurple.shade200.withOpacity(0.8),
      //       ],
      //     ),
      //   ),
      //   child:
      body: SingleChildScrollView(
        child:
            // Stack(
            //   children: [
            //HeadTabView(),
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: Theme.of(context).accentColor,
                      icon: Icon(
                        Icons.menu,
                        size: MediaQuery.of(context).size.height * 0.06,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer(); // Open the drawer
                      },
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.3,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.05),
                      child: IconButton(
                        color: Theme.of(context).accentColor,
                        icon: Icon(
                          Icons.search,
                          size: MediaQuery.of(context).size.height * 0.06,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            SearchPage.searchpage,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                //Drawer(),
                Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.017),
                  child: Text(
                    "MUFY",
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displayLarge),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.005),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          b1pressed = true;
                          b2pressed = false;
                          b3pressed = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.height *
                                0.008, // Set the desired size of the dot
                            height: MediaQuery.of(context).size.height * 0.008,
                            decoration: BoxDecoration(
                              color: b1pressed == true
                                  ? Colors.white
                                  : Theme.of(context)
                                      .canvasColor, // Set the desired color of the dot
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      )),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        b2pressed = true;
                        b1pressed = false;
                        b3pressed = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Episodes',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.height *
                              0.008, // Set the desired size of the dot
                          height: MediaQuery.of(context).size.height * 0.008,
                          decoration: BoxDecoration(
                            color: b2pressed == true
                                ? Colors.white
                                : Theme.of(context)
                                    .canvasColor, // Set the desired color of the dot
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          b3pressed = true;
                          b1pressed = false;
                          b2pressed = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'Podcasts',
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.height *
                                0.008, // Set the desired size of the dot
                            height: MediaQuery.of(context).size.height * 0.008,
                            decoration: BoxDecoration(
                              color: b3pressed == true
                                  ? Colors.white
                                  : Theme.of(context)
                                      .canvasColor, // Set the desired color of the dot
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),

            (b1pressed == true)
                ? SingleChildScrollView(child: HomeMain())
                : (b2pressed == true)
                    ? EpisodePage()
                    : (b3pressed == true)
                        ? PodcastPage()
                        : HomeMain(),
            //Center(child: Text("Mu-fy")),
          ],
        ),
        //   ],
        // ),
      ),
    );
  }
}
