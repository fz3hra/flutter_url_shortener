import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_url_shortener/models/link_model.dart';
import 'package:flutter_url_shortener/repository/create_link_repository.dart';
import 'package:flutter_url_shortener/utils/extensions.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Link>? link;
  bool isTapped = false;
  String controllerValue = '';
  String controllerCustomize = '';
  TextEditingController controller = TextEditingController();
  String pastedText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFFF5E0F3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/drawer.svg"),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "History",
                          style: TextStyle(
                            color: Color(0xFF892E82),
                            fontSize: 14,
                            fontFamily: 'poppins_regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFF4750D5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: const Text(
                      "New",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'poppins_regular',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "omo we know say time no dey, just paste and copy my g.",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins_regular',
                ),
              ),
              const SizedBox(
                height: 56,
              ),
              const Text(
                "Paste here",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'poppins_semi_bold',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                // controller: controller,
                onChanged: (val) {
                  setState(() {
                    pastedText = val;
                  });
                },
                onSubmitted: (val) {
                  setState(() {
                    pastedText = val;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Long link goes here',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins_regular',
                    color: Color(0xFF6C6F93),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFCFD0E2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFCFD0E2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Customize your link",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'poppins_semi_bold',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                onSubmitted: (customize) {
                  setState(() {
                    controllerCustomize = customize;
                  });
                  link = CreateLinkRepository.createShortLink(pastedText);
                },
                decoration: const InputDecoration(
                  labelText: 'any name nah name',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins_regular',
                    color: Color(0xFF6C6F93),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFCFD0E2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFCFD0E2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "You can customize your url to have any 7 character you like, including signs and symbols, like a preacher will say.",
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'poppins_regular',
                  color: Color(0xFF6C6F93),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              FutureBuilder<Link>(
                future: link,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isTapped = !isTapped;
                            });
                          },
                          child: Center(
                            child: Text(
                              isTapped == true
                                  ? controllerCustomize
                                  : "Short-URL",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xFF0F1242),
                                fontSize: 20,
                                fontFamily: 'poppins_semi_bold',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 56,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            FlutterClipboard.copy(snapshot.data!.link);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFFF5E0F3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Copy Link"),
                              SvgPicture.asset("assets/icons/copyIcon.svg"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "sharp sharp things 🥺",
                          style: TextStyle(
                            color: Color(0xFF47496B),
                            fontSize: 16,
                            fontFamily: 'poppins_regular',
                          ),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return const Text("has error");
                  }
                  return Column(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          "assets/icons/loading.svg",
                        ),
                      ),
                      const Text(
                        "i dey come make i run am",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'poppins_regular',
                          color: Color(0xFF47496B),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ).addPadding(),
    );
  }
}