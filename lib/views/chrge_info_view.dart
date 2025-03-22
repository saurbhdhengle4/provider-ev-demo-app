import 'package:evdemoapp/custom_widgets/button_widget.dart';
import 'package:evdemoapp/custom_widgets/images_widget.dart';
import 'package:evdemoapp/custom_widgets/status_widget.dart';
import 'package:evdemoapp/model/charging_stations.dart';
import 'package:evdemoapp/providers/change_provider.dart';
import 'package:evdemoapp/providers/them_provider.dart';
import 'package:evdemoapp/views/start_charging_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChargeInfoScreen extends StatelessWidget {
  final ChargingStation station;

  const ChargeInfoScreen({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final chargeProvider = Provider.of<ChargeInfoProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          onPressed: () {
            if (chargeProvider.isChargeHere == true) {
              chargeProvider.toggleStartStopsset();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StartChargingView(station: station),
                ),
              );
            }
            chargeProvider.toggleStart();
          },
          text: chargeProvider.isChargeHere == false
              ? "Charge here"
              : "Start Charging",
          isIconShow: false,
        ),
      ),
      appBar: AppBar(
        backgroundColor: themeProvider.backgroundColor,
        centerTitle: true,
        title: Text(
          station.chargeId,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            height: 1.5,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: double.infinity,
                child: Image.asset(
                  "assets/Img (2).png",
                  fit: BoxFit.fitWidth,
                )),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(station.name,
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        height: 1.5,
                        letterSpacing: 0)),
                Visibility(
                    visible: chargeProvider.isChargeHere == false,
                    child:
                        Icon(Icons.bookmark_outline, color: Color(0xFF98A2B3)))
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: themeProvider.isDarkMode
                      ? Color(0xFFEAECF0)
                      : Colors.black45,
                  size: 16,
                ),
                Text(
                  " ${station.address} • ${station.distance} km",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.65,
                    letterSpacing: 0.2,
                    color: themeProvider.isDarkMode
                        ? Color(0xFFEAECF0)
                        : Colors.black45,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Visibility(
              visible: chargeProvider.isChargeHere == false,
              child: Row(
                children: [
                  Icon(
                    Icons.schedule_outlined,
                    color: themeProvider.isDarkMode
                        ? Color(0xFFEAECF0)
                        : Colors.black45,
                    size: 16,
                  ),
                  Text(
                    " Open • 24 hours",
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.65,
                      letterSpacing: 0.2,
                      color: themeProvider.isDarkMode
                          ? Color(0xFFEAECF0)
                          : Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
                visible: chargeProvider.isChargeHere == false,
                child: SizedBox(height: 10)),
            Row(
              children: [
                CustomImageWidget(
                  imagePath: 'assets/Vector (1).svg',
                  color: themeProvider.isDarkMode
                      ? Color(0xFFEAECF0)
                      : Colors.black45,
                ),
                Text(
                  " ${station.type} • ${station.power}kW  ",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.65,
                    letterSpacing: 0.2,
                    color: themeProvider.isDarkMode
                        ? Color(0xFFEAECF0)
                        : Colors.black45,
                  ),
                ),
                StatusWidget(
                  status: station.status,
                  color: Color(0xFFFFDF6E),
                ),
              ],
            ),
            SizedBox(height: 10),
            Visibility(
              visible: chargeProvider.isChargeHere == false,
              child: Text(
                "€ ${station.pricePerHour}/hour",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  height: 1.5,
                  letterSpacing: 0,
                ),
              ),
            ),
            Visibility(
                visible: chargeProvider.isChargeHere == false,
                child: SizedBox(height: 10)),
            Divider(color: Color(0xFF344054)),
            SizedBox(height: 10),
            Text(
              "My Stats",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                height: 1.5,
                letterSpacing: 0,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [
                  textWidget(themeProvider, " 0 Sessions", "Sessions"),
                  SizedBox(width: 20),
                  textWidget(themeProvider, " 0.0 kWh", "Used"),
                ],
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
