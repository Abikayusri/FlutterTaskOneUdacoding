import 'package:flutter/material.dart';
import 'package:task_one_flutter_udacoding/utils/snackbar_ext.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController etFullname = TextEditingController();
  final TextEditingController etUsername = TextEditingController();
  final TextEditingController etPassword = TextEditingController();
  final TextEditingController etEmail = TextEditingController();

  @override
  void dispose() {
    etFullname.dispose();
    etUsername.dispose();
    etPassword.dispose();
    etEmail.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void _register() {
    // Validate form first
    if (!keyForm.currentState!.validate()) {
      context.showErrorSnackBar("Mohon lengkapi semua field dengan benar!");
      return;
    }

    String fullname = etFullname.text.trim();
    String username = etUsername.text.trim();
    String email = etEmail.text.trim();
    String password = etPassword.text.trim();

    if (fullname.isEmpty || username.isEmpty || email.isEmpty || password.isEmpty) {
      context.showErrorSnackBar("Semua field tidak boleh kosong!");
      return;
    }

    if (!_isValidEmail(email)) {
      context.showWarningSnackbar("Format email tidak valid!");
      return;
    }

    if (password.length < 6) {
      context.showWarningSnackbar("Password minimal 6 karakter!");
      return;
    }

    Navigator.pop(context, {
      "fullname": fullname,
      "username": username,
      "email": email,
      "password": password
    });
  }

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Page")),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Center(
            child: Column(
              children: [
                Align(alignment: Alignment.centerLeft, child: Text("Fullname")),

                SizedBox(height: 8),

                TextFormField(
                  controller: etFullname,
                  validator: (val) {
                    return val!.isEmpty ? "Fullname tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Nama Lengkap",
                  ),
                ),

                SizedBox(height: 24),

                Align(alignment: Alignment.centerLeft, child: Text("Username")),

                SizedBox(height: 8),

                TextFormField(
                  controller: etUsername,
                  validator: (val) {
                    return val!.isEmpty ? "Username tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan username",
                  ),
                ),

                SizedBox(height: 24),

                Align(alignment: Alignment.centerLeft, child: Text("Email")),

                SizedBox(height: 8),
                TextFormField(
                  controller: etEmail,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Email tidak boleh kosong";
                    }
                    if (!_isValidEmail(val)) {
                      return "Format email tidak valid";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Email",
                  ),
                ),

                SizedBox(height: 24),

                Align(alignment: Alignment.centerLeft, child: Text("Password")),

                SizedBox(height: 8),
                TextFormField(
                  controller: etPassword,
                  obscureText: true,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    if (val.length < 6) {
                      return "Password minimal 6 karakter";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan password (min. 6 karakter)",
                  ),
                ),

                SizedBox(height: 48),

                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: _register,
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}