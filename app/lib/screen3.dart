import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  VideoPlayerController c1, c2, c3;
  @override
  void initState() {
    super.initState();
    c1 = VideoPlayerController.asset("vids/sample1.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    c2 = VideoPlayerController.asset("vids/sample2.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    c3 = VideoPlayerController.asset("vids/sample4.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    c1.play();
    c2.play();
    c3.play();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Center(
            child: c1.value.initialized
                ? AspectRatio(
              aspectRatio: 1.0,
              child: VideoPlayer(c1),
            )
                : Container(),
          ),
          Center(
            child: c2.value.initialized
                ? AspectRatio(
              aspectRatio: 1.0,
              child: VideoPlayer(c2),
            )
                : Container(),
          ),
          Center(
            child: c3.value.initialized
                ? AspectRatio(
              aspectRatio: 1.0,
              child: VideoPlayer(c3),
            )
                : Container(),
          ),
        ],
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 2.0,
        padding: EdgeInsets.all(5.0),
      ),

    );
  }

  @override
  void dispose() {
    super.dispose();
    c1.dispose();
    c2.dispose();
    c3.dispose();
  }

}