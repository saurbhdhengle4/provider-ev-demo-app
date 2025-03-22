import 'package:evdemoapp/views/login_screen_view.dart';
import 'package:evdemoapp/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider with ChangeNotifier {
  bool _isSignedIn = false;
  String _userName = '';
  String _userEmail = '';
  String _userPhoto = '';

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool get isSignedIn => _isSignedIn;
  String get userName => _userName;
  String get userEmail => _userEmail;
  String get userPhoto => _userPhoto;

  // Google Sign-In method
  Future<void> signIn(BuildContext context) async {
    try {
      await _googleSignIn.signOut();
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        _isSignedIn = true;
        _userName = googleUser.displayName ?? 'No name';
        _userEmail = googleUser.email;
        _userPhoto = googleUser.photoUrl ?? '';
        notifyListeners();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }
    } catch (error) {
      _isSignedIn = false;
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _googleSignIn.signOut();
    _isSignedIn = false;
    _userName = '';
    _userEmail = '';
    _userPhoto = '';

    notifyListeners();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
