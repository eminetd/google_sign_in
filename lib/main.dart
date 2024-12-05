import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googlesign_async_redux/action.dart';
import 'package:googlesign_async_redux/homepage.dart';
import 'package:async_redux/async_redux.dart';

import 'app_state.dart';
late Store<AppState> store;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final AppState state = await AppState.initialState();
  store = Store<AppState>(initialState: state);
  runApp(
    StoreProvider<AppState>(
      store: store,
      child:  MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async Redux Google Sign-In',
      home: HomePage(
        isLoading: false,
        isAuthenticated: false,
        user: null,
        onSignInWithGoogle: ,
        onSignOut: ,
      ),
    );
  }
}



class MyHomePageConnector extends StatelessWidget {
  const MyHomePageConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageVM>(
      model: HomePageVM(),
      builder: (BuildContext context, HomePageVM vm) => HomePage(
        isLoading: vm.isLoading,
       isAuthenticated: vm.isAuthenticated,
       user: vm.user,
       onSignInWithGoogle: vm.onSignInWithGoogle,
       onSignOut: vm.onSignOut,
      ),
    );
  }
}

class HomePageVM extends BaseModel<AppState> {
  HomePageVM();
   final bool isLoading;
  final bool isAuthenticated;
  final User? user;
  final Function() onSignInWithGoogle;
  final Function() onSignOut;

  HomePageVM.build({
     required this.isLoading,
   required this.isAuthenticated,
   required this.user,
   required this.onSignInWithGoogle,
   required this.onSignOut,
    
  }) : super(equals: [
    isLoading,isAuthenticated,user,onSignInWithGoogle,onSignOut,
    // textColor,
    ]);

  @override
  HomePageVM fromStore() => HomePageVM.build(
     
isLoading: store.state.isLoading,
      isAuthenticated: store.state.isAuthenticated,
      user: store.state.user,
      onSignInWithGoogle: () => store.dispatch(SignInWithGoogleAction()),
      onSignOut: () => store.dispatch(SignOutAction()),
  );
}



// class _ViewModel {
//   final bool isLoading;
//   final bool isAuthenticated;
//   final User? user;
//   final Function() onSignInWithGoogle;
//   final Function() onSignOut;

//   _ViewModel({
//     required this.isLoading,
//     required this.isAuthenticated,
//     required this.user,
//     required this.onSignInWithGoogle,
//     required this.onSignOut,
//   });

//   //  _ViewModel.fromStore(Store<AppState> store) {
//   //   return _ViewModel(
//   //     isLoading: store.state.isLoading,
//   //     isAuthenticated: store.state.isAuthenticated,
//   //     user: store.state.user,
//   //     onSignInWithGoogle: () => store.dispatch(SignInWithGoogleAction()),
//   //     onSignOut: () => store.dispatch(SignOutAction()),
//   //   );
//   // }
}
