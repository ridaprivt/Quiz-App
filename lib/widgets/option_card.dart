import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OptionCard extends StatelessWidget {
  final String optionText;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.optionText,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(2.h),
          splashColor: const Color.fromRGBO(33, 150, 243, 1).withOpacity(0.2),
          child: AnimatedContainer(
            width: 80.w,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromARGB(255, 118, 32, 133)
                  : Colors.black,
              borderRadius: BorderRadius.circular(2.h),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
              border: Border.all(
                color: isSelected
                    ? const Color.fromARGB(255, 118, 32, 133)
                    : const Color.fromARGB(255, 69, 18, 78),
                width: 2,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
            child: Center(
              child: Text(
                optionText,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
