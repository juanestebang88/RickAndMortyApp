
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty/config/constants/constants.dart';
import 'package:rick_morty/presentation/providers/storage/favorites_characters_provider.dart';
import 'package:rick_morty/presentation/widgets/widgets.dart';

class CustomFloatingButton extends ConsumerStatefulWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  CustomFloatingButtonState createState() => CustomFloatingButtonState();
}

class CustomFloatingButtonState extends ConsumerState<CustomFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        ref.read(favoritesCharacterProvider.notifier).loadNextPage().then((value) => 
        context.push('/favorites-screen'),);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(10.0),
        width: 120,
        height: 50,
      decoration: BoxDecoration(
        boxShadow: [ BoxShadow(color: Colors.black.withOpacity(0.25)) ],
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 0.5),
        gradient: LinearGradient(
          stops: const [0.0, 1.0],
          colors: [
            Constants.blueOpacityRM,
            const Color.fromARGB(255, 28, 104, 116).withOpacity(0.4)
          ],
        ),
        borderRadius: BorderRadius.circular(20)
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.favorite, color: Colors.white.withOpacity(0.8),),
            TextLabel.textBoldRM(text: 'Favorites', size: 15),
          ],
        ),
      ),
    );
  }
}
