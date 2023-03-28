import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_url_shortener/models/create_history_modal.dart';
import 'package:flutter_url_shortener/services/database_connection_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late DatabaseConnectionService _databaseConnectionService;

  @override
  void initState() {
    super.initState();
    _databaseConnectionService = DatabaseConnectionService();
    _databaseConnectionService.initialiseDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF892E82),
          ),
          onPressed: () {},
        ),
        title: const Text(
          "You are looking at your old link",
          style: TextStyle(
            color: Color(0xFF6C6F93),
            fontSize: 14,
          ),
          textAlign: TextAlign.right,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 38,
          horizontal: 16,
        ),
        child: FutureBuilder<List<CreateHistoryModal>>(
            future: _databaseConnectionService.getItem(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = snapshot.data![index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Link",
                                    style: TextStyle(
                                      color: Color(0xFF1D1E30),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item.longLink,
                                    style: const TextStyle(
                                      color: Color(0xFF47496B),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  FlutterClipboard.copy(item.longLink);
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/copyIcon.svg",
                                  color: Colors.black,
                                  width: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              color: const Color(0xFFCFD0E2),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Shorten Link",
                                    style: TextStyle(
                                      color: Color(0xFF1D1E30),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  // Text(
                                  //   item.shortLink,
                                  //   style: const TextStyle(
                                  //     color: Color(0xFF47496B),
                                  //     fontSize: 16,
                                  //   ),
                                  // ),
                                ],
                              ),
                              // ! Add logic
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  // FlutterClipboard.copy(item.shortLink);
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/copyIcon.svg",
                                  color: Colors.black,
                                  width: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 8,
                            bottom: 40,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          decoration: const BoxDecoration(
                            color: Color(0xFFCFD0E2),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
              return const Center(
                child: Text("test"),
              );
            }),
      ),
    );
  }
}
