import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool loading;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const BottomButton({
    Key? key,
    this.onTap,
    this.loading = false,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.maxFinite,
        height: 68,
        child: ElevatedButton(
          onPressed: onTap,
          child: loading
              ? CircularProgressIndicator(color: textColor)
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 17,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.41,
                    height: 1.1,
                  ),
                ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(43)),
            ),
            elevation: MaterialStateProperty.all<double>(0),
          ),
        ),
      ),
    );
  }
}
