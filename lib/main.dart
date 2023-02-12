import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfma/blocs/sign_in/sign_in_cubit.dart';
import 'package:sfma/pages/home_screen.dart';
import 'package:sfma/pages/sign_in_screen.dart';
import 'package:sfma/pages/sign_up_screen.dart';
import 'package:sfma/repositories/auth_repository.dart';

import 'blocs/auth/auth_bloc.dart';
import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => AuthRepository(
                firebaseAuth: FirebaseAuth.instance,
                firebaseFirestore: FirebaseFirestore.instance))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<SignInCubit>(
            create: (context) => SignInCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Shop Finance Management app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // useMaterial3: true,
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
          routes: {
            SignUpScreen.routeName: (context) => const SignUpScreen(),
            SignInScreen.routeName: (context) => const SignInScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}
