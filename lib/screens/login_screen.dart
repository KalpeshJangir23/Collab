import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googledocs/coolors.dart';
import 'package:googledocs/repository/auth_repo.dart';

class LoginScreen extends ConsumerWidget {
  // Consumer Widget provide us with WidgetRef

  const LoginScreen({super.key});

  void signInGoogle(WidgetRef ref) {
    ref.read(authRepoProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PoviderRef allow us to interact with Procvider and WidgetRef allow us to interact with  widget
    // Now to call the authRepoProvider we need ref

    // ref.watch(authRepoProvider).signInWithGoogle(); // instead of creating instance of auth repo class we can just use this
    // we can create and can also use this since we where in build function so we watch and outside of build function we can read

    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => signInGoogle(ref),
          icon: Image.asset(
            "assets/google.png",
            height: 20,
          ),
          label: const Text(
            "Continue with Google",
            style: TextStyle(color: kBlack),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: kWhite,
          ),
        ),
      ),
    );
  }
}
