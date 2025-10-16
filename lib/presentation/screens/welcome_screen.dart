import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixelfield_flutter/presentation/widgets/background_container.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackgroundContainer(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                color: Color(0x80122329),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Welcome!", style: TextStyle(fontSize: 32)),
                    SizedBox(height: 8),
                    Text("Text text text", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0XFFD49A00),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Scan bottle",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an account?",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () => GoRouter.of(context).push('/login'),
                          child: Text(
                            "Sign in first",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0XFFFFB901),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
