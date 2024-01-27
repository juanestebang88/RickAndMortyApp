import 'package:go_router/go_router.dart';
import 'package:rick_morty/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name:  AllCharactersScreen.name,
      builder: (context, state) => const AllCharactersScreen(),
    ),
  ]
);