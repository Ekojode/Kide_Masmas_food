import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

const apiKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxnb3JsZmtoc2ZteHNudGxvY3htIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTc5Njc0NjIsImV4cCI6MTk3MzU0MzQ2Mn0.xWIuayaOFesJi-OkGcGYRds1y3YbiFoKH9o2qFPUQA0";
const apiUrl = "https://lgorlfkhsfmxsntlocxm.supabase.co";

class Auth with ChangeNotifier {
  String? accessToken;

  bool get isAuth {
    return accessToken != null;
  }

  Future<void> signUp(String email, String password) async {
    GotrueSessionResponse response =
        await SupabaseClient(apiUrl, apiKey).auth.signUp(email, password);

    if (response.error == null) {
      // final userEmail = response.data!.user!.email;

      // print("Successful sign up for $userEmail");
      // print(response.statusCode);
    } else {
      // print("Error message: ${response.error!.message}");
      // print(response.statusCode);
    }
  }

  Future<void> signIn(String email, String password) async {
    GotrueSessionResponse response =
        await SupabaseClient(apiUrl, apiKey).auth.signIn(
              email: email,
              password: password,
              options: AuthOptions(redirectTo: apiUrl),
            );

    if (response.error == null) {
      //  final userEmail = response.data!.user!.email;
      //   print("Successful login up for $userEmail");
      accessToken = response.data!.accessToken;
      notifyListeners();
      // print(accessToken);
    } else {
      //  print("Error message: ${response.error!.message}");
    }
  }
}
