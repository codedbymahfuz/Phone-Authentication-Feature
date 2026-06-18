import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:phone_auth/core/constants/appcolors.dart';

class PhoneCountryPicker extends StatefulWidget {
  final TextEditingController? controller;
  const PhoneCountryPicker({super.key, this.controller});

  @override
  State<PhoneCountryPicker> createState() => _PhoneCountryPickerState();
}

class _PhoneCountryPickerState extends State<PhoneCountryPicker> {
  Country selectedCountry = Country(
    phoneCode: "880",
    countryCode: "BD",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Bangladesh",
    example: "1712345678",
    displayName: "Bangladesh",
    displayNameNoCountryCode: "Bangladesh",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 56.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColors.whiteColur,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: AppColors.blueColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    onSelect: (Country country) {
                      setState(() {
                        selectedCountry = country;
                      });
                    },
                  );
                },
                child: Text(
                  '${selectedCountry.flagEmoji}  +${selectedCountry.phoneCode}',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(width: 12.w),
      
            Container(width: 1, height: 40.h, color: AppColors.greyColor),
             SizedBox(width: 12.w),
      
            Expanded(
              flex: 2,
              child: TextFormField(
                controller: widget.controller,
                
                style: TextStyle(
                  fontSize: 16.sp,
                  letterSpacing: 1.5
                ),
                
                keyboardType: TextInputType.phone,
               
                maxLength: 11, 
                
              
                decoration: InputDecoration(
                  
                  hintText: "Phone Number",
                  
                  counterText: "",
                  border: InputBorder.none,
                  errorBorder: InputBorder.none
                  ),

                  validator: (value) => null,
              ),
            ),
          ],
        ),
      );
   
  }
}
