import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rick_morty/config/constants/constants.dart';
import 'package:rick_morty/domain/entities/character.dart';
import 'package:rick_morty/presentation/providers/providers.dart';
import 'package:rick_morty/presentation/widgets/widgets.dart';

class DetailCharacterScreen extends ConsumerStatefulWidget {
  static const name = 'detail-character-screen';
  final String characterId;

  const DetailCharacterScreen({super.key, required this.characterId});

  @override
  DetailCharacterScreenState createState() => DetailCharacterScreenState();
}

class DetailCharacterScreenState extends ConsumerState<DetailCharacterScreen> {
  @override
  void initState() {
    ref.read(detailCharacterProvider.notifier).loadCharacter(widget.characterId);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    final mediaQ = MediaQuery.of(context).size;
    final CharacterEntity? character = ref.watch(detailCharacterProvider)[widget.characterId];
    if (character == null) return Image.asset(Constants.loaderMorty);

    return Scaffold(
      floatingActionButton: const CustomFloatingButton(),
      body: Stack(
        children:[
          const BackgroundApp(),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NameCharacter(mediaQ: mediaQ, name: character.name),
                GlassFormism.container(
                  child: SizedBox(
                    width: mediaQ.width*0.8,
                    child: Column(
                      children: [
                        ImageCharacter(image: character.image, size: mediaQ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
            
                            DescriptionProperty(mediaQ, 'Name', character.name),
                            DescriptionProperty(mediaQ, 'Gender', character.gender),
                            DescriptionProperty(mediaQ, 'Species', character.species),
                            character.type==''
                            ?const SizedBox.shrink()
                            :DescriptionProperty(mediaQ, 'Type', character.type),
                            DescriptionProperty(mediaQ, 'Origin', character.origin),
                            DescriptionProperty(mediaQ, 'Location', character.location),
                            DescriptionProperty(mediaQ, 'Status', character.status),
                            DescriptionProperty(mediaQ, 'Created', character.created.toString().substring(0,10)),
                            
                            const SizedBox(height: 10.0),
                            LikeButton(
                              characterId: widget.characterId,
                              onPressed: (){
                                final int id = int.parse(widget.characterId);
                                ref.read(favoritesCharacterProvider.notifier).toggleFavorite(character)
                                  .then((value) => ref.invalidate(isFavoriteProvider(id)));
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ] 
      )
    );
  }
}

class LikeButton extends ConsumerWidget {
  const LikeButton({
    super.key,
    required this.characterId,
    required this.onPressed

  });

  final String characterId;
  final void Function()? onPressed;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int id = int.parse(characterId);
    final isFavoriteFuture = ref.watch(isFavoriteProvider(id));
    return IconButton(
      onPressed: onPressed,
      icon: isFavoriteFuture.when(
        loading: ()=> CircularProgressIndicator(
          strokeWidth: 2.0, color: Constants.blueOpacityRM),
        data: (isFavorite) => isFavorite
          ?Icon(Icons.favorite,
            size: 50,
            color: Constants.blueOpacityRM)
          :Icon(Icons.favorite_border,
            size: 50,
            color: Constants.blueOpacityRM),
        error: (error, stackTrace) => throw UnimplementedError(),
      )
    );
  }
}
