import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:masmas_food/global/app_color.dart';
import 'package:masmas_food/global/app_text_style.dart';
import 'package:masmas_food/widgets/reusable_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../provider/auth_provider.dart';
import '../widgets/action_button.dart';

class BioDataScreen extends StatefulWidget {
  const BioDataScreen({Key? key}) : super(key: key);

  static const routeName = "/biodata";

  @override
  State<BioDataScreen> createState() => _BioDataScreenState();
}

class _BioDataScreenState extends State<BioDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool _isLoading = false;
  bool loaser = false;

  void _submitBiodata() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      final authAction = Provider.of<Auth>(context, listen: false);

      _formKey.currentState!.save();

      await authAction.addBiodata(_firstNameController.text,
          _lastNameController.text, _phoneNumberController.text);
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
    // Navigator.of(context).pushNamed(DummyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: orangeColor1,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Text("Fill in your bio to get started", style: textStyle5),
              SizedBox(height: 2.h),
              Text(
                  "This data will be displayed in your account profile for security",
                  style: textStyle4),
              SizedBox(height: 2.h),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ReusableText(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter a first name";
                            }
                            return null;
                          },
                          controller: _firstNameController,
                          labelText: "First Name"),
                      SizedBox(height: 4.h),
                      ReusableText(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter a last name";
                            }
                            return null;
                          },
                          controller: _lastNameController,
                          labelText: "Last Name"),
                      SizedBox(height: 4.h),
                      ReusableText(
                          validator: (value) {
                            if (value!.trim().length < 11 ||
                                value.trim().length > 12) {
                              return "Enter an 11 digit phone number";
                            }
                            return null;
                          },
                          controller: _phoneNumberController,
                          labelText: "Mobile Number"),
                      loaser
                          ? const CircularProgressIndicator()
                          : const Text("data"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ActionButton(
                      height: 8.h,
                      width: 30.w,
                      onTap: _submitBiodata,
                      text: "Next")
            ],
          ),
        ),
      ),
    );
  }
}
