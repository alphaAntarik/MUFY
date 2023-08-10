import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:mufy/home/ui/playlist.dart';

import '../../models/internationalsongplaylistmodel.dart';

Future<Internationalsongplaylistmodel> createAlbum() async {
  final http.Response response = await http.get(
    Uri.parse(
        'https://spotify23.p.rapidapi.com/search/?q=international%20song%20playlists&type=playlists&offset=0&limit=20&numberOfTopResults=5'),
    headers: {
      'X-RapidAPI-Key': '46f7dffe1amsh1715f22da088b7bp195c52jsn2014f61ad5fc',
      'X-RapidAPI-Host': 'spotify23.p.rapidapi.com'
    },
  );

  if (response.statusCode == 200) {
    return Internationalsongplaylistmodel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class InternationalSongPlaylist extends StatefulWidget {
  const InternationalSongPlaylist({super.key});
  static String internationalsongplaylists = '/internationalsongplaylists';

  @override
  State<InternationalSongPlaylist> createState() =>
      _InternationalSongPlaylistState();
}

class _InternationalSongPlaylistState extends State<InternationalSongPlaylist> {
  Future<Internationalsongplaylistmodel>? _futureAlbum;
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
              "International playlists!!",
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
            : FutureBuilder<Internationalsongplaylistmodel>(
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
                          itemCount: clicked
                              ? snapshot.data!.playlists!.items!.length
                              : 8,
                          itemBuilder: (context, index) {
                            return GridTile(
                              child: InkWell(
                                onTap: () {
                                  String? k = snapshot
                                      .data!.playlists!.items![index].data!.uri;
                                  String? news = k!.substring(17);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlayListWidget(
                                        id: news,
                                        playlistName:
                                            "${snapshot.data!.playlists!.items![index].data!.name}",
                                      ),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '${snapshot.data!.playlists!.items![index].data!.images!.items![0].sources![0].url}',

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
                                          '${snapshot.data!.playlists!.items![index].data!.name}',
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
