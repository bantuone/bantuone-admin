import 'package:bantuone_admin/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/login.png',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Masuk',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  focusNode: controller.usernameNode,
                  controller: controller.usernameCtr,
                  decoration: const InputDecoration(hintText: 'Nama Pengguna'),
                ),
                TextFormField(
                  focusNode: controller.passwordNode,
                  controller: controller.passwordCtr,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Kata Sandi'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 24),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('Masuk'),
                    onPressed: () => controller.login(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
