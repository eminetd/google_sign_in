import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final bool isLoading;
  final bool isAuthenticated;
  final User? user;
  final Function() onSignInWithGoogle;
  final Function() onSignOut;

  HomePage({
    required this.isLoading,
    required this.isAuthenticated,
    required this.user,
    required this.onSignInWithGoogle,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async Redux Google Sign-In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isAuthenticated ? 'Welcome, ${user?.displayName}!' : 'Not authenticated',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: isAuthenticated ? onSignOut : onSignInWithGoogle,
              child: Text(isAuthenticated ? 'Sign Out' : 'Sign In with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
