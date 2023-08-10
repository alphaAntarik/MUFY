import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mufy/home/ui/arijitsinghplaylists.dart';
import 'package:mufy/home/ui/internationalsongplaylists.dart';
import 'package:mufy/home/ui/playlist.dart';

import 'mostplayedtracklist.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});
  static String homemainroute = '/homemainroute';

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.017),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          MostPlayedTrackList(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          InternationalSongPlaylist(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          ArijitSinghPlaylist(),
          //PlayListWidget()
        ],
      ),
    );
  }
}
