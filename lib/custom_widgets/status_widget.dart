import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key, required this.status, required this.color});
  final String status;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: status == "Available" ? Color(0xFF69E199) : color),
      child: Text(
        status,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          height: 1.0,
          letterSpacing: 0,
          color: Color(0xFF061237),
        ),
      ),
    );
  }
}
