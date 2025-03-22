import 'package:evdemoapp/providers/them_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF4772F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "€158.00",
                  style: GoogleFonts.workSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Available to spend",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.7,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Earnings this month",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.7,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "€156.00",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    height: 1.5,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: 10, top: 10, child: Image.asset("assets/Group 2.png")),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              // height: 5,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: themeProvider.containerColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black12,width: 5)
              ),
              child:Text(
                  "Request Transfer",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    height: 1.5,
                    letterSpacing: 0.2,
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
