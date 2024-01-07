import 'package:app/components/Widgets/button.dart';
import 'package:app/components/Widgets/login_inputs.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(68, 30, 174, 1),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'lib/assets/imagenPerfil.png',
              height: 200,
            ),

            const SizedBox(height: 5),

            // Welcom text
            const Text(
              "Welcome to Robotize's Control Room",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            const SizedBox(height: 25),

            // Username input
            InputLogin(
              controller: usernameController,
              hintText: 'Username',
              osbscureText: false,
            ),

            const SizedBox(height: 30),

            // Password input
            InputLogin(
              controller: passwordController,
              hintText: 'Password',
              osbscureText: true,
            ),

            const SizedBox(height: 15),

            // Forgot password
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            ButtonLogin(
                onTap: () {
                  if (passwordController.text == 'laColina123' &&
                      usernameController.text == 'robotize') {
                    Navigator.pushNamed(context, '/home');
                  } else {
                    showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            title: Text('Autenticacion'),
                            content: Text('Error en la autenticacion'),
                          );
                        });
                  }
                },
                child: const Text('Login')),
          ],
        ),
      )),
    );
  }
}
