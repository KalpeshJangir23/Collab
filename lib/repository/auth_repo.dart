// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

//! Provider(Why ? => give easy acces to class and can test our app easily)
// so we are goona pass the instance of AuthRepo class to the provider
final authRepoProvider = Provider(
  (ref) => AuthRepo(
    googleSignIn: GoogleSignIn(),
  ),
); // here this ref(type ProviderRef) is a object which allow us to interact with other provider

// flutter run -d chrome --web-port 3000

class AuthRepo {
  final GoogleSignIn _googleSignIn; // instance of google Signing (private varialbe)  and goona use throughout the code

  //-- The this keyword refers to the current instance.
  //?? Dart has initializing formal parameters to simplify the common pattern of assigning a constructor argument to an instance variable. Use this.propertyName directly in the constructor declaration, and omit the body.

  AuthRepo({
    // -- Constructor
    required GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn; // => private var = Constructor public var
  /// so we cannot have a private a private in contructor so we have googleSignIn as public variable
  // in constuctor we can't have private variable
  // so we are passing it as public variable and its scope is limit to constuctor

  // so why this because we want the scope of google signing can only be use in this class and we dont want other class to access this file

  void signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn(); // signIn () is type future
      // "Future" represents an asynchronous operation that will be completed at some point in the future and will yield a result. It's a core concept in Dart's asynchronous programming model, allowing you to work with operations that may take some time to complete, such as fetching data from a server, reading a file, or any other I/O operation.

      if (user != null) {
        print(user.displayName);
        print(user.email);
        print(user.photoUrl);
      }
    } catch (e) {
      print("this is the error a" + " ");
      print(e);
    }
  }
}
