import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googledocs/coolors.dart';
import 'package:googledocs/repository/auth_repo.dart';
import 'package:googledocs/screens/homeScreen.dart';

class LoginScreen extends ConsumerWidget {
  // Consumer Widget provide us with WidgetRef

  const LoginScreen({super.key});

  void signInGoogle(WidgetRef ref, BuildContext context) async {
    final sMessage = ScaffoldMessenger.of(context);
    final errorModel = await ref.read(authRepoProvider).signInWithGoogle();
    final navigator = Navigator.of(context);

    if (errorModel.error != null) {
      ref.read(userProvider.notifier).update((state) => errorModel.data); // this update the data if there is no error

      navigator.push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      sMessage.showSnackBar(SnackBar(content: Text(errorModel.error!)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PoviderRef allow us to interact with Provider and
    // WidgetRef allow us to interact with  widget
    // Now to call the authRepoProvider we need ref

    // ref.watch(authRepoProvider).signInWithGoogle(); // instead of creating instance of auth repo class we can just use this
    // we can create and can also use this since we where in build function so we watch and outside of build function we can read

    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => signInGoogle(ref, context),
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
