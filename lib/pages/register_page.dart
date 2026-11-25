import 'package:flutter/material.dart';
import '../services/api_exception.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameC = TextEditingController();
  final _emailC = TextEditingController();
  final _passC = TextEditingController();
  final _auth = AuthService();

  bool _loading = false;
  bool _obscurePass = true;
  bool _isEmailValid = false;

  static const Color _primaryPurple = Color(0xFF5B3DF5);
  static const Color _borderColor = Color(0xFFE2E4EC);
  static const Color _successGreen = Color(0xFF2E9E44);

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _checkEmailValidity(String value) {
    final trimmed = value.trim();
    final valid = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(trimmed);
    if (valid != _isEmailValid) {
      setState(() => _isEmailValid = valid);
    }
  }

  Future<void> _register() async {
    final name = _nameC.text.trim();
    final email = _emailC.text.trim();
    final password = _passC.text;

    if (name.isEmpty || email.isEmpty || password.length < 8) {
      _showMessage('Lengkapi data, password minimal 8 karakter');
      return;
    }

    setState(() => _loading = true);
    try {
      await _auth.register(
        name: name,
        email: email,
        password: password,
      );
      if (!mounted) return;
      _showMessage('Register berhasil, silakan login');
      Navigator.pop(context); // kembali ke halaman login
    } on ApiException catch (e) {
      if (mounted) _showMessage(e.message);
    } catch (_) {
      if (mounted) _showMessage('Terjadi kesalahan tak terduga');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _nameC.dispose();
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }

  InputDecoration _buildFieldDecoration({
    required String hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 13.5,
        color: Color(0xFF9EA3B0),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: _borderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: _primaryPurple, width: 1.4),
      ),
    );
  }

  Widget _buildSocialButton({
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF1A1D24),
          side: const BorderSide(color: Color(0xFFD5D8E2), width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1D24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool passObscured = _obscurePass;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F8FC),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1D24)),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1D24),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Just a few things to get started',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF8E93A0),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _nameC,
                    textInputAction: TextInputAction.next,
                    decoration: _buildFieldDecoration(
                      hintText: 'Nama lengkap',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _emailC,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: _checkEmailValidity,
                    decoration: _buildFieldDecoration(
                      hintText: 'Mariorossi@gmail.com',
                      suffixIcon: _isEmailValid
                          ? const Icon(
                              Icons.check,
                              size: 18,
                              color: _successGreen,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _passC,
                    obscureText: passObscured,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _loading ? null : _register(),
                    decoration: _buildFieldDecoration(
                      hintText: 'Password (min 8 karakter)',
                      suffixIcon: IconButton(
                        icon: Icon(
                          passObscured
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 18,
                          color: const Color(0xFF9EA3B0),
                        ),
                        onPressed: () =>
                            setState(() => _obscurePass = !passObscured),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryPurple,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _loading ? null : _register,
                      child: _loading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Create account',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color(0xFFE4E6EE),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'or',
                          style: TextStyle(
                            fontSize: 12.5,
                            color: Color(0xFF8E93A0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xFFE4E6EE),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  _buildSocialButton(
                    icon: const Text(
                      'G',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4285F4),
                      ),
                    ),
                    label: 'Continue with Google',
                    onTap: () =>
                        _showMessage('Sign up dengan Google belum dihubungkan'),
                  ),
                  const SizedBox(height: 10),
                  _buildSocialButton(
                    icon: const Icon(
                      Icons.facebook,
                      size: 20,
                      color: Color(0xFF1877F2),
                    ),
                    label: 'Continue with Facebook',
                    onTap: () =>
                        _showMessage('Sign up dengan Facebook belum dihubungkan'),
                  ),
                  const SizedBox(height: 10),
                  _buildSocialButton(
                    icon: const Icon(
                      Icons.apple,
                      size: 21,
                      color: Colors.black,
                    ),
                    label: 'Continue with Apple',
                    onTap: () =>
                        _showMessage('Sign up dengan Apple belum dihubungkan'),
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