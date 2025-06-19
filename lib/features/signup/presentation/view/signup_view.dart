import 'package:abs_onlinestore/features/login/presentation/view/login_view.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String fullName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String? error;

  void _signup() {
    if (password != confirmPassword) {
      setState(() {
        error = 'Passwords do not match';
      });
      return;
    }
    if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
      setState(() {
        error = 'Please fill all fields';
      });
      return;
    }

    // Success
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Account created successfully!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignInView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9CB7C2), // Light bluish background
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),

                // Full Name
                TextField(
                  onChanged: (value) => fullName = value,
                  decoration: _buildInputDecoration('Full Name', Icons.person),
                ),
                const SizedBox(height: 16),

                // Email
                TextField(
                  onChanged: (value) => email = value,
                  decoration: _buildInputDecoration(
                    'Phone or Gmail',
                    Icons.email,
                  ),
                ),
                const SizedBox(height: 16),

                // Password
                TextField(
                  onChanged: (value) => password = value,
                  obscureText: true,
                  decoration: _buildInputDecoration('Password', Icons.lock),
                ),
                const SizedBox(height: 16),

                // Confirm Password
                TextField(
                  onChanged: (value) => confirmPassword = value,
                  obscureText: true,
                  decoration: _buildInputDecoration(
                    'Confirm Password',
                    Icons.lock,
                  ),
                ),

                if (error != null) ...[
                  const SizedBox(height: 12),
                  Text(error!, style: const TextStyle(color: Colors.red)),
                ],

                const SizedBox(height: 24),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _signup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE53935),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Center(
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignInView()),
                    ),
                    child: const Text(
                      "Already have an account? Sign In",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
}
