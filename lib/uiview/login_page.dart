import 'package:flutter/material.dart';
import 'package:task_one_flutter_udacoding/uiview/register_page.dart';
import 'package:task_one_flutter_udacoding/utils/snackbar_ext.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const String defaultUsername = "Admin";
  static const String defaultPassword = "Admin123!";

  TextEditingController etUsername = TextEditingController();
  TextEditingController etPassword = TextEditingController();

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30),

                Align(alignment: Alignment.centerLeft, child: Text("Username")),

                TextFormField(
                  controller: etUsername,
                  validator: (val) {
                    return val!.isEmpty ? "Username tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                    hintText: "Default: Admin",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 24),

                Align(alignment: Alignment.centerLeft, child: Text("Password")),
                SizedBox(height: 8),
                TextFormField(
                  controller: etPassword,
                  obscureText: true,
                  validator: (val) {
                    return val!.isEmpty ? "Password tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Default: Admin123!",
                  ),
                ),

                SizedBox(height: 48),

                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    if (keyForm.currentState?.validate() == true) {
                      String nName = etUsername.text.toString();
                      String nPassword = etPassword.text.toString();

                      if (nName == defaultUsername &&
                          nPassword == defaultPassword) {
                        context.showSuccessSnackBar(
                          "Selamat datang $nName, selamat berbelanja!",
                        );
                      } else {
                        context.showWarningSnackbar(
                          "Username atau Password salah!",
                        );
                      }
                    } else {
                      context.showErrorSnackBar(
                        "Username dan Password tidak boleh kosong!",
                      );
                    }
                  },
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: Text("Login"),
                ),

                SizedBox(height: 24),

                TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    ),
                  },
                  child: Text(
                    "Daftar di sini!",
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
