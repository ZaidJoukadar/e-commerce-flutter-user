import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  // App logo/icon
                  Image.asset(
                    'assets/icons/logo.png',
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 20),
                  // App name
                  Text(
                    'Ecoo',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This is a sample Flutter application demonstrating how to create an about page with common elements like version info, links, and acknowledgments.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  // Developer info
                  const Text(
                    'Developed with by Eng:zaidjoukhadar',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'joukha Dar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  // Copyright
                  Text(
                    '© ${DateTime.now().year} Your Company. All rights reserved.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ]),
          )),
    );
  }
}
