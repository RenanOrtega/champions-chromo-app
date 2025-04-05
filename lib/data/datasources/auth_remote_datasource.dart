import 'package:champions_chromo_app/infrastructure/clients/dio_http_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<String?> signInWithGoogle();
  Future<String> loginToBackend(String firebaseToken);
  Future<void> signOut();
}

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dioHttpClient = ref.watch(dioHttpClientProvider);
  return AuthRemoteDataSourceImpl(
    FirebaseAuth.instance,
    GoogleSignIn(),
    dioHttpClient,
  );
});

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final Dio _dioHttpClient;

  AuthRemoteDataSourceImpl(
      this._firebaseAuth, this._googleSignIn, this._dioHttpClient);

  @override
  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
      return await _firebaseAuth.currentUser?.getIdToken();
    } catch (e) {
      throw Exception('Falha ao fazer login com Google: ${e.toString()}');
    }
  }

  @override
  Future<String> loginToBackend(String firebaseToken) async {
    try {
      final response = await _dioHttpClient.post(
        '/user/login',
        data: {'firebaseId': firebaseToken},
      );
      return response.data['token'];
    } on DioException catch (e) {
      throw Exception('Error in backend request: ${e.message}');
    } catch (e) {
      throw Exception('Failed to log in to backend: ${e.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}
