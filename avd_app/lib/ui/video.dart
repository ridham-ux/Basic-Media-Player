import 'package:video_player/video_player.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class VideoAsset extends StatefulWidget {
  VideoAsset() : super();

  final String title = "Video App";
  @override
  _VideoAssetState createState() => _VideoAssetState();
}

class _VideoAssetState extends State<VideoAsset> {
  VideoPlayerController _controller;
  Future<void> _intializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      "assets/demons.mp4",
    );
    _intializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.lightGreenAccent);

    t1() {
      Fluttertoast.showToast(
        msg: "Video Played",
        gravity: ToastGravity.BOTTOM_LEFT,
        fontSize: 20.0,
        textColor: Colors.lightGreenAccent,
        toastLength: Toast.LENGTH_SHORT,
      );
    }

    t2() {
      Fluttertoast.showToast(
        msg: "Video Paused",
        gravity: ToastGravity.BOTTOM_LEFT,
        fontSize: 20.0,
        textColor: Colors.lightGreenAccent,
        toastLength: Toast.LENGTH_SHORT,
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Video Player'),
          backgroundColor: Colors.lightGreenAccent,
        ),
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment(0.4, -0.2),
          children: <Widget>[
            Container(
              height: 227,
              width: 450,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.lightGreenAccent,
                  width: 6,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                      future: _intializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ],
              ),
            ),
            Container(
              alignment: Alignment(0.3, 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.lightGreenAccent,
                    onPressed: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          t2();
                          _controller.pause();
                        } else {
                          t1();
                          _controller.play();
                        }
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text(
                      " Pause  ",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  RaisedButton(
                    color: Colors.lightGreenAccent,
                    onPressed: () {
                      setState(() {
                        t1();
                        _controller.play();
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text(
                      " Play  ",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
