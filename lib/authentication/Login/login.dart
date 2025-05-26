import 'package:easy_localization/easy_localization.dart';
import 'package:evently/authentication/Login/widgets/google_button.dart';
import 'package:evently/core/dialog_utils.dart';
import 'package:evently/core/resources/routes/routes_manager.dart';
import 'package:evently/core/reusable_component/custom_elevated_button.dart';
import 'package:evently/core/reusable_component/custom_switch.dart';
import 'package:evently/core/reusable_component/custom_text_button.dart';
import 'package:evently/core/reusable_component/custom_text_form_feild.dart';
import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/constants.dart';
import 'package:evently/core/resources/strings_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _SignInState();
}

class _SignInState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  int selectedLanguage = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectedLanguage = context.locale.languageCode == "ar" ? 1 : 0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    child: Image.asset(
                      AssetsManager.logo,
                      width: 140.w,
                      height: 176.h,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  CustomTextFormFeild(
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return StringsManager.errorMes.tr();
                      }
                      if (!RegExp(emailRegex).hasMatch(value)) {
                        return StringsManager.invalidEmail.tr();
                      }
                      return null;
                    },
                    controller: emailController,
                    hint: StringsManager.email.tr(),
                    prefixicon: Icons.email_rounded,
                    keboard: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormFeild(
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return StringsManager.errorMes.tr();
                      }
                      if (value.length < 8) {
                        return StringsManager.errorPassMess.tr();
                      }
                      return null;
                    },
                    controller: passwordController,
                    hint: StringsManager.password.tr(),
                    prefixicon: Icons.lock,
                    keboard: TextInputType.visiblePassword,
                    obscure: true,
                  ),

                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                        title: StringsManager.forgetPassword.tr(),
                        onClick: () {
                          Navigator.pushNamed(
                            context,
                            RoutesManager.resetpassword,
                          );
                        },
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    title: StringsManager.login.tr(),
                    onClick: () {
                      if (formKey.currentState?.validate() ?? false) {
                        Login();
                      }
                    },
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.dontHaveAccount.tr(),
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(fontSize: 18),
                      ),
                      CustomTextButton(
                        title: StringsManager.createAccount.tr(),
                        onClick: () {
                          Navigator.pushNamed(context, RoutesManager.register);
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Padding(
                          padding: REdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            StringsManager.or,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  GoogleButton(title: StringsManager.loginWithGoogle.tr()),

                  SizedBox(height: 20.h),

                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 138),
                    child: CustomSwitch(
                      icon1: AssetsManager.us,
                      icon2: AssetsManager.eg,
                      isColored: false,
                      selected: selectedLanguage,
                      onChange: (value) {
                        setState(() {
                          selectedLanguage = value;
                          if (value == 1) {
                            context.setLocale(Locale('ar'));
                          } else {
                            (context.setLocale(Locale('en')));
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    try {
      DialogUtils.showLodingDialog(context);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print(credential.user?.uid);
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, RoutesManager.home);
      print(credential.user?.uid);
      showDialog(context: context, builder: (context) => AlertDialog());
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        DialogUtils.showMessageDialog(
          context: context,
          message: "No user found for that email.",
          posTitle: "Ok",
          posClick: () {
            Navigator.pop(context);
          },
        );
      } else if (e.code == 'Wrong password provided for that user.') {
        DialogUtils.showMessageDialog(
          context: context,
          message: "No user found for that email.",
          posTitle: "Ok",
          posClick: () {
            Navigator.pop(context);
          },
        );
      }
    }
  }
}
