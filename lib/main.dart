
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/auth.dart';
import 'screen/login_signup/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screen/home_screen/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.lightBlue[800],
          scaffoldBackgroundColor: Colors.white,
        ),
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();

    if(user != null){
      return Home();
    }
    return Welcome_screen();
  }
}
