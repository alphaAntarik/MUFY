import 'package:flutter/material.dart';
import 'package:mufy/home/ui/arijitsinghplaylists.dart';
import 'package:mufy/home/ui/internationalsongplaylists.dart';
import 'package:mufy/podcast/podcast.dart';
import 'package:mufy/search/ui/searchpage.dart';
import 'package:provider/provider.dart';

import 'episode/episodepage.dart';
import 'home/ui/headtabview.dart';
import 'home/ui/homemain.dart';
import 'home/ui/homepage.dart';
import 'home/ui/mostplayedtracklist.dart';
import 'home/ui/playlist.dart';
import 'models/mostplayedtracks.dart';
import 'musicplayer.dart';
import 'musicplayer2.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mufy',
      theme: ThemeData(
        primaryColor: Color(0xFF1A1A1A),
        canvasColor: Color(0xFF222222),
        accentColor: Colors.grey,
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.04,
              fontWeight: FontWeight.bold,
              color: Colors.white //title
              ),

          displaySmall: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).size.height * 0.02), //subtitle
        ),
      ),
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        SearchPage.searchpage: (context) => SearchPage(),
        HomeMain.homemainroute: (context) => HomeMain(),
        PodcastPage.podcastroute: (context) => PodcastPage(),
        EpisodePage.episodepageroute: (context) => EpisodePage(),
        //SearchResultPage.searchresult: (context) => SearchResultPage()
        MostPlayedTrackList.mostplayedtracklistroute: (context) =>
            MostPlayedTrackList(),
        InternationalSongPlaylist.internationalsongplaylists: (context) =>
            InternationalSongPlaylist(),
        ArijitSinghPlaylist.arijitsinghhits: (context) => ArijitSinghPlaylist(),

        ///HeadTabView.headtabviewroute: (context) => HeadTabView(),
        MusicPlayer.musicplayerroute: (context) => MusicPlayer(),
        MusicPlayer2.MusicPlayer2route: (context) => MusicPlayer2(),
      },
    );
  }
}
