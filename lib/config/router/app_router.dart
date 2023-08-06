import 'package:cinemapedia/presentation/screens/screens.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()
    )
  ]
);
