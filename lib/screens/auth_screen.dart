import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

import '../global/app_text_style.dart';
import '../global/app_color.dart';

import '../screens/on_boarding_2.dart';
import '../provider/auth_provider.dart';
import '../widgets/action_button.dart';
import '../widgets/error_dialog.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const routeName = "/authScreen";

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  AuthMode authMode = AuthMode.signIn;
  bool _passwordObscure = true;
  bool _passwordConfirm = true;
  bool _keepSignedIn = false;
  bool _addToEmailList = false;
  bool _isLoading = false;
  final TextEditingController _passwordControl = TextEditingController();
  final Map<String, String> userAuth = {"userEmail": "", "userPassword": ""};
  final _passwordFocusNode = FocusNode();
  final _passwordConfirmFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordControl.dispose();
    _passwordFocusNode.dispose();
    _passwordConfirmFocusNode.dispose();
    super.dispose();
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      final authAction = Provider.of<Auth>(context, listen: false);

      _formKey.currentState!.save();
      if (authMode == AuthMode.signIn) {
        await authAction.signIn(
            userAuth["userEmail"]!, userAuth["userPassword"]!, context);
      } else {
        await authAction.signUp(
            userAuth["userEmail"]!, userAuth["userPassword"]!, context);
      }
    } catch (e) {
      String errorMessage = e.toString();
      //print("${e.toString()} is the error message");
      showDialog(
          context: context,
          builder: (ctx) {
            return ErrorDialog(errorMessage: errorMessage);
          });

      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 42.h,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/Pattern.png",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      margin: EdgeInsets.all(10.h),
                      child: Image.asset(
                        "assets/images/Logo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
                child: Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 7.5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //    crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            authMode == AuthMode.signIn
                                ? "Login To Your Account"
                                : "Sign Up For Free",
                            style: textStyle1,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              //   border: Border.all(color: greenColor1),
                            ),
                            child: TextFormField(
                              onSaved: (newValue) {
                                userAuth["userEmail"] = newValue!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "";
                                }
                                if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return "Please enter a valid email!";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_passwordFocusNode);
                              },
                              decoration: const InputDecoration(
                                  //      enabledBorder: OutlineInputBorder(),
                                  hintText: "Email",
                                  //     border: InputBorder.none,
                                  icon: Icon(
                                    Icons.mail,
                                    color: greenColor1,
                                  )),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              onSaved: ((newValue) {
                                userAuth["userPassword"] = newValue!;
                              }),
                              controller: _passwordControl,
                              obscureText: _passwordObscure,
                              focusNode: _passwordFocusNode,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a password";
                                }
                                if (value.length <= 5) {
                                  return "Please enter a strong password!";
                                }
                                return null;
                              },
                              textInputAction: authMode == AuthMode.signIn
                                  ? TextInputAction.done
                                  : TextInputAction.next,
                              onFieldSubmitted: authMode == AuthMode.signIn
                                  ? null
                                  : (_) {
                                      FocusScope.of(context).requestFocus(
                                          _passwordConfirmFocusNode);
                                    },
                              decoration: InputDecoration(
                                hintText: "Password",
                                //    border: InputBorder.none,
                                icon: const Icon(
                                  Icons.lock,
                                  color: greenColor1,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    if (_passwordObscure) {
                                      setState(() {
                                        _passwordObscure = false;
                                      });
                                    } else {
                                      setState(() {
                                        _passwordObscure = true;
                                      });
                                    }
                                  },
                                  icon: Icon(_passwordObscure
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off),
                                ),
                              ),
                            ),
                          ),
                          authMode == AuthMode.signIn
                              ? Text(
                                  "Or Continue with",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextFormField(
                                    obscureText: _passwordConfirm,
                                    validator: (value) {
                                      if (value == "" ||
                                          value != _passwordControl.text) {
                                        return "Please ensure passWord is same!";
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.done,
                                    focusNode: _passwordConfirmFocusNode,
                                    decoration: InputDecoration(
                                      hintText: "Confirm Password",
                                      //     border: InputBorder.none,
                                      icon: const Icon(Icons.lock,
                                          color: greenColor1),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          if (_passwordConfirm) {
                                            setState(() {
                                              _passwordConfirm = false;
                                            });
                                          } else {
                                            setState(() {
                                              _passwordConfirm = true;
                                            });
                                          }
                                        },
                                        icon: Icon(_passwordConfirm
                                            ? Icons.remove_red_eye
                                            : Icons.visibility_off),
                                      ),
                                    ),
                                  ),
                                ),
                          authMode == AuthMode.signIn
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 6.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                              color: const Color(0xffF4F4F4),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.facebook,
                                                color: Colors.blue[700],
                                              ),
                                              const Text(" Facebook")
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 5.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                              color: const Color(0xffF4F4F4),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                  "assets/images/google-icon 1.png"),
                                              const Text(" Google")
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                OnBoarding2.routeName);
                                      },
                                      child: Text(
                                        "Forgot your Password?",
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                          color: greenColor1,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Column(
                                  children: [
                                    Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.3,
                                          child: Checkbox(
                                              shape: const CircleBorder(),
                                              value: _keepSignedIn,
                                              onChanged: (value) {
                                                setState(() {
                                                  _keepSignedIn = value!;
                                                });
                                              }),
                                        ),
                                        const Text("Keep me Signed In")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.3,
                                          child: Checkbox(
                                              shape: const CircleBorder(),
                                              value: _addToEmailList,
                                              onChanged: (value) {
                                                setState(() {
                                                  _addToEmailList = value!;
                                                });
                                              }),
                                        ),
                                        const Text(
                                            "Email me about special updates")
                                      ],
                                    )
                                  ],
                                ),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 12.h,
                child: Column(
                  children: [
                    _isLoading
                        ? const CircularProgressIndicator(
                            color: greenColor1,
                            strokeWidth: 2.0,
                          )
                        : ActionButton(
                            height: 4.5.h,
                            width: authMode == AuthMode.signIn ? 30.w : 40.w,
                            onTap: _submit,
                            text: (authMode == AuthMode.signIn
                                ? "Login"
                                : "Create Account")),
                    TextButton(
                      onPressed: () {
                        if (authMode == AuthMode.signIn) {
                          setState(() {
                            authMode = AuthMode.signUp;
                          });
                        } else {
                          setState(() {
                            authMode = AuthMode.signIn;
                          });
                        }
                      },
                      child: Text(
                        authMode == AuthMode.signIn
                            ? "Don't have an account yet?, Sign Up"
                            : "Already have an account?, Sign In",
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: greenColor1),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum AuthMode {
  signUp,
  signIn,
}
