import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:phone_auth/core/constants/appcolors.dart';
import 'package:phone_auth/core/utils/animated_message.dart';
import 'package:phone_auth/core/utils/circle_avater_container.dart';
import 'package:phone_auth/core/utils/submit_button.dart';
import 'package:phone_auth/core/utils/validator.dart';
import 'package:phone_auth/features/phone_auth/presentation/cubit/timer_cubit.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationPage extends StatefulWidget {
  final String phoneNumber;
  const OtpVerificationPage({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController _otpControler = TextEditingController();
  late final TapGestureRecognizer _tapRecognizer = TapGestureRecognizer();

  String errorMessage = "";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TimerCubit>().startTimer();
    });

      _tapRecognizer.onTap = _handleResendOtp;
  }

  void _handleResendOtp() {
    context.read<TimerCubit>().startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      height: 50.h,
      width: 50.w,
      textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focucPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.blueColor, width: 1.5),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.green.shade200,
      ),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.redColor),
      borderRadius: BorderRadius.circular(10),
    );

    final firstDigit = widget.phoneNumber.substring(0, 3);
    final lastDigit = widget.phoneNumber.substring(
      widget.phoneNumber.length - 3,
    );

    String showNumber = "${firstDigit}XXXXX$lastDigit";

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 50.h
                ),
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  
              
                    CircularIconWrapper(iconName: 'sms icon.png'),
                    SizedBox(height: 20.h),
              
                    Text(
                      "কোড দিন",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
              
                    SizedBox(height: 15.h),
              
                    Text(
                      "$showNumber নম্বরে পাঠানো ৬-সংখ্যার কোড",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
              
                    SizedBox(height: 15.h),
              
                    Pinput(
                      controller: _otpControler,
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focucPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      errorPinTheme: errorPinTheme,
                      validator: (value) => null,
                    ),
              
                    SizedBox(height: 20.h),
              
                    BlocBuilder<TimerCubit, int>( // errror কেনো
                      builder: (context, second) {
                        return RichText(
                          text: TextSpan(
                            text: "কোড পাননি? ",
                            style: TextStyle(fontSize: 14.sp, color: Colors.black),
                            children: <TextSpan>[
                             second == 0 ? TextSpan(
                                text: "আবার পাঠাও",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.blueColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                recognizer: _tapRecognizer,
                              ) :
              
                              TextSpan(
                                text: "0.$second বাকি",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
              
                    SubmitButton(
                      text: "যাচাই করুন",
                      buttonOnTap: () {
                        if (_validatePinPut()) {
                          clearTextField();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedMessage(message: errorMessage),
        ],
      ),
    );
  }

  bool _validatePinPut() {
    final String? message = Validatior.validPinPutCheck(
      value: _otpControler.text.trim(),
      nullPinputError: "Please Enter OTP",
      sixDigitError: "Please FilUp 6 Digit",
    );

    if (message != null) {
      setState(() {
        errorMessage = message;
      });
     // return false;
    }
    // Future.delayed(Duration(milliseconds: 800), () {
    //   if (mounted) {
    //     setState(() {
    //       errorMessage = "";// ঠিক ভাবে খালি হচ্ছে 
    //     });
    //   }
    //   //  return true;
    // });
    Future.microtask((){
      setState(() {
    errorMessage = message ?? "";
    });

     
  });

  return true;

  //  return true;
  }

  void clearTextField() {
    _otpControler.clear();
  }
}
