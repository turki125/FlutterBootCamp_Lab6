import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../service/database.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

//

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, this.signUp = false});
  final bool signUp;
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool busy = false;
  bool hidden = true;

  void message(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> submit() async {
    if (busy) return;
    if (email.text.trim().isEmpty || password.text.isEmpty) {
      message('Enter your email and password.');
      return;
    }
    setState(() => busy = true);
    try {
      if (widget.signUp) {
        await Database().signupUser(
          email: email.text.trim(),
          password: password.text,
        );
        if (!mounted) return;
        message(
          'Registration submitted. Check your email for confirmation, then log in.',
        );
      } else {
        await Database().loginUser(
          email: email.text.trim(),
          password: password.text,
        );
        if (!mounted) return;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
          (_) => false,
        );
      }
    } on AuthException catch (error) {
      if (mounted) message(error.message);
    } catch (_) {
      if (mounted) message('Unable to connect. Please try again.');
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF242035), Color(0xFF111114), Color(0xFF17151F)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: AutofillGroup(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.blur_on_rounded,
                          color: Color(0xFFBAA4FF),
                          size: 48,
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text(
                        widget.signUp
                            ? 'A little more\npossibility.'
                            : 'Good to have\nyou back.',
                        style: const TextStyle(
                          fontSize: 44,
                          height: 1.08,
                          letterSpacing: -2,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFF5F2FA),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.signUp
                            ? 'Create your account. Make yourself at home.'
                            : 'Your space is ready. Log in to get started.',
                        style: const TextStyle(
                          color: Color(0xFFA8A4B4),
                          height: 1.6,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 36),
                      TextField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [AutofillHints.email],
                        decoration: const InputDecoration(
                          labelText: 'Email address',
                          prefixIcon: Icon(Icons.alternate_email_rounded),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: password,
                        obscureText: hidden,
                        autocorrect: false,
                        enableSuggestions: false,
                        autofillHints: [
                          widget.signUp
                              ? AutofillHints.newPassword
                              : AutofillHints.password,
                        ],
                        onSubmitted: (_) => submit(),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          suffixIcon: IconButton(
                            tooltip: hidden ? 'Show password' : 'Hide password',
                            onPressed: () => setState(() => hidden = !hidden),
                            icon: Icon(
                              hidden
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: busy ? null : submit,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (busy) ...[
                              const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                              const SizedBox(width: 12),
                            ],
                            Text(
                              busy
                                  ? 'Please wait...'
                                  : widget.signUp
                                  ? 'Create account'
                                  : 'Log in',
                            ),
                            if (!busy) ...[
                              const SizedBox(width: 12),
                              const Icon(Icons.arrow_forward_rounded, size: 18),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            widget.signUp
                                ? 'Already have an account?'
                                : 'First time here?',
                            style: const TextStyle(color: Color(0xFFA8A4B4)),
                          ),
                          TextButton(
                            onPressed: busy
                                ? null
                                : () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => widget.signUp
                                          ? const LoginScreen()
                                          : const SignupScreen(),
                                    ),
                                  ),
                            child: Text(
                              widget.signUp ? 'Log in' : 'Create an account',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
