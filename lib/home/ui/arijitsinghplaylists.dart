import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../models/arijitsinghhitsmodel.dart';
import '../../musicplayer.dart';

Future<Arijitsinghhitsmodel> createAlbum() async {
  final http.Response response = await http.get(
    Uri.parse(
        'https://deezerdevs-deezer.p.rapidapi.com/search?q=arijit%20singh'),
    headers: {
      "X-RapidAPI-Key": "c0c533132cmsh9902808cfe93801p172f22jsn1fd21f57c77f",
      "X-RapidAPI-Host": "deezerdevs-deezer.p.rapidapi.com"
    },
  );

  if (response.statusCode == 200) {
    return Arijitsinghhitsmodel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class ArijitSinghPlaylist extends StatefulWidget {
  const ArijitSinghPlaylist({super.key});
  static String arijitsinghhits = '/arijitsinghhits';

  @override
  State<ArijitSinghPlaylist> createState() => _ArijitSinghPlaylistState();
}

class _ArijitSinghPlaylistState extends State<ArijitSinghPlaylist> {
  Future<Arijitsinghhitsmodel>? _futureAlbum;
  bool clicked = false;

  @override
  void initState() {
    super.initState();
    _futureAlbum = createAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Best of Arijit Sing's",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).accentColor,
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: FontWeight.w800),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.02),
              child: Container(
                child: IconButton(
                  icon: Icon(
                    !clicked
                        ? Icons.arrow_forward_ios_outlined
                        : Icons.arrow_back_ios_new_outlined,
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    setState(() {
                      clicked = !clicked;
                    });
                  },
                ),
                width: MediaQuery.of(context).size.height *
                    0.08, // Set the desired size of the dot
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context)
                        .accentColor, // Set the border color here
                    width: 2, // Set the border width
                  ),
                  color: Theme.of(context)
                      .canvasColor, // Set the desired color of the dot
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        (_futureAlbum == null)
            ? Container()
            : FutureBuilder<Arijitsinghhitsmodel>(
                future: _futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: GridView.builder(
                          primary: false,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent:
                                      MediaQuery.of(context).size.height * 0.2,
                                  childAspectRatio: 1,
                                  crossAxisSpacing:
                                      MediaQuery.of(context).size.height * 0.02,
                                  mainAxisSpacing:
                                      MediaQuery.of(context).size.height *
                                          0.02),
                          itemCount: clicked ? snapshot.data!.data!.length : 8,
                          itemBuilder: (context, index) {
                            return GridTile(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      MusicPlayer.musicplayerroute,
                                      arguments: {
                                        'songname': snapshot
                                            .data!.data![index].album!.title,
                                        'artistname': snapshot
                                            .data!.data![index].artist!.name,
                                        'songurl':
                                            snapshot.data!.data![index].preview,
                                        'imageurl': snapshot
                                            .data!.data![index].album!.coverBig,
                                        'duration': snapshot
                                                .data!.data![index].duration! *
                                            1000,
                                      });
                                },
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '${snapshot.data!.data![index].album!.coverMedium}',

                                        fit: BoxFit.contain,

                                        placeholder: (context, url) =>
                                            Container(), // Placeholder widget while loading
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons
                                                .error), // Widget to display on error
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        color: Colors.black54,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 20),
                                        child: Text(
                                          '${snapshot.data!.data![index].album!.title}',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              color: Colors.white),
                                          softWrap: true,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      child: Text("${snapshot.error}"),
                    );
                  }

                  return Center(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.30,
                        vertical: MediaQuery.of(context).size.height * 0.37),
                    child: Row(
                      children: [
                        Text(
                          "Loading",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                          width: MediaQuery.of(context).size.height * 0.02,
                          child: CircularProgressIndicator(
                            color: Theme.of(context).accentColor,
                            strokeWidth: 2,
                          ),
                        )
                      ],
                    ),
                  ));
                },
              )
      ],
    );
  }
}
