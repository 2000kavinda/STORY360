import 'package:flutter/material.dart';
import 'package:story360/controller/logInCon.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEFE9),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Stack(
                children: [
                  Image(
                    image: AssetImage('assets/login.png'),
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 20.0,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Login your Journey",
                      style: TextStyle(
                        fontFamily: 'Nunito Sans',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF95796A),
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                "Document your life, reflect on your journey.",
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5B240B),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 48.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 48.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Container(
                  width: double.infinity,
                  height: 48.0,
                  child: ElevatedButton(
                      onPressed: () {
                        login(emailController.text, passwordController.text,
                            context);
                        emailController.clear();
                        passwordController.clear();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFE8B2A6),
                        ),
                      ),
                      child: const Text('Login')))
            ],
          ),
        ),
      ),
    );
  }
}
