import 'package:champions_chromo_app/presentation/pages/albums/school_album_list_page.dart';
import 'package:champions_chromo_app/presentation/pages/cart/cart_page.dart';
import 'package:champions_chromo_app/presentation/pages/login/login_page.dart';
import 'package:champions_chromo_app/presentation/pages/schools/school_list_page.dart';
import 'package:champions_chromo_app/presentation/pages/splash/splash_page.dart';
import 'package:champions_chromo_app/presentation/pages/stickers/album_sticker_list_page.dart';
import 'package:champions_chromo_app/presentation/providers/auth_provider.dart';
import 'package:champions_chromo_app/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = RouterNotifier(ref);

  return GoRouter(
    refreshListenable: notifier,
    redirect: (context, state) {
      final authState = ref.read(authStateProvider);

      if (authState.isLoading) return AppRoutes.splash;

      final isAuth = authState.valueOrNull != null;
      final isGoingToLogin = state.uri.toString() == AppRoutes.login;
      final isGoingToSplash = state.uri.toString() == AppRoutes.splash;

      if (!isAuth && !isGoingToLogin && !isGoingToSplash) {
        return AppRoutes.login;
      }

      if (isAuth && (isGoingToLogin || isGoingToSplash)) {
        return AppRoutes.schools;
      }

      return null;
    },
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: '/schools',
        builder: (context, state) => SchoolListPage(),
      ),
      GoRoute(
        path: '/albums',
        builder: (context, state) => SchoolAlbumListPage(
            schoolName: state.uri.queryParameters['schoolName']!,
            schoolId: state.uri.queryParameters['schoolId']!),
      ),
      GoRoute(
        path: '/stickers',
        builder: (context, state) => AlbumStickerListPage(
            albumName: state.uri.queryParameters['albumName']!,
            albumId: state.uri.queryParameters['albumId']!),
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => CartPage(),
      )
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(authStateProvider, (previous, next) {
      notifyListeners();
    });
  }
}
