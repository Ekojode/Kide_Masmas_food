import 'package:flutter/material.dart';
import 'package:masmas_food/screens/auth_screen.dart';
import 'package:masmas_food/screens/biodata_screen.dart';
import 'package:masmas_food/screens/overview_screen.dart';
import 'package:supabase/supabase.dart';

const apiKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxnb3JsZmtoc2ZteHNudGxvY3htIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTc5Njc0NjIsImV4cCI6MTk3MzU0MzQ2Mn0.xWIuayaOFesJi-OkGcGYRds1y3YbiFoKH9o2qFPUQA0";
const apiUrl = "https://lgorlfkhsfmxsntlocxm.supabase.co";

final client = SupabaseClient(apiUrl, apiKey);

class Auth with ChangeNotifier {
  String? accessToken;
  String? userId;

  Future<void> signOut(BuildContext context) async {
    await client.auth.signOut().then((response) {
      if (response.error == null) {
        Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
      }
    });
  }

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    await client.auth.signUp(email, password).then((response) {
      if (response.error == null) {
        final User? user = response.data!.user;
        debugPrint(user!.id);

        userId = user.id;
        Navigator.pushNamed(context, BioDataScreen.routeName);
      }
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> addBiodata(String firstName, String lastName, String phoneNumber,
      BuildContext ctx) async {
    await client
        .from("profiles")
        .insert({
          "id": userId,
          "phoneNumber": phoneNumber,
          "firstName": firstName,
          "lastName": lastName,
        })
        .execute()
        .then((response) {
          if (response.error == null) {
            // Navigator.pushNamed(ctx, SignUpSuccess.routeName);
          }
          debugPrint(response.data);
          debugPrint(response.error.toString());
        });
  }

  Future<void> updateBiodata(
      String firstName, String lastName, String phoneNumber) async {
    await client
        .from("profiles")
        .update({
          "firstName": firstName,
          "lastName": lastName,
          "phoneNumber": phoneNumber
        })
        .eq("id", userId)
        .execute()
        .then((value) {
          debugPrint(value.data);
          debugPrint(value.error.toString());
        });
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    await SupabaseClient(apiUrl, apiKey)
        .auth
        .signIn(
          email: email,
          password: password,
          options: AuthOptions(redirectTo: apiUrl),
        )
        .then((response) {
      if (response.error == null) {
        accessToken = response.data!.accessToken;
        debugPrint(accessToken);

        notifyListeners();
        Navigator.of(context)
            .pushReplacementNamed(OverViewScreenScreen.routeName);
      } else {
        throw (response.error!.message);
      }
    }).catchError((e) {
      throw e;
    });
  }
}
