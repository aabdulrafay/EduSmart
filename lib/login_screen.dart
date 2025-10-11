import 'package:flutter/material.dart';
import './admin_dashboard_screen.dart';
import './teacher_dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 1. Controllers to read text from input fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // 2. The login logic function
  void _handleLogin() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == 'admin' && password == 'admin') {
      // On success, navigate to the Admin Dashboard
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AdminDashboardScreen()),
      );
    }
    else if (email == 'teacher' && password == 'teacher') {
      // On success, navigate to the Teacher Dashboard
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TeacherDashboardScreen()),
      );
    } else {
      // On failure, show an error message
      final snackBar = SnackBar(
        content: const Text('Invalid email or password.'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0A73B7);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset('images/logo.png', height: 150.0),
                const SizedBox(height: 16.0),
                const Text(
                  'Welcome to EduSmart',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Sign in to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                const SizedBox(height: 48.0),

                // 3. Connect the controller
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined, color: primaryColor),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
                const SizedBox(height: 16.0),

                // 3. Connect the controller
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline, color: primaryColor),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
                const SizedBox(height: 24.0),

                // 4. Connect the button to the login function
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                  onPressed: _handleLogin,
                  child: const Text('Login', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                const SizedBox(height: 12.0),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: () {},
                      child: const Text('Forgot Password?', style: TextStyle(color: primaryColor))),
                ),
                const SizedBox(height: 24.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?", style: TextStyle(color: Colors.grey)),
                    TextButton(onPressed: () {}, child: const Text('Sign Up', style: TextStyle(color: primaryColor))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}