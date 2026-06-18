 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:phone_auth/features/phone_auth/presentation/cubit/timer_cubit.dart';
import 'package:phone_auth/features/phone_auth/presentation/page/phone_number_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
       designSize: const Size(360, 800),
       minTextAdapt: true,
       splitScreenMode: true,
       builder: (context, child) {
         return MultiBlocProvider(
          providers: [
           BlocProvider(create: (context)=> TimerCubit()),
          ],
           child: MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 18.sp, 
            fontWeight: FontWeight.bold
          ),
           titleSmall: TextStyle(
            fontSize: 14.sp,
            overflow: TextOverflow.ellipsis,
            
           ),
        ),
         
       ),
      home: PhoneNumberPage(),
    ));
       },
    );
  }
}