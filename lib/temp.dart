import 'package:flutter/material.dart';
//import 'package:music_app/playaudio.dart';
import 'config/palette.dart';

class SongBubble extends StatefulWidget {
  @override
  _SongBubbleState createState() => _SongBubbleState();
}

class _SongBubbleState extends State<SongBubble> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Scaffold();
          }),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.kPrimaryColor],
          ),
        ),
        height: 100,
        width: screenWidth - 60,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Container(
                margin: EdgeInsets.all(5),
                width: 70.0,
                height: 70.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg'),
                    ))),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Text(
                    "Hello",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    //softWrap: true,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Flexible(
                  child: Text(
                    "bc",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    //softWrap: true,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
