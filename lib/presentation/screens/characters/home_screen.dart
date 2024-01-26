import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty/presentation/providers/characters/character_provider.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(allCharactersProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final allCharacters = ref.watch(allCharactersProvider);
    return ListView.builder(
      itemCount: allCharacters.length,
      itemBuilder: (context,index){
        final character = allCharacters[index];

        return ListTile(
          title: Text(character.name),
        );
      }
    );
  }
}