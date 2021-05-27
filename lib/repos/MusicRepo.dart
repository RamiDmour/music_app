import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_app/models/MusicModel.dart';

class MusicRepo {
  static final CollectionReference _musics =
      FirebaseFirestore.instance.collection('musics');

  static Future<List<MusicModel>> getMusics() async {
    return _musics.get().then((musics) =>
        musics.docs.map((music) => MusicModel.fromJson(music.data())).toList());
  }
}
