import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0.0,
      backgroundColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          label: 'All',
          icon: Icon(Icons.all_inclusive_sharp)
        ),
        BottomNavigationBarItem(
          label: 'Favorites',
          icon: Icon(Icons.favorite)
        ),
      ],
    );
  }
}