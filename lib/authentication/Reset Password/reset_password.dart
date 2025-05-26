import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/constants.dart';
import 'package:evently/core/reusable_component/custom_elevated_button.dart';
import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/strings_manager.dart';
import 'package:evently/core/reusable_component/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StringsManager.forgetPassword.tr())),

      body: Padding(
        padding: REdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsManager.forgetPassword),
              SizedBox(height: 20.h),
              CustomTextFormFeild(
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return StringsManager.errorMes;
                  }
                  if (RegExp(emailRegex).hasMatch(value)) {
                    return StringsManager.invalidEmail;
                  }
                  return null;
                },
                controller: emailController,
                hint: StringsManager.email,
                keboard: TextInputType.emailAddress,
                prefixicon: Icons.email,
              ),

              SizedBox(height: 20.h),
              CustomElevatedButton(
                title: StringsManager.resetPassword.tr(),
                onClick: () { 
                  if(formKey.currentState?.validate()??false){
                    
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
