// ignore: depend_on_referenced_packages
import 'package:cinemapedia/presentation/providers/movies_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.read(moviesSlideshowProvider).isEmpty;
  final step3 = ref.watch(popularMoviesProvider).isEmpty;
  final step4 = ref.watch(upCommingMoviesProvider).isEmpty;
  final step5 = ref.watch(topRatedMoviesProvider).isEmpty;

  if (step1 || step2 || step3 || step4 || step5) return true;

  return false; // Terminamos de cargar
});
