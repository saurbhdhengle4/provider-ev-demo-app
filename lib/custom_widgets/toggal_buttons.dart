import 'package:evdemoapp/providers/them_provider.dart';
import 'package:evdemoapp/providers/toggal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Center(
      child: Consumer<ToggleProvider>(
        builder: (context, provider, child) {
          return Container(
            // width: 327,
            margin: EdgeInsets.all(20),
            height: 50,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: themeProvider.containerColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF111827).withOpacity(0.08),
                  spreadRadius: 1,
                  blurRadius: 12,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                _buildToggleButton(
                  context,
                  title: "Club Sessions",
                  isSelected: provider.isClubSelected,
                  onTap: () => provider.selectClub(),
                  themeProvider: themeProvider,
                ),
                _buildToggleButton(
                  context,
                  title: "Guest Sessions",
                  isSelected: !provider.isClubSelected,
                  onTap: () => provider.selectGuest(),
                  themeProvider: themeProvider,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildToggleButton(BuildContext context,
      {required String title,
      required bool isSelected,
      required VoidCallback onTap,
      required ThemeProvider themeProvider}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? themeProvider.isDarkMode
                    ? Colors.white.withOpacity(0.1)
                    : Colors.grey.shade200
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected
                  ? themeProvider.isDarkMode
                      ? Colors.white
                      : Colors.black
                  : !themeProvider.isDarkMode
                      ? Colors.black
                      : Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
