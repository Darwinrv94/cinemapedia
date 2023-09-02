import 'package:cinemapedia/presentation/screens/screens.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final String pageIndex = state.pathParameters['page'] ?? '0';
        return HomeScreen(pageIndex: int.parse(pageIndex));
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final String movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          }
        )
      ]
    ),

    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0'
    )
  ]
);
