import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/todaystop_at_to_right_blend.dart';
import 'package:http/http.dart' as http;

Future<TodaystopAtToRightBlend> createAlbum() async {
  final http.Response response = await http.get(
    Uri.parse(
        'https://spotify23.p.rapidapi.com/playlist_tracks/?id=37i9dQZF1DXcBWIGoYBM5M&offset=0&limit=100'),
    headers: {
      'X-RapidAPI-Key': '3c2b89367cmshb9c581f8b2f4952p18eb83jsn6a253a6b738c',
      'X-RapidAPI-Host': 'spotify23.p.rapidapi.com'
    },
  );

  if (response.statusCode == 200) {
    return TodaystopAtToRightBlend.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class HeadTabView extends StatefulWidget {
  const HeadTabView({super.key});
  static String headtabviewroute = '/headtabviewroute';

  @override
  State<HeadTabView> createState() => _HeadTabViewState();
}

class _HeadTabViewState extends State<HeadTabView> {
  Future<TodaystopAtToRightBlend>? _futureAlbum;

  final List<String> imageurls = [];

  int _currentIndex = 1;
  PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
    _startImageTraversal();
    _futureAlbum = createAlbum();
  }

  void _startImageTraversal() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % 40;
        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (_futureAlbum == null)
        ? Container()
        : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurple.shade800.withOpacity(0.8),
                  Colors.deepPurple.shade200.withOpacity(0.8),
                ],
              ),
            ),
            child: FutureBuilder<TodaystopAtToRightBlend>(
                future: _futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    for (int i = 1; i <= 40; i++) {
                      imageurls.add(snapshot
                              .data!.items![i].track!.album!.images![0].url ??
                          "");
                    }
                    return Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.height *
                            0.7, // Adjust the width as needed
                        height: MediaQuery.of(context).size.height *
                            0.4, // Adjust the height as needed
                        color: Theme.of(context)
                            .canvasColor, // Replace with your desired color
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: imageurls.length,
                          // controller: PageController(viewportFraction: 0.8),
                          itemBuilder: (context, index) {
                            return (index == _currentIndex - 1 && index >= 1)
                                ? Container()
                                : index == _currentIndex + 1
                                    ? Container()
                                    : Image.network(
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.7, // Set the width
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.6,
                                        imageurls[index],
                                        fit: BoxFit.cover,
                                      );
                          },
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Container();
                }),
          );
  }
}
