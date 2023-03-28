import 'package:flutter/material.dart';
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
      body: FutureBuilder<List<CreateHistoryModal>>(
          future: _databaseConnectionService.getItem(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("length ${snapshot.data!.length}");
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = snapshot.data![index];
                  return Center(
                    child: Text(item.longLink),
                  );
                },
                // child:
              );
            }
            return Center(
              child: Text("test"),
            );
          }),
    );
  }
}
