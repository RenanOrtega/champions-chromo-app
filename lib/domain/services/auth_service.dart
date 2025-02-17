import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class AuthFailure implements Exception {
  final String message;
  final String? code;

  AuthFailure(this.message, {this.code});
}

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthService({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  User? get currentUser => _firebaseAuth.currentUser;
  bool get isAuthenticated => currentUser != null;

  Future<void> signOut() async {
    await Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  // Google sign in
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw AuthFailure('Operação cancelada pelo usuário.');
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(
        _getFirebaseAuthErrorMessage(e.code),
        code: e.code.toString(),
      );
    } catch (e) {
      throw AuthFailure('Erro ao realizar login com Google: ${e.toString()}');
    }
  }

  String _getFirebaseAuthErrorMessage(String code) {
    switch (code) {
      case 'invalid-verification-code':
        return 'O código de verificação é inválido.';
      case 'too-many-requests':
        return 'Muitas tentativas. Tente novamente mais tarde.';
      default:
        return 'Ocorreu um erro na autenticação.';
    }
  }
}
