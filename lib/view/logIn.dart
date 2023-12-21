import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEFE9),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/login.png'),
                width: double.infinity,
              ),
              Text(
                "Login your Journey",
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF95796A),
                ),
              ),
              Text(
                "Document your life, reflect on your journey.",
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5B240B),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 48.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 48.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                  width: double.infinity,
                  height: 48.0,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFE8B2A6),
                        ),
                      ),
                      child: Text('Login')))
            ],
          ),
        ),
      ),
    );
  }
}
