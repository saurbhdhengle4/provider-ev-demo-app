import 'package:evdemoapp/custom_widgets/button_widget.dart';
import 'package:evdemoapp/providers/login_provider.dart';
import 'package:evdemoapp/providers/them_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final signUpProvider = Provider.of<AuthProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: themeProvider.containerColor,
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(signUpProvider.userPhoto),
                      backgroundColor: Colors.grey[200],
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          signUpProvider.userName,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 1.6,
                            letterSpacing: 0.2,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          signUpProvider.userEmail,
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              height: 1.65,
                              letterSpacing: 0.2,
                              color: Color(0xFF667085)),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 8, top: 2, right: 8, bottom: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFF98A2B3)),
                  child: Text(
                    "HOST",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      height: 1.0,
                      letterSpacing: 0,
                      color: Color(0xFF061237),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'General',
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              height: 1.65,
              letterSpacing: 0.2,
              color: Color(0xFF98A2B3),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: themeProvider.containerColor,
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, size: 16),
                        SizedBox(width: 10),
                        Text(
                          "Account Settings",
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 1.65,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFF667085),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.ev_station, size: 16),
                        SizedBox(width: 10),
                        Text(
                          "My Chargers",
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 1.65,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFF667085),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Support',
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              height: 1.65,
              letterSpacing: 0.2,
              color: Color(0xFF98A2B3),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: themeProvider.containerColor,
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.help_outline_rounded, size: 16),
                    SizedBox(width: 10),
                    Text(
                      "Help",
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 1.65,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFF667085),
                ),
              ],
            ),
          ),
          Spacer(),
          CustomButton2(
            isIconShow: true,
            onPressed: () {},
            text: 'Switch to EV User',
            icon: Icons.swap_vert,
          ),
          SizedBox(height: 10),
          CustomButton(
            onPressed: () {
              signUpProvider.signOut(context);
            },
            text: 'Logout',
            isIconShow: true,
            icon: Icons.logout,
          )
        ],
      ),
    );
  }
}
