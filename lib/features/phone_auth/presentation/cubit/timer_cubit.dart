import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';


class TimerCubit extends Cubit<int> {
   
   TimerCubit() : super (30);

   Timer? _timer;

   void startTimer () {

     emit(30);
    
     _timer?.cancel();

     _timer = Timer.periodic(

      Duration(seconds: 1), (timer) {
        
         if(state >0) {
           emit(state -1);
         } 
           else{
            timer.cancel();
           } 
      });


   }
    
    bool get isExpired => state == 0;

    @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}