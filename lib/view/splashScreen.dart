import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story360/view/logIn.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LogIn()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEFE9),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60.0,
              ),
              const Image(
                image: AssetImage('assets/logo.png'),
                height: 267.0,
                width: double.infinity,
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "🙂The Journey",
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF95796A),
                ),
              ),
              const SizedBox(
                height: 15.0,
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
                height: 40,
              ),
              Center(
                child: Platform.isIOS
                    ? const CupertinoActivityIndicator(
                        radius: 20,
                      )
                    : const CircularProgressIndicator(
                        color: Colors.black,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
