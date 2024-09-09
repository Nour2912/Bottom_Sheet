import 'package:flutter/material.dart';
import 'login.dart';  // Import the LoginScreen

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController(); // New confirm password controller
  final TextEditingController _courseController = TextEditingController(); // New course controller

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  // Validation for confirm password field
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Validation for course input field
  String? _validateCourse(String? value) {
    if (value == null || value.isEmpty) {
      return 'Course is required';
    }
    if (value.length > 30) {
      return 'Course name cannot exceed 30 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(250, 236, 170, 1), // Set background color of the entire screen
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Create Your Account",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Username/Email',
                  border: OutlineInputBorder(),
                  fillColor: Color.fromRGBO(250, 236, 170, 1), // Set background color
                  filled: true,
                  suffixIcon: Icon(Icons.email),
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  fillColor: Color.fromRGBO(250, 236, 170, 1), // Set background color
                  filled: true,
                  suffixIcon: Icon(Icons.lock),
                ),
                validator: _validatePassword,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  fillColor: Color.fromRGBO(250, 236, 170, 1), // Set background color
                  filled: true,
                  suffixIcon: Icon(Icons.lock),
                ),
                validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 10),
              // New Course Input Field
              TextFormField(
                controller: _courseController,
                decoration: const InputDecoration(
                  labelText: 'Course',
                  border: OutlineInputBorder(),
                  fillColor: Color.fromRGBO(250, 236, 170, 1), // Set background color
                  filled: true,
                  suffixIcon: Icon(Icons.school),
                ),
                validator: _validateCourse,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Show success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registration successful!')),
                    );
                    
                    // Simulate delay for the message to be seen before closing
                    Future.delayed(const Duration(seconds: 2), () {
                      // You can perform any registration logic here before closing
                      Navigator.pop(context); // Close the bottom sheet after success
                    });
                  } else {
                    // If validation fails, show error immediately
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please correct errors before submitting')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 5, 5, 34),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Color.fromARGB(255, 193, 123, 18),
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // "Already have an account? Login" button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return const LoginScreen(); // Navigate to LoginScreen
                        },
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromRGBO(181, 117, 89, 1),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}


