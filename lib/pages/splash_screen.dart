import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfma/pages/home_screen.dart';
import 'package:sfma/pages/sign_in_screen.dart';

import '../blocs/auth/auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.authStatus == AuthStatus.unknown) {
          Navigator.pushNamed(context, SignInScreen.routeName);
        } else if (state.authStatus == AuthStatus.authenticated) {
          Navigator.pushNamed(context, HomeScreen.routeName);
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
