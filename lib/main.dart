import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'auth/authpage.dart';
import 'home/homepage.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> main() async {
  // make sure everything is initialized
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO:
    // if (authenticated)
    return MaterialApp(
      title: 'Ridikulous',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
    // else
    // return HomePage();
  }
}
