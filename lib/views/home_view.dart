import 'package:evdemoapp/custom_widgets/images_widget.dart';
import 'package:evdemoapp/custom_widgets/status_widget.dart';
import 'package:evdemoapp/providers/them_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: themeProvider.containerColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hôtel de Ville',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        height: 1.5,
                        letterSpacing: 0,
                      ),
                    ),
                    Icon(Icons.settings_outlined, color: Color(0xFF98A2B3)),
                  ],
                ),
                Text(
                  "Pl. de l'Hôtel de Ville, Paris • 1.4 km",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 1.7,
                      letterSpacing: 0.3,
                      color: Color(0xFF8E94A4)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Type 2 • 30kW',
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.65,
                          letterSpacing: 0.2,
                          color: themeProvider.isDarkMode
                              ? Color(0xFFEAECF0)
                              : Colors.black45),
                    ),
                    StatusWidget(
                      status: "Charging",
                      color: Color(0xFFFFDF6E),
                    ),
                  ],
                ),
              ],
            )),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              textWidget(themeProvider, "53", "Sessions"),
              SizedBox(width: 20),
              textWidget(themeProvider, "12 Kg", "Co2 Saved"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              textWidgetIcon(themeProvider, "20", "Charge Miles"),
              SizedBox(width: 20),
              textWidget(themeProvider, " € 120", "Earnings"),
            ],
          ),
        )
      ],
    );
  }

  Expanded textWidgetIcon(
      ThemeProvider themeProvider, String text1, String text2) {
    return Expanded(
      child: Container(
        // margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: themeProvider.containerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomImageWidget(
                  imagePath: 'assets/Frame 37611.svg',
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
                Text(
                  " $text1",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    height: 1.5,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              text2,
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.65,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded textWidget(ThemeProvider themeProvider, String text1, String text2) {
    return Expanded(
      child: Container(
        // margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: themeProvider.containerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                height: 1.5,
                letterSpacing: 0,
              ),
            ),
            SizedBox(height: 20),
            Text(
              text2,
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.65,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
