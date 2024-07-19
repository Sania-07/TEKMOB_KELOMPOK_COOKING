// ignore_for_file: unused_local_variable, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:flutter_application_2/homescreen.dart'; // Import Home widget
import 'package:flutter_application_2/login_screen.dart'; // Import LoginScreen

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  // Method to handle registration with email and password
  Future<void> _registerWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Add additional user information to Firestore or other databases if needed
      // Example: Firestore.instance.collection('users').doc(userCredential.user.uid).set({
      //   'name': name,
      //   'email': email,
      // });

      // Navigate to home screen after successful registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } catch (e) {
      // Handle registration errors here, such as displaying an error message
      print('Error registering user: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to register. Please check your details and try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // String name = '';
    String email = '';
    String password = '';
    String confirmPassword = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: const Color(0xFFE17965), // Background color
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                      child: Text(
                        'Enjoy',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
                      child: Text(
                        'Cooking',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Delicious and detailed restaurant recipes\non your PHONE',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              constraints: BoxConstraints(
                                maxHeight: 200, // Limit the height of the image
                              ),
                              child: Image.asset(
                                'assets/cooking-removebg-preview.png',
                                width: 200,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20), // Spacing adjustment from the text above
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            obscureText: true,
                            onChanged: (value) {
                              confirmPassword = value;
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Check if passwords match
                              if (password == confirmPassword) {
                                _registerWithEmailAndPassword(email, password, context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Passwords do not match.'),
                                  ),
                                );
                              }
                            },
                            child: const Text('Register'),
                          ),
                          const SizedBox(height: 20), // Spacing between the register button and login text
                          GestureDetector(
                            onTap: () {
                              // Navigate back to the login page
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginScreen()),
                              );
                            },
                            child: Text(
                              'Sudah punya akun? Login di sini',
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
