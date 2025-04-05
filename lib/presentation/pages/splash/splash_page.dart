import 'package:champions_chromo_app/domain/repositories/auth_repository.dart';
import 'package:champions_chromo_app/constants/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final authRepository = ref.read(authRepositoryProvider);

    await authRepository.checkAuthStatus();

    if (!mounted) return;

    final isLoggedIn = authRepository.isLoggedIn;
    context.go(isLoggedIn ? RouteConstants.schools : RouteConstants.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Champions Chromo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            )
          ],
        ),
      ),
    );
  }
}
