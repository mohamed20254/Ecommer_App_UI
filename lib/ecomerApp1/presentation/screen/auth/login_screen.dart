import 'package:flutter/material.dart';
import 'package:fluttertest/ecomerApp1/utils/routes/app_routs.dart';
import 'package:fluttertest/ecomerApp1/utils/theme/app_text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controlerEmail = TextEditingController();
  final TextEditingController contrlerpassword = TextEditingController();
  @override
  void dispose() {
    controlerEmail.dispose();
    contrlerpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isdark = Theme.of(context).brightness == Brightness.dark;
    final Color primary = Theme.of(context).primaryColor;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text("Welcome Back!", style: AppTextStyle.h1),
                const SizedBox(height: 10),
                Text(
                  "Sign in to continuo shopping",
                  style: AppTextStyle.apply(
                    textstyle: AppTextStyle.b1,
                    color: isdark ? Colors.white60 : Colors.black54,
                  ),
                ),
                const SizedBox(height: 30),
                CastoumTextfield(
                  labelText: "email",
                  prefixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,

                  validator: validationEmail,
                  controller: controlerEmail,
                ),
                const SizedBox(height: 10),
                CastoumTextfield(
                  labelText: "password",
                  prefixIcon: const Icon(Icons.lock),
                  controller: contrlerpassword,
                  ispassword: true,
                  validator: vailtationpassword,
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,

                  child: Text(
                    "Forget password?",
                    style: AppTextStyle.apply(
                      textstyle: AppTextStyle.b2,
                      color: primary,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: size.width,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRouts.mainscreen,
                        (final route) => false,
                      );
                    },
                    child: const Text(
                      "Sign in ",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.3,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: AppTextStyle.apply(
                        textstyle: AppTextStyle.b2,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouts.sinup);
                      },
                      child: Text(
                        "Sign up",
                        style: AppTextStyle.apply(
                          textstyle: AppTextStyle.b2,
                          color: primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: prefer_final_parameters
String? vailtationpassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Password is required";
  }
  if (value.length < 8) {
    return "Password must be at least 8 characters";
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return "Must contain at least one uppercase letter";
  }
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return "Must contain at least one number";
  }
  if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
    return "Must contain at least one special character (!@#\$&*~)";
  }
  return null; // ✅ valid
}

String? validationEmail(final String? value) {
  if (value == null || value.isEmpty) {
    return "Email is required";
  }

  // Regular Expression بسيطة للتحقق من الإيميل
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  if (!emailRegExp.hasMatch(value)) {
    return "Enter a valid email";
  }

  return null; // ✅ valid
}

class CastoumTextfield extends StatefulWidget {
  final String labelText;
  final Widget prefixIcon;
  final bool ispassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  const CastoumTextfield({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.ispassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  State<CastoumTextfield> createState() => _CastoumTextfieldState();
}

class _CastoumTextfieldState extends State<CastoumTextfield> {
  bool obsqurtext = true;
  @override
  Widget build(final BuildContext context) {
    final bool isdark = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.ispassword && obsqurtext,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isdark ? Colors.white30 : Colors.black26,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: AppTextStyle.apply(
          textstyle: AppTextStyle.b2,
          color: isdark ? Colors.white24 : Colors.black26,
        ),
        prefixIcon: widget.prefixIcon,
        prefixIconColor: isdark ? Colors.white24 : Colors.black26,
        suffixIcon:
            widget.ispassword
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      obsqurtext = !obsqurtext;
                    });
                  },
                  icon: Icon(
                    obsqurtext ? Icons.visibility_off : Icons.visibility,
                  ),
                )
                : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isdark ? Colors.white24 : Colors.black26,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isdark ? Colors.white24 : Colors.black12,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
