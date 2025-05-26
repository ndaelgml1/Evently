import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormFeild extends StatefulWidget {
  CustomTextFormFeild({
    super.key,
    required this.validation,
    required this.controller,
    required this.hint,
    required this.keboard,
    required this.prefixicon,
    this.obscure = false,
    this.suffixIcon,
  });

  String? Function(String?) validation;
  bool obscure;
  IconData? suffixIcon;
  TextEditingController controller;
  final String hint;
  TextInputType keboard;
  IconData prefixicon;

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      obscureText: widget.obscure ? isHidden : false,
      validator: widget.validation,
      controller: widget.controller,
      keyboardType: widget.keboard,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        contentPadding: REdgeInsets.all(22),
        labelText: widget.hint,
        labelStyle: Theme.of(context).textTheme.titleSmall,
        iconColor: Theme.of(context).colorScheme.onPrimaryContainer,
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
        prefixIcon: Icon(
          widget.prefixicon,
          color: Theme.of(context).colorScheme.outline,
          size: 30,
        ),

        suffixIcon:
            widget.obscure
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  icon:
                      isHidden
                          ? Icon(Icons.visibility_off ,size: 30, color: Theme.of(context).colorScheme.outline,)
                          : Icon(Icons.visibility  ,size: 30,),
                )
                : null,
      ),
    );
  }
}















































































































































// class CustomTextFormFeild extends StatefulWidget {
//   CustomTextFormFeild(
//       {super.key,
//       required this.label,
//       required this.prefixIcon,
//       this.sufixIcon,
//       this.onClick,
//       this.obscure = false});

//   final String label;
//   final IconData prefixIcon;
//   final IconData? sufixIcon;
//   bool obscure;

//   VoidCallback? onClick;

//   @override
//   State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
// }

// class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: widget.obscure,
//       decoration: InputDecoration(
//         prefixIcon: Icon(widget.prefixIcon),
//         labelText: widget.label,
//         suffixIcon: IconButton(
//           onPressed: widget.onClick,
//           icon: Icon(
//             widget.obscure ? Icons.visibility_off : Icons.visibility,
//           ),
//         ),
//       ),
//     );

   
//   }
// }
