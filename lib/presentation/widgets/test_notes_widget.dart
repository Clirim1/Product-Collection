import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestNotesWidget extends StatelessWidget {
  TestNotesWidget({super.key});

  final List<String> testNotesTitle = ['Nose', 'Palate', 'Finish'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tasting notes',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5),
        Text(
          'by Charles MacLean MBE',
          style: GoogleFonts.lato(fontSize: 16, color: Color(0XFFB8BDBF)),
        ),
        SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return testNotesBodyWidget(index);
          },
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Text('Your notes', style: TextStyle(fontSize: 22)),
              Spacer(),
              Icon(Icons.arrow_back),
            ],
          ),
        ),

        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return testNotesBodyWidget(index);
          },
        ),
      ],
    );
  }

  Widget testNotesBodyWidget(int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.only(bottom: 8),
      width: double.infinity,
      color: Color(0XFF0E1C21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            testNotesTitle[index],
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Text(
                "Description",
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
