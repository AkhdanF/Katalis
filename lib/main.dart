import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:katalis2/widgets/firebase_options.dart';
import 'package:katalis2/screens/login_screen.dart';
import 'package:katalis2/widgets/transaction_model.dart';
import 'package:provider/provider.dart';
import 'package:katalis2/screens/landing_screen.dart';
import 'package:katalis2/screens/fitur_screens/course_detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KatalisApp',
      theme: ThemeData(
        fontFamily: 'InstrumentSans',
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFEEEEEE),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/login': (context) => const LoginScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/course-detail':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => CourseDetailScreen(
                title: args['title'] as String,
                image: args['image'] as String,
                sections: args['sections'] as int,
                videos: args['videos'] as int,
                description: args['description'] as String,
              ),
            );
          default:
            return null;
        }
      },
      // Fallback route handler
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(
              child: Text('Page not found'),
            ),
          ),
        );
      },
    );
  }
}
