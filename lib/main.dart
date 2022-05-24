import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_final/screens/screens.dart';
import 'package:covid_final/services/chat/chat_provider.dart';
import 'package:covid_final/services/chat/messages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<MessagesProvider>(
              create: (_) =>
                  MessagesProvider(firebaseFirestore: firebaseFirestore)),
          Provider<ChatProvider>(
              create: (_) => ChatProvider(firebaseFirestore: firebaseFirestore))
        ],
        child: MaterialApp(
          title: 'COVID SAFE',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AuthGate(),
        ));
  }
}
