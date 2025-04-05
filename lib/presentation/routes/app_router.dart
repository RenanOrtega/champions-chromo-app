import 'package:champions_chromo_app/domain/repositories/auth_repository.dart';
import 'package:champions_chromo_app/presentation/pages/albums/album_list_page.dart';
import 'package:champions_chromo_app/presentation/pages/cart/cart_page.dart';
import 'package:champions_chromo_app/presentation/pages/login/login_page.dart';
import 'package:champions_chromo_app/presentation/pages/schools/school_list_page.dart';
import 'package:champions_chromo_app/presentation/pages/splash/splash_page.dart';
import 'package:champions_chromo_app/presentation/pages/stickers/sticker_collection_page.dart';
import 'package:champions_chromo_app/constants/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: RouteConstants.splash,
    redirect: (context, state) {
      final isLoggedIn = authRepository.isLoggedIn;
      final isSplash = state.uri.path == RouteConstants.splash;
      final isLogin = state.uri.path == RouteConstants.login;

      if (isSplash) return null;

      if (!isLoggedIn && !isLogin) return RouteConstants.login;

      if (isLoggedIn && isLogin) return RouteConstants.schools;

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => SchoolListPage(),
      ),
      GoRoute(
        path: '/albums',
        builder: (context, state) => AlbumListPage(schoolId: state.uri.queryParameters['schoolId']!),
      ),
      GoRoute(
        path: '/stickers',
        builder: (context, state) => StickerCollectionPage(
            albumId: state.uri.queryParameters['albumId']!,
            schoolId: state.uri.queryParameters['schoolId']!,
            // schoolName: state.uri.queryParameters['schoolName']!,
            ),
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
