import 'package:evdemoapp/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFF020819),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/appnamesvg.svg',
                ),
                SizedBox(height: 20),
                Text(
                  "Sign in",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      height: 1.5,
                      letterSpacing: 0,
                      color: Colors.white),
                ),
                Text(
                  "Enter your registered account to sign in",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.65,
                    color: Color(0xFF667085),
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset(
            "assets/image 5.png",
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      signUpProvider.signIn(context);
                    },
                    child: SvgPicture.asset("assets/google Button.svg")),
                SizedBox(height: 10),
                SvgPicture.asset("assets/Button.svg"),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By starting my application, I agree to El-Monde’s ',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.7,
                    letterSpacing: 0.3,
                    color: Color(0xFF667085),
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms of Service ',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        height: 1.7,
                        letterSpacing: 0.3,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'and ',
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.7,
                          letterSpacing: 0.3,
                          color: Color(0xFF667085)),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        height: 1.7,
                        letterSpacing: 0.3,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
