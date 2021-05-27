import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/MusicsController.dart';
import 'package:music_app/models/MusicModel.dart';
import 'package:music_app/pages/MusicApp.dart';
import 'package:music_app/repos/MusicRepo.dart';
import 'package:music_app/widgets/BottomNavigation.dart';
import 'package:music_app/widgets/SearchField.dart';
import 'package:music_app/widgets/Song.dart';

class SearchPage extends StatelessWidget {
  final searchController = TextEditingController();
  final TextStyle textStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  final TextStyle artistStyle = TextStyle(
    color: Color.fromRGBO(99, 94, 226, 1),
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  final TextStyle nameStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 20,
  );
  @override
  Widget build(BuildContext context) {
    final musicsController = Get.put(MusicsController(filterController: searchController));

    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 19),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'title_search'.tr,
                        style: textStyle,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Container(
                          // линия
                          decoration: BoxDecoration(
                              //borderRadius: BorderRadius.all(Radius.circular(2)),
                              gradient: LinearGradient(colors: [
                            Color.fromRGBO(99, 94, 226, 1),
                            Color.fromRGBO(168, 219, 250, 1),
                          ])),
                          height: 2),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: SearchField(
                          defaultValue: 'field_search'.tr,
                          controller: searchController,
                          secured: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() { // Виджет для динамического отображения данных с потоков
                    List<MusicModel> musics = musicsController.musics;
                    if(musicsController.loading.value) {
                      return Center(child: CircularProgressIndicator(),);
                    }
                    if (musics.length > 0) {
                      return ListView.builder(
                        itemCount: musics.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          MusicModel music = musics[index];
                          return Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Song(
                              music.artistName,
                              music.songName,
                              Image.network(music.imageUrl, height: 60, width: 60,),
                              onPressed: () {
                                Get.to(() => MusicApp(music: music,));
                              },
                            ),
                          );
                        },
                      );
                    }
                    return Center(child: Text("Not Found"));
                },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(NavigationItem.SEARCH, context),
    );
  }
}
