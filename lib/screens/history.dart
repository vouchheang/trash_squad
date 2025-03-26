import 'package:flutter/material.dart';
import 'package:trash_squad/controllers/delete_history.dart';
import 'package:trash_squad/controllers/history_controller.dart';
import 'package:trash_squad/models/history_model.dart';
import 'package:trash_squad/screens/schedule.dart';
import 'package:trash_squad/utils/date_util.dart';
import 'package:trash_squad/utils/time_util.dart';

class HistoryWidget extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryWidget> {
  final HistoryController _historyController = HistoryController();
  final DeleteHistoryController _deleteHistoryController = DeleteHistoryController();
  late Future<List<History>> _histories;

  @override
  void initState() {
    super.initState();
    _histories = _historyController.fetchHistories();
  }

  Future<void> _cancelPickup(int pickupId) async {
    try {
      await _deleteHistoryController.cancelPickup(pickupId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pickup schedule canceled successfully'),
        backgroundColor: Color(0xFF086C74),),
      );
      _histories;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to cancel pickup: $e'),
        backgroundColor: Color(0xFFFF0000),),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<History>>(
        future: _histories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No active pickups available."));
          } else {
            List<History> histories = snapshot.data!;
            DateTime now = DateTime.now();

            List<History> activePickups =
                histories
                    .where(
                      (history) =>
                          history.datePickup.isAfter(now) ||
                          DateUtil.formatDate(history.datePickup) ==
                              DateUtil.formatDate(now),
                    ) 
                    .take(3)
                    .toList();

            List<History> pastPickups =
                histories
                    .where((history) => history.createdAt.isBefore(now))
                    .toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      "assets/images/Rectangle 23.png",
                      height: 281,
                      width: 271,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 15),

                  if (activePickups.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Active Pickups",
                        style: TextStyle(
                          color: Color(0xFF086C74),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Column(
                      children:
                          activePickups
                              .map(
                                (history) =>
                                    pickupCard(history, isActive: true),
                              )
                              .toList(),
                    ),
                  ],

                  if (pastPickups.isNotEmpty) ...[
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Past Pickups",
                        style: TextStyle(
                          color: Color(0xFF086C74),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: pastPickups.length,
                      itemBuilder: (context, index) {
                        return pickupCard(pastPickups[index], isActive: false);
                      },
                    ),
                  ],
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget pickupCard(History history, {required bool isActive}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 229, 229, 229),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.date_range_outlined, color: Color(0xFF086C74), size: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateUtil.formatDate(history.datePickup),
                style: TextStyle(
                  color: Color(0xFF086C74),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Text(
                TimeUtil.formatDate(history.createdAt),
                style: TextStyle(
                  color: Color(0xFF5BB59B),
                  fontWeight: FontWeight.w100,
                  fontSize: 18,
                ),
              ),
              Text(
                history.wasteTypes,
                style: TextStyle(
                  color: Color(0xFF5BB59B),
                  fontWeight: FontWeight.w200,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          if (isActive)
            ElevatedButton.icon(
              onPressed: () {
                _cancelPickup(history.pickupId);
              },
              icon: Icon(
                Icons.restore_from_trash_outlined,
                color: Colors.white,
              ),
              label: Text("Cancel", style: TextStyle(fontSize: 14)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 0, 0),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            )
          else
            ElevatedButton.icon(
              onPressed: () {
                // Handle done logic here
              },
              icon: Icon(Icons.download_done_outlined, color: Colors.white),
              label: Text("Done", style: TextStyle(fontSize: 14)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5BB59B),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    title: const Text("Pickup History"),
    titleTextStyle: TextStyle(
      color: Color(0xFF086C74),
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF086C74),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScheduleWidget()),
            );
          },
        ),
      ),
    ),
  );
}
