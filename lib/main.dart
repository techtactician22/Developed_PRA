
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rapp/pages/drawer.dart';
import 'package:rapp/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rapp/pages/text_problem.dart';
import 'package:rapp/pages/user_auth.dart';

import 'package:rapp/pages/user_profile.dart';
import 'firebase_options.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Data Fetch',
      home: SplashWidget(),
    );
  }
}

