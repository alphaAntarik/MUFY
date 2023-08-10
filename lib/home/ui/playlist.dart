// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

import '../../models/playlistretrivesongmodel.dart';
import '../../musicplayer.dart';

Future<Playlistretrivesongmodel> createAlbum(String id) async {
  final http.Response response = await http.get(
    Uri.parse(
        'https://spotify23.p.rapidapi.com/playlist_tracks/?id=$id&offset=0&limit=50'),
    headers: {
      'X-RapidAPI-Key': '46f7dffe1amsh1715f22da088b7bp195c52jsn2014f61ad5fc',
      'X-RapidAPI-Host': 'spotify23.p.rapidapi.com'
    },
  );

  if (response.statusCode == 200) {
    return Playlistretrivesongmodel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class PlayListWidget extends StatefulWidget {
  final String id;
  final String playlistName;
  PlayListWidget({this.id = '', this.playlistName = ''});

  @override
  State<PlayListWidget> createState() => _PlayListWidgetState();
}

class _PlayListWidgetState extends State<PlayListWidget> {
  Future<Playlistretrivesongmodel>? _futureAlbum;

  @override
  void initState() {
    super.initState();

    // Initialize the string using the context
    //id = "Initializing...";

    _futureAlbum = createAlbum(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    // String _id = ModalRoute.of(context)!.settings.arguments as String;
    //String cutString = _id.substring(17);
    return Scaffold(
      //backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true, // Extend body behind the app bar
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).canvasColor, // Make the app bar transparent
        elevation: 0, // Remove shadow
        title: Text(
          widget.playlistName,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontSize: MediaQuery.of(context).size.height * 0.03),
        ),
      ),
      body: (_futureAlbum == null)
          ? Center(
              child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35),
              child: Text(
                "no data found!!! ",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ))
          : FutureBuilder<Playlistretrivesongmodel>(
              future: _futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.items!.length,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  MusicPlayer.musicplayerroute,
                                  arguments: {
                                    'songname': snapshot
                                        .data!.items![index].track!.name,
                                    'artistname': snapshot.data!.items![index]
                                        .track!.artists![0].name,
                                    'songurl': snapshot
                                        .data!.items![index].track!.previewUrl,
                                    'imageurl': snapshot.data!.items![index]
                                        .track!.album!.images![0].url,
                                    'duration': snapshot
                                        .data!.items![index].track!.durationMs,
                                  });
                            },
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Text(
                                          '${snapshot.data!.items![index].track!.name}',
                                          softWrap: true,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              '${snapshot.data!.items![index].track!.album!.images![0].url}',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          fit: BoxFit.contain,

                                          placeholder: (context, url) =>
                                              Container(), // Placeholder widget while loading
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons
                                                  .error), // Widget to display on error
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.015,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.play_circle_outline_sharp,
                                            color:
                                                Theme.of(context).accentColor,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Container(
                    child: Text("${snapshot.error}"),
                  );
                }

                return Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kIsWeb
                          ? MediaQuery.of(context).size.width * 0.45
                          : MediaQuery.of(context).size.width * 0.3,
                      vertical: kIsWeb
                          ? MediaQuery.of(context).size.height * 0.37
                          : MediaQuery.of(context).size.height * 0.1),
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
            ),
    );
  }
}
