// lib/feature/auth/cubit/signup_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  SignUpCubit() : super(SignUpInitial());

  Future<void> signUpWithEmail(String email, String password) async {
    emit(SignUpLoading());
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        emit(SignUpSuccess());
      }
    } catch (e) {
      emit(SignUpFailure('Failed to sign up. Error: $e'));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(SignUpLoading());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) throw 'Google sign-in cancelled';

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure('Google sign-in failed'));
    }
  }
}
