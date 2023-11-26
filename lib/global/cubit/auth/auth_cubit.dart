import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tnpd/core/config/service_locator.dart';
import 'package:tnpd/data/repositories/auth_repository.dart';
import 'package:tnpd/presentation/feed/cubit/feed/feed_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with ChangeNotifier {

  final authRepository = AuthRepository();
  AuthCubit() : super(const AuthInitial());


  void checkAuthStatus() {
    final user = FirebaseAuth.instance.currentUser;

    if(user == null){
      emit(const AuthNotLogged());
    }

    emit(AuthLogged(userCredential: user ));
    notifyListeners();
  }

  Future signInGoogle() async {
    UserCredential? userCred = await authRepository.signInGoogle();
  
    if(userCred == null) return;

    emit(AuthLogged(userCredential: userCred.user));

    notifyListeners();
  }

  void signOutGoogle() async {
    
      await GoogleSignIn(
        clientId: kIsWeb ? "336678963982-6jcv4q55kckarab2ke8otrsos1kih8j0.apps.googleusercontent.com" : null
      ).signOut();
      await FirebaseAuth.instance.signOut();
      sl.resetLazySingleton(
        instance: sl<FeedCubit>()
      );
      emit(const AuthNotLogged());
      notifyListeners();
  }
}
