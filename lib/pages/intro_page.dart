import 'package:flutter/material.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // optional but good practice
        child: SingleChildScrollView(
          child: Column(
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.only(
                    left: 80.0, right: 80, bottom: 80, top: 120),
                child: Image.asset('lib/images/avocado.png'),
              ),

              // we deliver groceries at your doorstep
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'We deliver groceries at your doorstep',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),

              // fresh item everyday
              Text("Fresh item everyday"),

              const SizedBox(height: 50),

              // get started button
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 40), // bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
