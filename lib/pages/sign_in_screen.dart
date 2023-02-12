import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfma/blocs/sign_in/sign_in_cubit.dart';
import 'package:sfma/pages/sign_up_screen.dart';
import 'package:validators/validators.dart';

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
  void _submit() {
    setState(() {
      _autovalidatrMode = AutovalidateMode.always;
    });
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;
    form.save();
    print('email:$_email,password:$_password');
    context.read<SignInCubit>().signin(email: _email!, password: _password!);
  }

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
                      'https://cdn-icons-png.flaticon.com/128/295/295128.png',
                      height: 250,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          labelText: "Email",
                          prefixIcon: Icon(Icons.mail)),
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email required';
                        }
                        if (!isEmail(value.trim())) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _email = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock)),
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Password required';
                        }
                        if (value.trim().length < 6) {
                          return 'Password must be at least 6 characteres long';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _password = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _submit();
                      },
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10)),
                      child: const Text('Sign In'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.underline)),
                      child: const Text('Not a member? Sign Up!'),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
