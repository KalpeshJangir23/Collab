// file: lib/repository/auth_repo.dart

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googledocs/constant.dart';
import 'package:googledocs/models/error_models.dart';
import 'package:http/http.dart';
import 'package:googledocs/models/user_models.dart';

//! Provider(Why ? => give easy access to class and can test our app easily)
// so we are goona pass the instance of AuthRepo class to the provider
// this provider is read only provider so to modify the value we can use State provider
final authRepoProvider = Provider(
  (ref) => AuthRepo(
    googleSignIn: GoogleSignIn(),
    client: Client(),
  ),
); // here this ref(type ProviderRef) is a object which allow us to interact with other provider

// flutter run -d chrome --web-port 3000

final userProvider = StateProvider<UserModel?>((ref) => null);

class AuthRepo {
  final GoogleSignIn _googleSignIn; // instance of google Signing (private varialbe)  and goona use throughout the code
  final Client _client;

  //-- The this keyword refers to the current instance.
  //?? Dart has initializing formal parameters to simplify the common pattern of assigning a constructor argument to an instance variable.
  //?? Use this.propertyName directly in the constructor declaration, and omit the body.

  AuthRepo({
    // -- Constructor
    required GoogleSignIn googleSignIn,
    required Client client,
  })  : _googleSignIn = googleSignIn,
        _client = client; // => private var = Constructor public var
  /// so we cannot have a private contructor so we have googleSignIn as public variable
  // in constuctor we can't have private variable
  // so we are passing it as public variable and its scope is limit to constuctor

  // so why this because we want the scope of google signing can only be use in this class and we dont want other class to access this file

  // void signInWithGoogle() async { // Before Handling the error
  Future<ErrorModel> signInWithGoogle() async {
    ErrorModel error = ErrorModel(error: "Some Unexpected erroe", data: null);
    try {
      final user = await _googleSignIn.signIn(); // signIn () is type future
      // "Future" represents an asynchronous operation that will be completed at some point in the future and will yield a result. It's a core concept in Dart's asynchronous programming model, allowing you to work with operations that may take some time to complete, such as fetching data from a server, reading a file, or any other I/O operation.

      if (user != null) {
        final userAcc = UserModel(
          email: user.email,
          name: user.displayName!,
          profilePic: user.photoUrl!,
          uid: '',
          token: '',
        );

        var res = await _client.post(
          Uri.parse('$host/api/signup'),
          body: userAcc.toJson(),
          headers: {'Content-Type': 'application/json;charset=UTF-8'},
        ); // js promise
        //  body: userAcc.toJson() here we convert user data into json

        switch (res.statusCode) {
          case 200:
            final newUser = userAcc.copyWith(
                uid: jsonDecode(res.body)['user']['_id']); // what is copy : if we want to change suppose email we cant directly change it because we have make it final so we use copywith
            error = ErrorModel(error: null, data: newUser);
            break;

          // after this i want to store my user data in provider or statemangement tool
          // so we create userProvider
        }
      }
    } catch (e) {
      error = ErrorModel(error: e.toString(), data: null);
    }
    return error;
  }
}
