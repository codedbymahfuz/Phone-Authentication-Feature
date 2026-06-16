import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:phone_auth/core/helper/helper_class.dart';
import 'package:phone_auth/core/utils/animated_message.dart';
import 'package:phone_auth/core/utils/media_query.dart';
import 'package:phone_auth/core/utils/validator.dart';


class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  bool _isPressed = false;

  final TextEditingController _phoneControler = TextEditingController();

  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.widthPercentage(context, 0.1),
                  vertical: AppSizes.widthPercentage(context, 0.1),
                ),
                child: Column(
                  children: [
                  SizedBox(height: AppSizes.heightPercentage(context, 0.06)),
                    Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEDFE),
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: Colors.blueAccent,
                        ),
                      ),

                       
                      child: Center(
                        child: Image.asset(
                          "lib/assets/images/mobileicon.png",
                          height:  70.h,
                          width: 70.w,
                          fit: BoxFit.contain,
                          //alignment: Alignment.center,
                        ),
                      ),
                    ),

                    SizedBox(height: AppSizes.heightPercentage(context, 0.02)),

                     Text(
                      "ফোন নম্বর দিন",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                     SizedBox(height: 15.h),

                     Text(
                      "আপনার নম্বরে একটি যাচাই কোড পাঠানো হবে",
                      style: TextStyle(
                        fontSize: 14.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    SizedBox(height: 40.h),

                    PhoneCountryPicker(controller: _phoneControler),

                    SizedBox(height: 50.h),

                    otpSendButton(),
                  ],
                ),
              ),
            ),
            AnimatedMessage(message: errorMessage),
          ],
        ),
      ),
    );
  }

  GestureDetector otpSendButton() {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        _validatePhoneNumber();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: AppSizes.heightPercentage(context, 0.07),
        width: double.infinity,
        decoration: BoxDecoration(
          color: _isPressed ? Color(0xFFF5F4ED) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Center(
          child: Text(
            'কোড পাঠাও',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  void _validatePhoneNumber() {
    final String? message = Validatior.validNumber(
      value: _phoneControler.text.trim(),
      nullNumber: "Phone Number is Required",
      validNumberError: "Please Valid Number",
    );

    if (message != null) {
      setState(() {
        errorMessage = message;
      });

      
      Future.delayed(Duration(milliseconds: 100), () {
        setState(() {
          errorMessage = "";
        });
      });
    }
    
  }

  @override
  void dispose() {
    _phoneControler.dispose();
    super.dispose();
  }
}
