import 'package:flutter/material.dart';
import 'splash_screen.dart'; // make sure you have your SplashScreen.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0A73B7); // custom blue

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduSmart',
      theme: ThemeData(
        brightness: Brightness.light,

        // 🔹 Primary color scheme
        primaryColor: primaryBlue,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),

        // 🔹 AppBar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryBlue,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: primaryBlue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        // 🔹 Icon color across app
        iconTheme: const IconThemeData(color: primaryBlue),

        // 🔹 TextField / Input Field theme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIconColor: primaryBlue,

          // 🔵 Floating label (placeholder when focused)
          floatingLabelStyle: const TextStyle(
            color: primaryBlue,
            fontWeight: FontWeight.bold,
          ),

          // 🔹 Cursor and underline colors handled by theme below
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: primaryBlue, width: 2.0),
          ),
        ),

        // 🔹 Blue cursor globally
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: primaryBlue,
          selectionColor: Color(0x332196F3), // light blue highlight
          selectionHandleColor: primaryBlue,
        ),

        // 🔹 Button styling
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryBlue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
        ),

        // 🔹 Bottom navigation bar theme
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primaryBlue,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          selectedIconTheme: IconThemeData(size: 30),
          unselectedIconTheme: IconThemeData(size: 24),
          type: BottomNavigationBarType.fixed,
          elevation: 8.0,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
