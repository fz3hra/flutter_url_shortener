import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_url_shortener/config/routes.dart';
import 'package:flutter_url_shortener/controllers/bottom_sheet_controller.dart';
import 'package:flutter_url_shortener/models/create_history_modal.dart';
import 'package:flutter_url_shortener/models/link_model.dart';
import 'package:flutter_url_shortener/repository/create_link_repository.dart';
import 'package:flutter_url_shortener/services/database_connection_service.dart';
import 'package:flutter_url_shortener/utils/extensions.dart';
import 'package:flutter_url_shortener/widgets/copy_link_widget.dart';
import 'package:flutter_url_shortener/widgets/customized_text_widget.dart';

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
  TextEditingController pasteController = TextEditingController();
  TextEditingController customizedController = TextEditingController();
  String pastedText = '';

  late DatabaseConnectionService _databaseConnectionService;

  @override
  void initState() {
    super.initState();
    _databaseConnectionService = DatabaseConnectionService();
    _databaseConnectionService.initialiseDatabase();
  }

  void insert(id, linkName, longLink) async {
    final row = {
      _databaseConnectionService.createItem(
        CreateHistoryModal(
          id: id,
          linkName: linkName,
          longLink: longLink,
          // shortLink: shortLink,
        ),
      ),
    };
    debugPrint("row $row");
  }

  @override
  Widget build(BuildContext context) {
    Future<dynamic> launchUrl(url) async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch URL');
      }
    }

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
                    onPressed: () => Navigator.pushNamed(
                      context,
                      Routes.history,
                    ),
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
                    onPressed: () {
                      setState(() {
                        pasteController.clear();
                        customizedController.clear();
                      });
                    },
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
                controller: pasteController,
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
                controller: customizedController,
                onSubmitted: (customize) {
                  setState(() {
                    controllerCustomize = customize;
                  });
                  // ! TODO remove comment:
                  link = CreateLinkRepository.createShortLink(pastedText);
                  // insert(2, controllerCustomize, pastedText, link);
// TODO: add link
                  insert(
                    2,
                    controllerCustomize,
                    pastedText,
                  );
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
                    var link = snapshot.data!.link;
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () => BottomSheetController.showSheet(
                            context,
                            Column(
                              children: [
                                const Text(
                                  "You just clicked on the link ohh",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'poppins_semi_bold',
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomizedTextWidget(
                                  controllerCustomize: controllerCustomize,
                                  fontSize: 16,
                                  fontFamily: 'poppins_regular',
                                ),
                                const SizedBox(
                                  height: 72,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 136,
                                      height: 48,
                                      child: CopyLinkWidget(
                                        link: link,
                                      ),
                                    ),
                                    Container(
                                      width: 136,
                                      height: 48,
                                      child: ElevatedButton(
                                        onPressed: () => Navigator.pushNamed(
                                          context,
                                          Routes.webview,
                                          arguments: {
                                            "pastedText": pastedText,
                                          },
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor:
                                              const Color(0xFFB03BA6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                        ),
                                        child: const Text(
                                          "Open Page",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          child: Center(
                            child: CustomizedTextWidget(
                              controllerCustomize: controllerCustomize,
                              fontSize: 20,
                              fontFamily: 'poppins_semi_bold',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 56,
                        ),
                        CopyLinkWidget(
                          link: link,
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
