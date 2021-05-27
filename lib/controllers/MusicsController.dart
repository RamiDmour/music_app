import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:music_app/models/MusicModel.dart';
import 'package:music_app/repos/MusicRepo.dart';

class MusicsController extends GetxController {
  final musics = List<MusicModel>().obs;
  final loading = false.obs;
  final TextEditingController filterController;

  MusicsController({this.filterController});

  @override
  Future<void> onInit() async { // onInit срабатывает при Get.put(MusicsController().
    super.onInit();
    fetchMusics();
  }

  void fetchMusics() async {
    loading.value = true;
    List<MusicModel> fetchedMusics = await MusicRepo.getMusics();
    if (filterController != null) {
      filterController.addListener(() {
        musics.assignAll(fetchedMusics.where(
            (music) => music.songName.contains(filterController.text)));
      });
    }
    musics.assignAll(fetchedMusics);
    loading.value = false;
  }
}
