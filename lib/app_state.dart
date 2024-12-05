import 'package:firebase_auth/firebase_auth.dart';

class AppState {
  final bool isLoading;
  final bool isAuthenticated;
  final User? user; // Firebase User object

  AppState({
    required this.isLoading,
    required this.isAuthenticated,
    required this.user,
  });


  AppState copyWith({
      bool? isLoading,
   bool? isAuthenticated,
   User? user,
  })=>AppState(
    isLoading: isLoading ?? this.isLoading,
    isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    user: user ?? this.user
    );

  static Future<AppState> initialState() async{
    return AppState(
      isLoading: false,
      isAuthenticated: false,
      user: null,
    );
  }
}
