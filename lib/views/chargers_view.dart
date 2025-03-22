import 'package:evdemoapp/custom_widgets/button_widget.dart';
import 'package:evdemoapp/custom_widgets/status_widget.dart';
import 'package:evdemoapp/providers/change_provider.dart';
import 'package:evdemoapp/providers/charging_provider.dart';
import 'package:evdemoapp/providers/them_provider.dart';
import 'package:evdemoapp/views/chrge_info_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChargersView extends StatelessWidget {
  const ChargersView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final chargeProvider = Provider.of<ChargeInfoProvider>(context);

    return Consumer<ChargingStationProvider>(
        builder: (context, provider, child) {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              itemCount: provider.stations.length,
              itemBuilder: (context, index) {
                var stations = provider.stations[index];
                return InkWell(
                  onTap: () {
                    chargeProvider.toggleUpdate();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChargeInfoScreen(station: stations),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: themeProvider.containerColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(stations.image),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        stations.name,
                                        style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          height: 1.5,
                                          letterSpacing: 0,
                                        ),
                                      )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.settings_outlined,
                                            color: themeProvider.isDarkMode
                                                ? Color(0xFF98A2B3)
                                                : Colors.black,
                                          ))
                                    ],
                                  ),
                                  Text(
                                    stations.address,
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.7,
                                      letterSpacing: 0.3,
                                      color: Color(0xFF8E94A4),
                                    ),
                                  ),
                                  Text(
                                    "€ ${stations.pricePerHour}/hour",
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 1.65,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${stations.type} • ${stations.power}kW",
                                        style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          height: 1.7,
                                          letterSpacing: 0.3,
                                          color: Color(0xFF8E94A4),
                                        ),
                                      ),
                                      StatusWidget(
                                        status: stations.status,
                                        color: Color(0xFFFFDF6E),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: CustomButton(
              onPressed: () {},
              text: "Add New Charger",
              isIconShow: true,
            ),
          )
        ],
      );
    });
  }
}
