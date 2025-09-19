import 'package:flutter/material.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/auth/login_screen.dart';
import 'package:fluttertest/ecomerApp1/utils/theme/app_text_style.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controlerEmail = TextEditingController();
    final TextEditingController contrlerpassword = TextEditingController();
    final TextEditingController controlerfullname = TextEditingController();
    final TextEditingController contrleconfrompass = TextEditingController();
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
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                const SizedBox(height: 30),
                Text("Creat account", style: AppTextStyle.h1),
                const SizedBox(height: 10),
                Text(
                  "Sign up get started",
                  style: AppTextStyle.apply(
                    textstyle: AppTextStyle.b1,
                    color: isdark ? Colors.white60 : Colors.black54,
                  ),
                ),
                const SizedBox(height: 30),
                CastoumTextfield(
                  labelText: "full name",
                  prefixIcon: const Icon(Icons.person),
                  keyboardType: TextInputType.name,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "can't be empty";
                    }
                    return null;
                  },
                  controller: controlerfullname,
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                CastoumTextfield(
                  labelText: "password",
                  prefixIcon: const Icon(Icons.lock),
                  controller: contrleconfrompass,
                  ispassword: true,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "can't be empty";
                    }
                    if (p0 == contrlerpassword.text) {
                      return "must be similer password";
                    }
                    return null;
                  },
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
                    onPressed: () {},
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
                      "Already have an account ?",
                      style: AppTextStyle.apply(
                        textstyle: AppTextStyle.b2,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign in",
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
