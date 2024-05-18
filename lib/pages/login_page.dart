import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_y_z/auth/auth_service.dart';
import 'package:shop_y_z/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errMsg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email Address"),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains("@")) {
                      return "Provide a valid Email Address";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.key),
                      labelText: "Password (at least 6 characters)"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Provide a valid Password";
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _authenticate,
                child: const Text('Login as Admin'),
              ),
              Text(
                _errMsg,
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _authenticate() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: "Logging In");
      final email = _emailController.text;
      final pass = _passwordController.text;
      try {
        final status = await AuthService.loginAdmin(email, pass);
        EasyLoading.dismiss();
        if (status) {
          context.goNamed(DashboardPage.routeName);
        } else {
          await AuthService.logout();
          setState(() {
            _errMsg = 'This account does not belongs to admin';
          });
        }
      } on FirebaseAuthException catch (error) {
        EasyLoading.dismiss();
        setState(() {
          _errMsg = error.message!;
        });
      }
    }
  }
}
