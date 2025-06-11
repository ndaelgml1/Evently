import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/authentication/Register/drop_down_button.dart';
import 'package:evently/core/dialog_utils.dart';
import 'package:evently/core/firestoreHandeler.dart';
import 'package:evently/core/resources/routes/routes_manager.dart';
import 'package:evently/core/reusable_component/custom_elevated_button.dart';
import 'package:evently/core/reusable_component/custom_text_button.dart';
import 'package:evently/core/reusable_component/custom_text_form_feild.dart';
import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/constants.dart';
import 'package:evently/core/resources/strings_manager.dart';
import 'package:evently/core/reusable_component/custom_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently/model/user.dart' as MyUser;

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int selectedLanguage = 0;
  late GlobalKey<FormState> formKey;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  late TextEditingController ageController;
  late TextEditingController genderController;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    ageController = TextEditingController();
    genderController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    ageController.dispose();
    genderController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectedLanguage = context.locale.languageCode == "ar" ? 1 : 0;

    return Scaffold(
      appBar: AppBar(title: Text(StringsManager.register.tr())),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 16),
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(
                  AssetsManager.logo,
                  width: 140.w,
                  height: 176.h,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextFormFeild(
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return StringsManager.errorMes.tr();
                        }
                        return null;
                      },
                      controller: nameController,
                      hint: StringsManager.name.tr(),
                      prefixicon: Icons.person,
                      keboard: TextInputType.name,
                    ),

                    SizedBox(height: 20.h),

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

                    SizedBox(height: 20.h),

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

                    SizedBox(height: 20.h),

                    CustomTextFormFeild(
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return StringsManager.errorMes.tr();
                        }
                        if (value != passwordController.text) {
                          return StringsManager.errorRePassMess.tr();
                        }
                        return null;
                      },
                      controller: rePasswordController,
                      hint: StringsManager.rePassword.tr(),
                      prefixicon: Icons.lock,
                      keboard: TextInputType.visiblePassword,
                      obscure: true,
                    ),

                    SizedBox(height: 20.h),

                    CustomTextFormFeild(
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return StringsManager.errorMes;
                        }
                        return null;
                      },
                      controller: ageController,
                      hint: StringsManager.age.tr(),
                      prefixicon: Icons.person,
                      keboard: TextInputType.number,
                    ),
                    SizedBox(height: 20.h),

                    //  DropDownButtonForGender(),
                    SizedBox(height: 20.h),

                    CustomElevatedButton(
                      title: StringsManager.createAccount.tr(),
                      onClick: () {
                        if (formKey.currentState?.validate() ?? false) {
                          signup();
                        }
                      },
                    ),
                    SizedBox(height: 14.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringsManager.alreadyHaveAcc.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),

                        CustomTextButton(
                          title: StringsManager.login.tr(),
                          onClick: () {
                            Navigator.pushNamed(context, RoutesManager.login);
                          },
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Spacer(),
                        CustomSwitch(
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
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signup() async {
    try {
      DialogUtils.showLodingDialog(context);
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
      await Firestorehandeler.addUser(
        MyUser.User(
          name: nameController.text,
          age: int.parse(ageController.text),
          gender: genderController.text,
          email: emailController.text,
          id: credential.user?.uid,
        ),
      );

      Navigator.pop(context);
      log('User: ${credential.user?.uid}');
      Navigator.pushReplacementNamed(context, RoutesManager.login);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      await Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesManager.home,
        (route) => false,
      );
      if (e.code == 'weak-password') {
        DialogUtils.showMessageDialog(
          context: context,
          message: 'The password provided is too weak',
          posTitle: 'Ok',
          posClick: () {
            Navigator.pop(context);
          },
        );
      } else if (e.code == 'email-already-in-use') {
        DialogUtils.showMessageDialog(
          context: context,
          message: 'The account already exists for that email.',
          posTitle: 'Ok',
          posClick: () {
            Navigator.pop(context);
          },
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
