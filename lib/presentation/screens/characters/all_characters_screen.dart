import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty/config/constants/constants.dart';

import 'package:rick_morty/presentation/providers/characters/character_provider.dart';
import 'package:rick_morty/presentation/widgets/shared/glass.dart';
import 'package:rick_morty/presentation/widgets/widgets.dart';

class AllCharactersScreen extends StatelessWidget {
  static const name = 'home-screen';

  const AllCharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomNavigationBar(),
      body: _AllCharactersScreen(),
    );
  }
}

class _AllCharactersScreen extends ConsumerStatefulWidget {
  const _AllCharactersScreen();

  @override
  _AllCharactersViewState createState() => _AllCharactersViewState();
}

class _AllCharactersViewState extends ConsumerState<_AllCharactersScreen> {
  @override
  void initState() {
    ref.read(allCharactersProvider.notifier).loadNextPage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final allCharacters = ref.watch(allCharactersProvider);

    return Stack(
      children:[
        Image.asset(Constants.backgroundImage,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        GlassFormism.background(),
        Column(
          children: [
            CustomGridView(
              characters: allCharacters,
              loadNextPage: ()=> ref.read(allCharactersProvider.notifier).loadNextPage(),
            ),
          ],
        ),
            const CustomAppbar(),
      ] 
    );
  }
}
