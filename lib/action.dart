import 'package:firebase_auth/firebase_auth.dart';

class SignInWithGoogleAction {

}

class SignOutAction {}

class SetUserAction {
  final User? user;

  SetUserAction(this.user);
}
