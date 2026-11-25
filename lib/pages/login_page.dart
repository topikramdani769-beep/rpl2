import 'package:flutter/material.dart';
import '../services/api_exception.dart';
import '../services/auth_service.dart';
import 'article_list_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailC = TextEditingController();
  final _phoneC = TextEditingController();
  final _passC = TextEditingController();
  final _auth = AuthService();

  bool _loading = false;
  bool _obscurePassword = true;
  bool _isEmailValid = false;
  int _selectedTab = 0; // 0 = Email, 1 = Phone number
  String _countryCode = '+62';

  static const Color _bgSoft = Color(0xFFF9F8FC);
  static const Color _primaryPurple = Color(0xFF5B3DF5);
  static const Color _borderColor = Color(0xFFE2E4EC);
  static const Color _socialBorder = Color(0xFFD5D8E2);
  static const Color _successGreen = Color(0xFF2E9E44);
  static const Color _textDark = Color(0xFF1A1D24);
  static const Color _textMuted = Color(0xFF8E93A0);

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

  Future<void> _login() async {
    final identifier = _selectedTab == 0
        ? _emailC.text.trim()
        : '$_countryCode${_phoneC.text.trim()}';

    if (identifier.isEmpty || _passC.text.isEmpty) {
      _showMessage(
        _selectedTab == 0
            ? 'Email dan password wajib diisi'
            : 'Nomor telepon dan password wajib diisi',
      );
      return;
    }

    setState(() => _loading = true);
    try {
      await _auth.login(
        email: _emailC.text.trim(),
        password: _passC.text,
      );
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ArticleListPage()),
      );
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
    _emailC.dispose();
    _phoneC.dispose();
    _passC.dispose();
    super.dispose();
  }

  InputDecoration _buildInputDecoration({
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

  Widget _buildTabSwitcher() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _selectedTab = 0),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: _selectedTab == 0
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: _selectedTab == 0 ? _textDark : _textMuted,
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color:
                          _selectedTab == 0 ? _primaryPurple : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _selectedTab = 1),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Phone number',
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: _selectedTab == 1
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: _selectedTab == 1 ? _textDark : _textMuted,
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color:
                          _selectedTab == 1 ? _primaryPurple : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Divider(height: 1, thickness: 1, color: Color(0xFFE4E6EE)),
      ],
    );
  }

  Widget _buildPhoneField() {
    const codes = ['+62', '+1', '+44'];
    final safeCode = codes.contains(_countryCode) ? _countryCode : '+62';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _borderColor),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: safeCode,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: _textDark,
              ),
              style: const TextStyle(fontSize: 13.5, color: _textDark),
              items: codes
                  .map(
                    (code) => DropdownMenuItem<String>(
                      value: code,
                      child: Text(code),
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                if (val != null) setState(() => _countryCode = val);
              },
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: 48,
            child: TextField(
              controller: _phoneC,
              keyboardType: TextInputType.phone,
              decoration: _buildInputDecoration(hintText: '812 3456 7890'),
            ),
          ),
        ),
      ],
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
          foregroundColor: _textDark,
          side: const BorderSide(color: _socialBorder, width: 1),
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
                color: _textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isEmailTab = _selectedTab == 0;
    final bool isObscured = _obscurePassword;

    return Scaffold(
      backgroundColor: _bgSoft,
      appBar: AppBar(
        backgroundColor: _bgSoft,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: _textDark),
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
                    'Log in',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: _textDark,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Welcome back, sign in to continue',
                    style: TextStyle(
                      fontSize: 13,
                      color: _textMuted,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTabSwitcher(),
                  const SizedBox(height: 18),
                  if (isEmailTab)
                    TextField(
                      controller: _emailC,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: _checkEmailValidity,
                      decoration: _buildInputDecoration(
                        hintText: 'Email',
                        suffixIcon: _isEmailValid
                            ? const Icon(
                                Icons.check,
                                size: 18,
                                color: _successGreen,
                              )
                            : null,
                      ),
                    )
                  else
                    _buildPhoneField(),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _passC,
                    obscureText: isObscured,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _loading ? null : _login(),
                    decoration: _buildInputDecoration(
                      hintText: 'Passwords',
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscured
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 18,
                          color: const Color(0xFF9EA3B0),
                        ),
                        onPressed: () =>
                            setState(() => _obscurePassword = !isObscured),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Text(
                          'Forget password? ',
                          style: TextStyle(fontSize: 12.5, color: _textMuted),
                        ),
                        GestureDetector(
                          onTap: () => _showMessage(
                            'Fitur reset password belum tersedia',
                          ),
                          child: const Text(
                            'Reset it',
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                              color: _primaryPurple,
                            ),
                          ),
                        ),
                      ],
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
                      onPressed: _loading ? null : _login,
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
                              'Log in',
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
                        child: Divider(color: Color(0xFFE4E6EE), thickness: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'or',
                          style: TextStyle(fontSize: 12.5, color: _textMuted),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Color(0xFFE4E6EE), thickness: 1),
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
                        _showMessage('Login dengan Google belum dihubungkan'),
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
                        _showMessage('Login dengan Facebook belum dihubungkan'),
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
                        _showMessage('Login dengan Apple belum dihubungkan'),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterPage()),
                    ),
                    child: const Text(
                      'Belum punya akun? Register',
                      style: TextStyle(fontSize: 13, color: _textMuted),
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