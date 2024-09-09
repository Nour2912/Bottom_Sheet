//main

import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart'; // Import the LoginScreen

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var image = Image.asset('assets/Illustration.png');
    return Scaffold(
      backgroundColor: const Color(0xFF0E1030), // Dark background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the image
              SizedBox(
                height: 330,
                width:  400,
                child: Center(
                  child: image,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 148, 146, 146), 
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Show bottom sheet with Registration screen
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15),
                    ),
                    builder: (BuildContext context) {
                      return const RegisterScreen(); 
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFECB57),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  // Show bottom sheet with Login screen
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    builder: (BuildContext context) {
                      return const LoginScreen(); 
                    },
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFECB57), width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 120),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xFFFECB57), 
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'All Right Reserved ©2024',
                style: TextStyle(
                  color: Colors.grey[500], 
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
