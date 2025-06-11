import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../data/auth_repository_impl.dart';
import '../bloc/auth_bloc.dart'; 
import '../widgets/login_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(SignInUseCase(AuthRepositoryImpl(FirebaseAuth.instance))),
      child: const Scaffold(
        body: SafeArea(child: LoginForm()),
      ),
    );
  }
}
