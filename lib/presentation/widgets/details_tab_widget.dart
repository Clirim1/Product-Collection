import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class DetailsTabWidget extends StatelessWidget {
  DetailsTabWidget({super.key});

  final List<String> detailsTexts = [
    "Distillery",
    "Region",
    "Country",
    "Type",
    "Age statement",
    "Filled",
    "Bottled",
    "Cask number",
    "ABV",
    "Size",
    "Finish",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: detailsTexts.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 22),
          child: Row(
            children: [
              Text(
                detailsTexts[index],
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),

              Text(
                "Test",
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFFB8BDBF),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
