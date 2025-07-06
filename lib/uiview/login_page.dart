import 'package:flutter/material.dart';
import 'package:task_one_flutter_udacoding/uiview/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const String defaultUsername = "Admin";
  static const String defaultPassword = "Admin123";

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),

            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            SizedBox(height: 24),

            Align(alignment: Alignment.centerLeft, child: Text('Password')),
            SizedBox(height: 8),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Default: Admin123!',
              ),
            ),

            SizedBox(height: 48),

            MaterialButton(
              minWidth: double.infinity,
              onPressed: () => {
                if (usernameController.text == defaultUsername &&
                    usernameController.text == defaultPassword)
                  {Navigator.pushNamed(context, '/home')},
              },
              color: Colors.teal,
              textColor: Colors.white,
              child: Text('Login'),
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
                'Daftar di sini!',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
