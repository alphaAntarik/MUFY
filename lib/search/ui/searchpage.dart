import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../home/ui/playlist.dart';
import '../../home/ui/toptracks.dart';
import '../../models/searchmodel.dart';
import '../../musicplayer.dart';

Future<Searchmodel> createAlbum(String search) async {
  final http.Response response = await http.get(
    Uri.parse(
        'https://spotify23.p.rapidapi.com/search/?q=$search&type=multi&offset=0&limit=10&numberOfTopResults=5'),
    headers: {
      'X-RapidAPI-Key': '46f7dffe1amsh1715f22da088b7bp195c52jsn2014f61ad5fc',
      'X-RapidAPI-Host': 'spotify23.p.rapidapi.com'
    },
  );

  if (response.statusCode == 200) {
    return Searchmodel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class SearchPage extends StatefulWidget {
  static String searchpage = '/searchpageroute';
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<Searchmodel>? _futureAlbum;
  String _inputText = '';

  void _handleSubmitted(String value) {
    setState(() {
      _inputText = value;
      _futureAlbum = createAlbum(_inputText);
    });
  }

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  style: TextStyle(color: Theme.of(context).accentColor),
                  //enabled: false,
                  controller: _nameController,
                  onFieldSubmitted: _handleSubmitted,

                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).accentColor,
                      ),
                      border: InputBorder.none,
                      hintText: "Search any playlist...",
                      hintStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                      )),
                )),
            (_futureAlbum == null)
                ? Center(
                    child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.35),
                    child: Text(
                      "no data found!!!",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ))
                : Expanded(
                    child: FutureBuilder<Searchmodel>(
                      future: _futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return
                              // Expanded(
                              //   child: SingleChildScrollView(
                              //     child: Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              // SizedBox(
                              //   height:
                              //       MediaQuery.of(context).size.height * 0.02,
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.only(
                              //       left: MediaQuery.of(context).size.height *
                              //           0.01),
                              //   child: Text(
                              //     "Top Playlists -",
                              //     style: Theme.of(context)
                              //         .textTheme
                              //         .displayLarge!
                              //         .copyWith(
                              //             fontStyle: FontStyle.italic,
                              //             fontSize: MediaQuery.of(context)
                              //                     .size
                              //                     .height *
                              //                 0.02),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height:
                              //       MediaQuery.of(context).size.height * 0.02,
                              // ),
                              Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Text(
                                  "Top Playlists -",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          fontStyle: FontStyle.italic,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    //scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount:
                                        snapshot.data!.playlists!.items!.length,
                                    itemBuilder: (context, index) {
                                      return Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            String? k = snapshot
                                                .data!
                                                .playlists!
                                                .items![index]
                                                .data!
                                                .uri;
                                            String? news = k!.substring(17);

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PlayListWidget(
                                                  id: news,
                                                  playlistName:
                                                      "${snapshot.data!.playlists!.items![index].data!.name}",
                                                ),
                                              ),
                                            );
                                          },
                                          child: ListTile(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    (kIsWeb)
                                                        ? Text(
                                                            '${snapshot.data!.playlists!.items![index].data!.name} - ',
                                                            softWrap: true,
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        : Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.5,
                                                            child: Text(
                                                              '${snapshot.data!.playlists!.items![index].data!.name} ',
                                                              softWrap: true,
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        '${snapshot.data!.playlists!.items![index].data!.images!.items![0].sources![0].url}',
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    fit: BoxFit.contain,

                                                    placeholder: (context,
                                                            url) =>
                                                        Container(), // Placeholder widget while loading
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Icon(Icons
                                                            .error), // Widget to display on error
                                                  ),
                                                ),
                                              ],
                                            ),
                                            subtitle: kIsWeb
                                                ? Text(
                                                    '${snapshot.data!.playlists!.items![index].data!.description}',
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.fade,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall,
                                                  )
                                                : Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    child: Text(
                                                      '${snapshot.data!.albums!.items![index].data!.artists!.items![0].profile!.name}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displaySmall,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                          ),
                                          //  ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          );
                          //       ],
                          //     ),
                          //   ),
                          // );
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
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                                width:
                                    MediaQuery.of(context).size.height * 0.02,
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
                  ),
          ],
        ));
  }
}
