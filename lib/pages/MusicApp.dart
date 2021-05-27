import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/controllers/MusicsController.dart';
import 'package:music_app/models/MusicModel.dart';
import 'package:music_app/pages/SearchPage.dart';
import 'package:get/get.dart';

class MusicApp extends StatefulWidget {
  final MusicModel music;

  MusicApp({this.music});

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;
  MusicModel currentMusic;
  AudioPlayer _player;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  void play() {
    _player.play(currentMusic.songUrl);
    setState(() {
      playBtn = Icons.pause;
      playing = true;
    });
  }

  void pause() {
    _player.pause();
    setState(() {
      playBtn = Icons.play_arrow;
      playing = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    currentMusic = this.widget.music;

    _player.onDurationChanged.listen((duration) => setState(() {
          musicLength = duration;
        }));
    _player.onAudioPositionChanged
        .listen((pos) => setState(() => position = pos));
  }

  @override
  void dispose() {
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<MusicModel> musics = Get.find<MusicsController>().musics;
    int currentIndex = musics.indexOf(currentMusic);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.pinkAccent[200],
                Colors.deepPurple[800],
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 48.0,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  height: 25,
                  minWidth: 20,
                  child: Image.asset('assets/back.png'),
                  onPressed: () => Get.back()
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Music App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'text_player'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Center(
                    child: Image.network(
                  currentMusic.imageUrl,
                  width: 200,
                  height: 200,
                )),
                SizedBox(
                  height: 18.0,
                ),
                Center(
                  child: Text(
                    currentMusic.songName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Center(
                  child: Text(
                    currentMusic.artistName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 500.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              slider(),
                              Text(
                                "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.blue,
                              onPressed: () {
                                setState(() {
                                  if (currentIndex == 0) {
                                    currentMusic = musics[musics.length - 1];
                                  } else
                                    currentMusic = musics[currentIndex - 1];
                                  pause();
                                  position = Duration();
                                  musicLength = Duration();
                                });
                              },
                              icon: Icon(
                                Icons.skip_previous,
                              ),
                            ),
                            IconButton(
                              iconSize: 62.0,
                              color: Colors.blue[800],
                              onPressed: () {
                                //here we will add the functionality of the play button
                                if (!playing) {
                                  play();
                                } else {
                                  pause();
                                }
                              },
                              icon: Icon(
                                playBtn,
                              ),
                            ),
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.blue,
                              onPressed: () {
                                setState(() {
                                  if (currentIndex == musics.length - 1)
                                    currentMusic = musics[0];
                                  else
                                    currentMusic = musics[currentIndex + 1];
                                  pause();
                                  position = Duration();
                                  musicLength = Duration();
                                });
                              },
                              icon: Icon(
                                Icons.skip_next,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
