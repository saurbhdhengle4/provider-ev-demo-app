import 'package:evdemoapp/custom_widgets/button_widget.dart';
import 'package:evdemoapp/custom_widgets/images_widget.dart';
import 'package:evdemoapp/model/charging_stations.dart';
import 'package:evdemoapp/providers/change_provider.dart';
import 'package:evdemoapp/providers/them_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartChargingView extends StatelessWidget {
  const StartChargingView({super.key, required this.station});
  final ChargingStation station;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final stopChargeProvider = Provider.of<ChargeInfoProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          onPressed: () {
            stopChargeProvider.toggleStartStops();
          },
          text:
              stopChargeProvider.isStart != true ? "Stop charging" : "Pay Now",
          isIconShow: false,
        ),
      ),
      appBar: AppBar(
        backgroundColor: themeProvider.backgroundColor,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close)),
        title: Text(
          station.chargeId,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            height: 1.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Charging",
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        height: 1.5,
                        letterSpacing: 0,
                      ),
                    ),
                    Image.asset(stopChargeProvider.isStart != true
                        ? "assets/Frame 37538 (2).png"
                        : "assets/Frame 37538 (3).png"),
                    Text(
                      stopChargeProvider.isStart != true
                          ? "0h 0m remain"
                          : "0h 26m 24s remain",
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.65,
                        letterSpacing: 0.2,
                        color: Color(0xFF98A2B3),
                      ),
                    )
                  ],
                ),
                Image.asset("assets/photo (5).png"),
              ],
            ),
            Divider(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        stopChargeProvider.isStart != true ? "00.00" : "08.12",
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: 68,
                      height: 1.3,
                      letterSpacing: -0.5,
                      color: Color(0xFF69E199),
                    ),
                  ),
                  TextSpan(
                    text: "kWh",
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: 38,
                      height: 1.3,
                      letterSpacing: -0.5,
                      color: Color(0xFF69E199),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  station.name,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    height: 1.5,
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  "€ ${station.power}/kWh",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 1.5,
                    letterSpacing: 0,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: themeProvider.isDarkMode
                      ? Color.fromARGB(255, 187, 188, 190)
                      : Colors.black45,
                  size: 20,
                ),
                Text(
                  " ${station.address} • ${station.distance} km",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.65,
                    letterSpacing: 0.2,
                    color: themeProvider.isDarkMode
                        ? Color.fromARGB(255, 187, 188, 190)
                        : Colors.black45,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CustomImageWidget(
                  imagePath: 'assets/Vector (2).svg',
                  color: themeProvider.isDarkMode
                      ? Color(0xFFEAECF0)
                      : Colors.black45,
                ),
                Text(
                  "    CCS2 • ${station.power}kW",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.65,
                    letterSpacing: 0.2,
                    color: themeProvider.isDarkMode
                        ? Color.fromARGB(255, 187, 188, 190)
                        : Colors.black45,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Charging cost",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 1.6,
                    letterSpacing: 0.2,
                  ),
                ),
                Text(
                  stopChargeProvider.isStart != true ? "€00.00" : "€12.48",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 1.6,
                    letterSpacing: 0.2,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Idle Fee",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 1.6,
                    letterSpacing: 0.2,
                  ),
                ),
                Text(
                  "€00.00",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 1.6,
                    letterSpacing: 0.2,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      height: 1.5,
                      letterSpacing: 0,
                    )),
                Text(stopChargeProvider.isStart != true ? "€00.00" : "€12.48",
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      height: 1.5,
                      letterSpacing: 0,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
