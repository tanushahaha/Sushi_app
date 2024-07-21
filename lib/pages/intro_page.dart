import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff8A3637),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child:
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
          
            //shop name
            Text(
              "SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
              fontSize: 30.0,
              letterSpacing: 3.0,
              color: Colors.white,
            ),
            ),
          
            const SizedBox(height: 25),
          
            //icon
            Padding(
              padding: EdgeInsets.all(50.0),
            child: Image.asset('lib/images/sushii.png'),
            ),
          
            //title
            Text(
                "THE TASTE OF JAPANESE FOOD",
              style: GoogleFonts.dmSerifDisplay(
              fontSize: 36.0,
              letterSpacing: 3.0,
              color: Colors.white,
            ),
            ),
            const SizedBox(height: 10),
            //subtitle
            Text("Feel the taste of the most popular japanese food anytime & anywhere",
                style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                height: 2.0,
            )),
            const SizedBox(height: 10),
            //GetStartedButton
            MyButton(
                text: "Get Started",
              onTap: ()
              {
                //go to menu page
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
                ),
        ),
      )
    );
  }
}
