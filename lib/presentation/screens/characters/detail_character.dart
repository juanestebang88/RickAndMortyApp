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
    final CharacterEntity? character = ref.watch(detailCharacterProvider)[widget.characterId];

    if (character == null) return Image.asset(Constants.loaderMorty);

    return Scaffold(
      floatingActionButton: const CustomFloatingButton(),
      body: Stack(
        children:[
          const BackgroundApp(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 18.0),
                child: Center(child: TextLabel.textBoldRM(text: character.name, size: 38, isBlue: true)),
              ),
              GlassFormism.container(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: FadeInImage(
                          placeholderFit: BoxFit.contain,
                          fit: BoxFit.cover,
                          height: 250.0,
                          image: NetworkImage(character.image),
                          placeholder: const AssetImage(Constants.portal),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        const SizedBox(height: 10.0),

                          DescriptionProperty('Name', character.name),
                          DescriptionProperty('Gender', character.gender),
                          DescriptionProperty('Species', character.species),
                          character.type==''
                          ?const SizedBox.shrink()
                          :DescriptionProperty('Type', character.type),
                          DescriptionProperty('Status', character.status),
                          DescriptionProperty('Created', character.created.toString().substring(0,10)),
                          const LikeButton()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ] 
      )
    );
  }
}

