import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reviewtherapist/app/controller/auth/auth_provider.dart';
import 'package:reviewtherapist/app/utils/constants.dart';
import 'package:reviewtherapist/app/view/auth/firebase_auth_methods.dart';
import 'package:reviewtherapist/app/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => ProfileProvider()),
        // ChangeNotifierProvider(create: (_) => LoginProvider()),
        // ChangeNotifierProvider(create: (_) => RegsiterProvider()),
        ChangeNotifierProvider(
            create: (_) => AuthProvider(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) => context.watch<AuthProvider>().stream(),
            initialData: null),
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Review Therapist',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: backgroundColorDark,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
          ),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User?>();

//     if (firebaseUser != null) {
//       return const NavbarScreen();
//     }
//     return const SplashScreen();
//   }
// }
