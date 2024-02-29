import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color bgColor;
  final Widget? icon;
  const CustomButton({super.key, required this.text, required this.onPressed, this.bgColor = Colors.black, this.icon});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ), 
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(icon != null)
                icon!,
              if(icon != null)
                const SizedBox(width: 10,),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}