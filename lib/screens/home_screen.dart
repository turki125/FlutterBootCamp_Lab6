import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.blur_on_rounded,
                        color: Color(0xFFBAA4FF),
                        size: 36,
                      ),
                      Spacer(),
                      Chip(
                        label: Text('HOME'),
                        avatar: Icon(Icons.home_outlined, size: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    "You're in.",
                    style: TextStyle(
                      fontSize: 48,
                      letterSpacing: -2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Welcome to your own little corner.',
                    style: TextStyle(fontSize: 16, color: Color(0xFFA8A4B4)),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: const Color(0xFF211D2C),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFF383043)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.touch_app_outlined,
                              color: Color(0xFFBAA4FF),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Make it count',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '$number',
                          style: const TextStyle(
                            fontSize: 80,
                            height: 1.1,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFD5C6FF),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Small steps add up. Give it a tap.',
                          style: TextStyle(color: Color(0xFFA8A4B4)),
                        ),
                        const SizedBox(height: 28),
                        ElevatedButton(
                          onPressed: () => setState(() => number++),
                          child: const Text('Add one'),
                        ),
                        TextButton(
                          onPressed: number == 0
                              ? null
                              : () => setState(() => number = 0),
                          child: const Text('Reset counter'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
