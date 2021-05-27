class MusicModel {
  int index;
  String songUrl;
  String imageUrl;
  String songName;
  String artistName;

  MusicModel({this.songUrl, this.imageUrl, this.songName, this.artistName});

  MusicModel.fromJson(Map<String, dynamic> json) {
    songUrl = json['song_url'];
    imageUrl = json['image_url'];
    songName = json['song_name'];
    artistName = json['artist_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['song_url'] = this.songUrl;
    data['image_url'] = this.imageUrl;
    data['song_name'] = this.songName;
    data['artist_name'] = this.artistName;
    return data;
  }
}
