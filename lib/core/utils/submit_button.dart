 import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class SubmitButton extends StatelessWidget {

   final String text;

   final VoidCallback? buttonOnTap;
   
  const SubmitButton({super.key, required this.text, required this.buttonOnTap});

  @override
  Widget build(BuildContext context) {

     bool _isPressed = false;
  
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState){
        return  GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: buttonOnTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: 56.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: _isPressed ? Color(0xFFF5F4ED) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ); 
      });
  }
}