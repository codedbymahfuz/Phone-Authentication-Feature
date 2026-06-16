import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';


class AnimatedMessage extends StatefulWidget {
  final String? message;
  final Color? color;
  const AnimatedMessage({super.key, required this.message, this.color});

  @override
  State<AnimatedMessage> createState() => _AnimatedMessageState();
}

class _AnimatedMessageState extends State<AnimatedMessage> {
  String errorMessage = "";

  Alignment _errorAlignment = Alignment(0, 1.5);

  Timer? _hideTimer;

  @override
  void didUpdateWidget(covariant AnimatedMessage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.message != null && widget.message!.isNotEmpty) {
      _showSnackBar();
    }
  }

  @override
  void dispose() {
   _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
      alignment: _errorAlignment,
      onEnd: () {
        if(_errorAlignment ==  Alignment(0, 1.5)) {
          setState(() {
            errorMessage = "";
          });
        }
      },
      child: errorMessage.isEmpty
          ? const SizedBox.shrink()
          : Material(
              elevation: 6,
              color: widget.color ?? Colors.red.shade600,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 15.h,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     Icon(Icons.error_outline, color: Colors.white, size: 14.sp,),
                    SizedBox(width: 10.w),
                    Text(
                      errorMessage,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void _showSnackBar() {
    _hideTimer?.cancel();

   // if (widget.message != null) {
      setState(() {
        _errorAlignment = const Alignment(0, 0.8);
        errorMessage = widget.message!;
      });

      _hideTimer = Timer(const Duration(seconds: 3), () {
        if (context.mounted) {
          setState(() {   
        
            _errorAlignment = Alignment(0, 1.5);
          });
        }
      });
    
  }
}
