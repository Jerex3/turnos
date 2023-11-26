import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tnpd/data/source/local_storage.dart';

class AuthRepository {
  
  Future<UserCredential?> signInGoogle() async {

    GoogleSignInAccount? googleUser = await GoogleSignIn(
      clientId: kIsWeb ? "336678963982-6jcv4q55kckarab2ke8otrsos1kih8j0.apps.googleusercontent.com" : null,
    ).signIn();
    
    if(googleUser == null) return null;

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    
    UserCredential user = await FirebaseAuth.instance.signInWithCredential(credential);

    if(user.additionalUserInfo!.isNewUser){
      await _createUserDocument(user.user!);
    }

    LocalStorage.save(LocalStorage.USER_CRED_KEY, user.toString());
    LocalStorage.save(LocalStorage.TOKEN_KEY, user.toString());

    return user;

  }

  Future _createUserDocument(User user) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final userDocRef = firestore
        .collection('users').doc(user.uid);

     await userDocRef.set({
      "name":user.displayName,
      "picture":user.photoURL,
      "email":user.email,
      "phoneNumber":user.phoneNumber
     });
  }



  Future<AuthCredential?> checkAuthStatus() async {
    String? token = await LocalStorage.read(LocalStorage.TOKEN_KEY);
    
    if(token == null) return null;

    String? userCreds =  await LocalStorage.read(LocalStorage.USER_CRED_KEY);
    
  }
}