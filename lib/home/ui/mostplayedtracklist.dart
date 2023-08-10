import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mufy/models/mostplayedtracks.dart';

import '../../musicplayer.dart';

Future<Mostplayedtracks> createAlbum() async {
  final http.Response response = await http.get(
    Uri.parse(
        'https://spotify23.p.rapidapi.com/tracks/?ids=0VjIjW4GlUZAMYd2vXMi3b%2C7qiZfU4dY1lWllzX7mPBI3%2C2N8m6CYs74qQO4mjVcXO30%2C7qEHsqek33rTcFNT9PFqLf%2C3KkXRkHbMCARz0aVfEt68P%2C0e7ipj03S05BNilyu5bRzt%2C12VWzyPDBCc8fqeWCAfNwR%2C5PjdY0CKGZdEuoNab3yDmX'),
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

class MostPlayedTrackList extends StatefulWidget {
  const MostPlayedTrackList({super.key});
  static String mostplayedtracklistroute = '/mostplayedtracklistroute';

  @override
  State<MostPlayedTrackList> createState() => _MostPlayedTrackListState();
}

class _MostPlayedTrackListState extends State<MostPlayedTrackList> {
  Future<Mostplayedtracks>? _futureAlbum;

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
              "Mostly played all over the world!!",
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
                    Icons.arrow_forward_ios_outlined,
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {},
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
            : FutureBuilder<Mostplayedtracks>(
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
                          itemCount: snapshot.data!.tracks!.length,
                          itemBuilder: (context, index) {
                            return GridTile(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      MusicPlayer.musicplayerroute,
                                      arguments: {
                                        'songname':
                                            snapshot.data!.tracks![index].name,
                                        'artistname': snapshot.data!
                                            .tracks![index].artists![0].name,
                                        'songurl': snapshot
                                            .data!.tracks![index].previewUrl,
                                        'imageurl': snapshot
                                            .data!
                                            .tracks![index]
                                            .album!
                                            .images![0]
                                            .url,
                                        'duration': snapshot
                                            .data!.tracks![index].durationMs,
                                      });
                                },
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '${snapshot.data!.tracks![index].album!.images![0].url}',

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
                                          '${snapshot.data!.tracks![index].name}',
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
              ),
      ],
    );
  }
}
