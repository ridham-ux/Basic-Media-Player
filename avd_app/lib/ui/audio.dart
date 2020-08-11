import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

import 'package:flutter/material.dart';
import 'package:avd_app/ui/video.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AudioPlayer newPlayer = new AudioPlayer();
    AudioCache audio = new AudioCache(fixedPlayer: newPlayer);
    var play = 0;
    var stop = 1;

    playAudio() {
      if (play == 0 || stop == 1) {
        audio.play("demons.mp3");
        play = 1;
        stop = 0;
      }
    }

    pauseAudio() {
      if (play == 1) {
        newPlayer.pause();
        play = 0;
      }
    }

    stopAudio() {
      if (play == 1 && stop == 0) {
        newPlayer.stop();
        play = 0;
        stop = 1;
      }
    }

    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              )),
        ],
        backgroundColor: Colors.lightGreenAccent,
        title: Text('Music Player'),
        centerTitle: false,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset("assets/d.jpg"),
          Container(
            width: MediaQuery.of(context).size.width * 0.70,
            height: 48,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.55,
                left: MediaQuery.of(context).size.width * 0.15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(80)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.play_arrow),
                      onPressed: playAudio,
                    ),
                    IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.pause),
                      onPressed: pauseAudio,
                    ),
                    IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.stop),
                      onPressed: stopAudio,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.2, 0.5),
            child: Text(
              'Demons-Imagine Dragons',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightGreenAccent, fontSize: 25),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), title: Text('Home')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search), title: Text('Search')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.playlist_play),
                        title: Text('Playlist')),
                    //BottomNavigationBarItem(
                    //icon: Icon(Icons.art_track), title: Text('Artists')),
                    //BottomNavigationBarItem(
                    //  icon: Icon(Icons.favorite), title: Text('Playlists')),
                  ],
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white,
                  backgroundColor: Colors.lightGreenAccent,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        // padding: EdgeInsets.only(bottom: 100.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0.2, 0.8),
              child: FloatingActionButton.extended(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VideoAsset()),
                  );
                },
                icon: Icon(Icons.personal_video),
                heroTag: "Local",
                label: Text("Video Player"),
                backgroundColor: Colors.lightGreenAccent,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
