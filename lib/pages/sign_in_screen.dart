import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String routeName = '/signin';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidatrMode = AutovalidateMode.disabled;
  String? _email, _password;
  void _submit() {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
                key: _formKey,
                autovalidateMode: _autovalidatrMode,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Image.network(
                        'https://cdn-icons-png.flaticon.com/128/295/295128.png')
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
