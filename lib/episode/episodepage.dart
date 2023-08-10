import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class EpisodePage extends StatefulWidget {
  const EpisodePage({super.key});
  static String episodepageroute = '/episodepageroute';

  @override
  State<EpisodePage> createState() => _EpisodePageState();
}

class _EpisodePageState extends State<EpisodePage> {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Center(
          child: Text(
        "Episode page",
        style: Theme.of(context).textTheme.displayLarge,
      )),
      controller: FadeInController(autoStart: true),
    );
  }
}
