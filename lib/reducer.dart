// import 'package:firebase_auth/firebase_auth.dart';
import 'package:googlesign_async_redux/action.dart';
import 'package:googlesign_async_redux/app_state.dart';

AppState signInWithGoogleReducer(AppState state, SignInWithGoogleAction action) {
  // Set isLoading to true to indicate the authentication process is in progress
  return state.copyWith(isLoading: true);
}

AppState signOutReducer(AppState state, SignOutAction action) {
  // Set isLoading to true to indicate the sign-out process is in progress
  return state.copyWith(isLoading: true);
}

AppState setUserReducer(AppState state, SetUserAction action) {
  // Update user information and set isLoading to false
  return state.copyWith(
    isLoading: false,
    isAuthenticated: action.user != null,
    user: action.user,
  );
}
