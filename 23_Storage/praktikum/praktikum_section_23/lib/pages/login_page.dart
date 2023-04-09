import 'package:flutter/material.dart';
import 'package:praktikum_section_23/pages/contact_page.dart';
import 'package:praktikum_section_23/pages/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  late SharedPreferences dataLogin;
  late bool newUser;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    dataLogin = await SharedPreferences.getInstance();
    newUser = dataLogin.getBool('login') ?? true;
    if (newUser == false) {
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: ListView(
              children: [
                const FlutterLogo(size: 150),
                const SizedBox(height: 20),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    controller: usernameController,
                    validator: (value) {
                      if (value != null && value.length < 4) {
                        return 'Enter at least 4 characters';
                      } else {
                        return null; //form is valid
                      }
                    }),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  controller: passwordController,
                  validator: (value) {
                    if (value != null && value.length < 4) {
                      return 'Enter at least 4 characters';
                    } else {
                      return null; //form is valid
                    }
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final isValid = formKey.currentState!.validate();
                    String username = usernameController.text;
                    if (isValid) {
                      dataLogin.setString('username', username);
                      dataLogin.setBool('login', false);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                          (route) => false);
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          )),
    );
  }
}
