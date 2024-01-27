import 'package:flutter/material.dart';
import 'package:rick_morty/config/constants/constants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
 Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 15,),
            Image.asset(Constants.logo,
            width: MediaQuery.of(context).size.width*0.5,
            )
          ],
        ),
      )
    );
  }
}