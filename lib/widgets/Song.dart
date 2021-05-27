import 'package:flutter/material.dart';

class Song extends StatelessWidget {
  final String artistName;
  final String songName;
  final Image image;
  final Function onPressed;


  Song(this.artistName, this.songName, this.image, {this.onPressed});

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
    //fontWeight: FontWeight.bold,
  );

  trimName(String name) {
    int limit = 16;
    if(name.length < limit)
      return name;
    return name.substring(0, limit) + "...";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed:onPressed,
        minWidth: double.infinity,
        child: Container(
          child: Row(
            children: [
              image,
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trimName(artistName),
                    style: artistStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    trimName(songName),
                    style: nameStyle,
                  ),
                ],
              ),
              Spacer(),
              Image.asset('assets/heart.png'),
            ],
          ),
        ),
      ),
    );
  }
}
