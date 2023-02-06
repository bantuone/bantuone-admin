import 'package:bantuone_admin/constants/colors.dart';
import 'package:bantuone_admin/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: midBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Center(
                child: Image.asset(
                  'assets/bantuone_logo_admin.png',height: 200, width: 200,
                ),
              ),
              SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Masuk',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                focusNode: controller.usernameNode,
                controller: controller.usernameCtr,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Nama pengguna",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: white),
                  ),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: white,
                    width: 2.0,
                  ),
                ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                focusNode: controller.passwordNode,
                controller: controller.passwordCtr,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Kata sandi",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: white),
                  ),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: white,
                    width: 2.0,
                  ),
                ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 24),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: darkBlue),
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
