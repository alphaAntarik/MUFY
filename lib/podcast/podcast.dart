import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class PodcastPage extends StatelessWidget {
  const PodcastPage({super.key});
  static String podcastroute = '/podcastroute';

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Center(
          child: Text(
        "Podcasts",
        style: Theme.of(context).textTheme.displayLarge,
      )),
      controller: FadeInController(autoStart: true),
    );
  }
}
