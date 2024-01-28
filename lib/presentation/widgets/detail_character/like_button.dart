import 'package:flutter/material.dart';
import 'package:rick_morty/config/constants/constants.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  LikeButtonState createState() => LikeButtonState();
}

class LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isLiked ? Constants.blueOpacityRM : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          Icons.favorite,
          color: isLiked ? Colors.white : Constants.blueOpacityRM ,
          size: 30.0,
        ),
      ),
    );
  }
}