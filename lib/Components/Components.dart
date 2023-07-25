import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/Models/onboardingModel.dart';

Widget onboardingWidget(OnboardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Text(model.title),
        SizedBox(
          height: 15.h,
        ),
        Text(model.body),
      ],
    );

Widget defaultTextFormField({
  bool scure = false,
  required TextEditingController controller,
  required TextInputType type,
  required Icon icon,
  required String hint,
  required String? Function(String?) validate,
  void Function()? sufBut,
  IconData? sufIcon,
}) =>
    SizedBox(
      child: TextFormField(
        validator: validate,
        obscureText: scure,
        obscuringCharacter: "*",
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          prefixIcon: icon,
          suffixIcon: IconButton(icon: Icon(sufIcon), onPressed: sufBut),
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
      ),
    );

Widget defaultButton({
  required void Function()? onpressed,
  Color color = Colors.blue,
  required String text,
}) =>
    SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
    );

Future<bool?> showtoast({
  required String text,
  required Color color,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0.sp,
    );
