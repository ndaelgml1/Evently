import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DropDownButtonForGender extends StatelessWidget {
  DropDownButtonForGender({super.key});
  String selectedGender = 'male';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        contentPadding: REdgeInsets.all(20),
        labelText: StringsManager.genderhint,
        labelStyle: Theme.of(context).textTheme.titleSmall,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.red, width: 1.5),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.red, width: 1.5),
          borderRadius: BorderRadius.circular(16.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return StringsManager.errorMes;
        }
        return null;
      },

      items: [
        DropdownMenuItem<String>(
          value: "male",
          child: Row(
            children: [
              Image.asset(AssetsManager.moon),
              // SvgPicture.asset(AssetsManager.male ,
              //   height: 24 ,
              //   width: 24 ,
              //   colorFilter: ColorFilter.mode(ColorsManager.blue, BlendMode.srcIn),) ,
              SizedBox(width: 10),
              Text(StringsManager.male.tr()),
            ],
          ),
        ),

        DropdownMenuItem<String>(
          value: "female",
          child: Row(
            children: [
              Image.asset(AssetsManager.moon),
              // SvgPicture.asset(AssetsManager.female ,
              // height: 24 ,
              // width: 24 ,
              // colorFilter: ColorFilter.mode(ColorsManager.blue, BlendMode.srcIn),) ,
              SizedBox(height: 10),
              Text(StringsManager.female.tr()),
            ],
          ),
        ),
      ],
      onChanged: (Value) {
        selectedGender = Value!;
      },
    );
  }
}
