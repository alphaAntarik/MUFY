import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:mufy/seekbar.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'backgroundfilter.dart';
import 'models/mostplayedtracks.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class MusicPlayer extends StatefulWidget {
  static String musicplayerroute = '/musicplayerroute';

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _initAudioPlayer(String url) async {
    await _audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(url))); // Replace with your audio URL
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final k =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

      _initAudioPlayer(k['songurl']);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          _audioPlayer.positionStream, _audioPlayer.durationStream, (
        Duration position,
        Duration? duration,
      ) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> details =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String songname = details['songname'];
    final String imageurl = details['imageurl'];
    final String artistname = details['artistname'];
    final int duration = details['duration'];
    final String songurl = details['songurl'];

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true, // Extend body behind the app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove shadow
        //title: Text('Transparent App Bar'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageurl,
            fit: BoxFit.cover,
          ),
          const BackgroundFilter(),

          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.63,
                left: MediaQuery.of(context).size.width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(songname,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                Text(artistname,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Column(
                  children: [
                    StreamBuilder<SeekBarData>(
                      stream: _seekBarDataStream,
                      builder: (context, snapshot) {
                        final positionData = snapshot.data;
                        return SeekBar(
                          position: positionData?.position ?? Duration.zero,
                          duration: Duration(milliseconds: duration),
                          onChangeEnd: _audioPlayer.seek,
                        );
                      },
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StreamBuilder<SequenceState?>(
                            stream: _audioPlayer.sequenceStateStream,
                            builder: (context, index) {
                              return IconButton(
                                onPressed: _audioPlayer.hasPrevious
                                    ? _audioPlayer.seekToPrevious
                                    : null,
                                iconSize: 45,
                                icon: const Icon(
                                  Icons.skip_previous,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                          StreamBuilder<PlayerState>(
                            stream: _audioPlayer.playerStateStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final playerState = snapshot.data;
                                final processingState =
                                    playerState!.processingState;

                                if (processingState ==
                                        ProcessingState.loading ||
                                    processingState ==
                                        ProcessingState.buffering) {
                                  return Container(
                                    width: 64.0,
                                    height: 64.0,
                                    margin: const EdgeInsets.all(10.0),
                                    child: const CircularProgressIndicator(),
                                  );
                                } else if (!_audioPlayer.playing) {
                                  return IconButton(
                                    onPressed: _audioPlayer.play,
                                    iconSize: 75,
                                    icon: const Icon(
                                      Icons.play_circle,
                                      color: Colors.white,
                                    ),
                                  );
                                } else if (processingState !=
                                    ProcessingState.completed) {
                                  return IconButton(
                                    icon: const Icon(
                                      Icons.pause_circle,
                                      color: Colors.white,
                                    ),
                                    iconSize: 75.0,
                                    onPressed: _audioPlayer.pause,
                                  );
                                } else {
                                  return IconButton(
                                      icon: const Icon(
                                        Icons.replay_circle_filled_outlined,
                                        color: Colors.white,
                                      ),
                                      iconSize: 75.0,
                                      onPressed: () =>
                                          _audioPlayer.seek(Duration.zero));
                                }
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                          StreamBuilder<SequenceState?>(
                            stream: _audioPlayer.sequenceStateStream,
                            builder: (context, index) {
                              return IconButton(
                                onPressed: _audioPlayer.hasNext
                                    ? _audioPlayer.seekToNext
                                    : null,
                                iconSize: 45,
                                icon: const Icon(
                                  Icons.skip_next,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 35,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.height * 0.02),
                          child: IconButton(
                            iconSize: 35,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.cloud_download,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          //player buttons
        ],
      ),
    );
  }
}
