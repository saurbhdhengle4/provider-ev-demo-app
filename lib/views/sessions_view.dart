import 'package:evdemoapp/custom_widgets/toggal_buttons.dart';
import 'package:evdemoapp/providers/toggal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionsView extends StatelessWidget {
  const SessionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleScreen(),
        Expanded(
          child: Consumer<ToggleProvider>(builder: (context, provider, child) {
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              itemCount: provider.isClubSelected
                  ? provider.sessions.length
                  : provider.sessionsNew.length,
              itemBuilder: (context, index) {
                var sessions = provider.isClubSelected
                    ? provider.sessions[index]
                    : provider.sessionsNew[index];
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(sessions.location),
                            Text(sessions.power),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(sessions.duration),
                            Text(sessions.time),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
