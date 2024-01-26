import 'package:go_router/go_router.dart';
import 'package:rick_morty/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name:  HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ]
);