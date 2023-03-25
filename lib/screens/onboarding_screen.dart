import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_url_shortener/config/routes.dart';
import 'package:flutter_url_shortener/utils/extensions.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 358,
              height: 198,
              decoration: BoxDecoration(
                color: Color(0xFFB03BA6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: SvgPicture.asset(
                "assets/icons/urlIcon.svg",
                width: 108,
                height: 56,
                fit: BoxFit.scaleDown,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sharp Sharp-URL",
                  style: TextStyle(
                    color: Color(0xFF0F1242),
                    fontSize: 40,
                    fontFamily: 'poppins_bold',
                  ),
                ),
                Text(
                  "Kissi List",
                  style: TextStyle(
                    color: Color(0xFF0F1242),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins_regular',
                  ),
                ),
                const SizedBox(
                  height: 72,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      Routes.home,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB03BA6),
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "LFG",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'poppins_regular',
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ).addPadding(),
    );
  }
}
