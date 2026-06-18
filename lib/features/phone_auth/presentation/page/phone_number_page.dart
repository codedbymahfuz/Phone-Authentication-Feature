import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:phone_auth/core/helper/phonecountrypicker.dart';
import 'package:phone_auth/core/utils/animated_message.dart';
import 'package:phone_auth/core/utils/circle_avater_container.dart';
import 'package:phone_auth/core/utils/loading_dialog.dart';
import 'package:phone_auth/core/utils/submit_button.dart';
import 'package:phone_auth/core/utils/validator.dart';
import 'package:phone_auth/features/phone_auth/presentation/page/otp_verification_page.dart';



class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
 // bool _isPressed = true;

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
                  horizontal: 15.w,
                  vertical: 10.h,
                ),
                child: Column(
                  children: [
                  SizedBox(height: 30.h),

                    CircularIconWrapper(iconName: "mobileicon.png"), // এটা তো ঠিক নামছে 

                    SizedBox(height: 20.h),

                     Text(
                      "ফোন নম্বর দিন",
                      style: Theme.of(context).textTheme.titleLarge
                    ),

                     SizedBox(height: 15.h),

                     Text(
                      "আপনার নম্বরে একটি যাচাই কোড পাঠানো হবে", maxLines: 2,
                      style: Theme.of(context).textTheme.titleSmall
                    ),

                    SizedBox(height: 40.h),

                    PhoneCountryPicker(controller: _phoneControler),

                    SizedBox(height: 50.h),

                    SubmitButton(text: 'কোড পাঠাও', buttonOnTap: 
                       () {
                       if(_validatePhoneNumber()) {
                         
                         if(mounted) {
                          circularCustomDialog(context);
                         }
                          
                         Future.delayed(Duration(seconds: 3), () {
                          // ignore: use_build_context_synchronously
                          Navigator.push(context, MaterialPageRoute(
                            builder: (_)=> OtpVerificationPage(
                              phoneNumber: _phoneControler.text)));
                         });
                       }

                      

                    },)
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

   bool _validatePhoneNumber() {
    final String? message = Validatior.validNumberCheck(
      value: _phoneControler.text.trim(),
      nullNumberError: "Phone Number is Required",
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
       return false;
    }
     return true;
    
  }

  @override
  void dispose() {
    _phoneControler.dispose();
    super.dispose();
  }
}
