import 'dart:convert';

import 'package:duration_button/duration_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../models/mostplayedtracks.dart';
import 'package:http/http.dart' as http;

import '../../musicplayer.dart';
import '../../musicplayer2.dart';

Future<Mostplayedtracks> createAlbum(String id) async {
  final http.Response response = await http.get(
    Uri.parse('https://spotify23.p.rapidapi.com/tracks/?ids=$id'),
    headers: {
      'X-RapidAPI-Key': '46f7dffe1amsh1715f22da088b7bp195c52jsn2014f61ad5fc',
      'X-RapidAPI-Host': 'spotify23.p.rapidapi.com'
    },
  );

  if (response.statusCode == 200) {
    return Mostplayedtracks.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class TopTracks extends StatefulWidget {
  final String? id;

  TopTracks({this.id = ''});

  @override
  State<TopTracks> createState() => _TopTracksState();
}

class _TopTracksState extends State<TopTracks> {
  Future<Mostplayedtracks>? _futureAlbum;

  @override
  void initState() {
    super.initState();

    // Initialize the string using the context
    //id = "Initializing...";

    _futureAlbum = createAlbum(widget.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _futureAlbum == null
          ? Center(
              child: Text("hi"),
            )
          : FutureBuilder<Mostplayedtracks>(
              future: _futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return IconDurationButton(Icons.favorite,
                          size: 30, iconColor: Colors.pink, onPressed: () {
                        Navigator.of(context).pushNamed(
                            MusicPlayer2.MusicPlayer2route,
                            arguments: {
                              'songname': snapshot.data!.tracks![index].name,
                              'artistname': snapshot
                                  .data!.tracks![index].artists![0].name,
                              'songurl':
                                  snapshot.data!.tracks![index].previewUrl,
                              'imageurl': snapshot
                                  .data!.tracks![index].album!.images![0].url,
                              'duration':
                                  snapshot.data!.tracks![index].durationMs,
                            });
                      }, duration: const Duration(seconds: 0));
                    },
                  );
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
