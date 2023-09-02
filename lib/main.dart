import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'xcore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Student App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        primaryColor: kPrimaryColor,
        textTheme: GoogleFonts.sourceSansProTextTheme(
          Theme.of(context).textTheme.apply().copyWith(
                bodyLarge: const TextStyle(
                  color: kTextWhiteColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                bodyMedium: const TextStyle(
                  color: kTextWhiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
        ),
      ),
      initialRoute: PageRouter.splashScreen,
      getPages: PageRouter.pages,
    );
  }
}
