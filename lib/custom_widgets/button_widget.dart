import 'package:evdemoapp/providers/them_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.isIconShow,
      this.icon});
  final Function() onPressed;
  final String text;
  final bool isIconShow;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialButton(
      onPressed: onPressed,
      color: themeProvider.isDarkMode ? Colors.white : Color(0xFF4772F5),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: isIconShow == true,
              child: Icon(icon ?? Icons.add_circle_outline,
                  color: !themeProvider.isDarkMode
                      ? Colors.white
                      : Color(0xFF061237)),
            ),
            Text(
              " $text",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                height: 1.6,
                letterSpacing: 0.2,
                color: !themeProvider.isDarkMode
                    ? Colors.white
                    : Color(0xFF061237),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.isIconShow,
      this.icon});
  final Function() onPressed;
  final String text;
  final bool isIconShow;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final borderColor = themeProvider.isDarkMode
        ? Colors.white
        : Colors.black;

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Color(0xFF344054), width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: isIconShow,
            child: Icon(icon ?? Icons.add_circle_outline, color: borderColor),
          ),
          Text(
            " $text",
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              height: 1.6,
              letterSpacing: 0.2,
              color: borderColor,
            ),
          )
        ],
      ),
    );
  }
}
