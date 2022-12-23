import 'package:flutter/material.dart';
import 'package:goodtrips/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
          fit: BoxFit.cover,
          opacity: 0.7,
        )
      ),
      child: Material(
        color: Colors.transparent,
        child: SafeArea(
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enjoy',style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5
                  ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text('the world',
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5,
                  ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text('Spatii accelerares, tanquam salvus armarium.Fish soup is just not the same without green curry and crusted delicious steaks.The karma realizes.Onus fortis deus est.',
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 16,
                    letterSpacing: 1.2,
                  ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  HomePage(),
                      ));
                    },
                    child: Ink(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: const Icon(Icons.arrow_forward_ios,color: Colors.black54,
                      size: 20,),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
