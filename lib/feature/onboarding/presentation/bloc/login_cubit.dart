// lib/feature/auth/cubit/login_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  LoginCubit() : super(LoginInitial());

  Future<void> signInWithEmail(String email, String password) async {
    emit(LoginLoading());
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        emit(LoginSuccess());
      }
    } catch (e) {
      emit(LoginFailure('Invalid email or password'));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) throw 'Google sign-in cancelled';

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure('Google sign-in failed: ${e.message}'));
    } catch (e) {
      emit(LoginFailure('An unexpected error occurred: $e'));
    }
  }


  Future<void> forgotPassword(String email) async {
    emit(LoginLoading());
    try {
      await _auth.sendPasswordResetEmail(email: email);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure('Failed to send password reset email'));
    }
  }
}
