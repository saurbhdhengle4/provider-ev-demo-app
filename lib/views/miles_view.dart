import 'package:evdemoapp/custom_widgets/blance_card.dart';
import 'package:evdemoapp/providers/tr_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MilesView extends StatelessWidget {
  const MilesView({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionProvider>(context).transactions;

    return Column(
      children: [
        BalanceCard(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transactions",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  height: 1.5,
                  letterSpacing: 0.2,
                ),
              ),
              Text(
               "See All",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.7,
                  letterSpacing: 0.3,
                  color: Color(0xFF1355FF)
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(20),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            transaction.status,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              height: 1.5,
                              letterSpacing: 0.2,
                            ),
                          ),
                          Text(
                            transaction.amount,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              height: 1.7,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            transaction.dateTime,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              height: 1.5,
                              letterSpacing: 0.2,
                              color: Color(0xFF98A2B3),
                            ),
                          ),
                          Text(
                            transaction.kW,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              height: 1.5,
                              letterSpacing: 0.2,
                              color: Color(0xFF98A2B3),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
