import 'package:farmland/home/Rent/searchrent.dart';
import 'package:flutter/material.dart';
import '../../config/palette.dart';

class Rent extends StatefulWidget {
  @override
  _RentState createState() => _RentState();
}

class _RentState extends State<Rent> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return SearchRent();
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
                    shape: BoxShape.rectangle,
                    image: new DecorationImage(
                      image: AssetImage('assets/images/3.jpg'),
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
                    "RENT",
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
                    ".",
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
