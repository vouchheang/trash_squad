import 'package:flutter/material.dart';
import 'package:trash_squad/screens/schedule.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
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
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 216, 215, 215),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                  ),
                ],
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(),
                    child: Icon(
                      Icons.date_range_outlined,
                      color: Color(0xFF086C74),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Monday, June 6, 2025",
                          style: TextStyle(
                            color: Color(0xFF086C74),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "9:00 PM",
                          style: TextStyle(
                            color: Color(0xFF5BB59B),
                            fontWeight: FontWeight.w100,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Plastic",
                          style: TextStyle(
                            color: Color(0xFF5BB59B),
                            fontWeight: FontWeight.w200,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 120,
                    height: 45,
                    decoration: BoxDecoration(),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.restore_from_trash_outlined, color: Colors.white,),
                      label: Text("Cancel", style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 0, 0),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 216, 215, 215),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                  ),
                ],
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(),
                    child: Icon(
                      Icons.date_range_outlined,
                      color: Color(0xFF086C74),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Monday, June 6, 2025",
                          style: TextStyle(
                            color: Color(0xFF086C74),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "9:00 PM",
                          style: TextStyle(
                            color: Color(0xFF5BB59B),
                            fontWeight: FontWeight.w100,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Plastic",
                          style: TextStyle(
                            color: Color(0xFF5BB59B),
                            fontWeight: FontWeight.w200,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 120,
                    height: 45,
                    decoration: BoxDecoration(),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.restore_from_trash_outlined, color: Colors.white,),
                      label: Text("Cancel", style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 0, 0),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

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
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 216, 215, 215),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                  ),
                ],
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(),
                    child: Icon(
                      Icons.date_range_outlined,
                      color: Color(0xFF086C74),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Monday, June 6, 2025",
                          style: TextStyle(
                            color: Color(0xFF086C74),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "9:00 PM",
                          style: TextStyle(
                            color: Color(0xFF5BB59B),
                            fontWeight: FontWeight.w100,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Plastic",
                          style: TextStyle(
                            color: Color(0xFF5BB59B),
                            fontWeight: FontWeight.w200,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 120,
                    height: 45,
                    decoration: BoxDecoration(),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.download_done_rounded, color: Colors.white),
                      label: Text("Done", style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5BB59B),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 216, 215, 215),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                  ),
                ],
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(),
                    child: Icon(
                      Icons.date_range_outlined,
                      color: Color(0xFF086C74),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Monday, June 6, 2025",
                          style: TextStyle(
                            color: Color(0xFF086C74),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "9:00 PM",
                          style: TextStyle(
                            color: Color(0xFF5BB59B),
                            fontWeight: FontWeight.w100,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Plastic",
                          style: TextStyle(
                            color: Color(0xFF5BB59B),
                            fontWeight: FontWeight.w200,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 120,
                    height: 45,
                    decoration: BoxDecoration(),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.download_done_rounded, color: Colors.white),
                      label: Text("Done", style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5BB59B),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
                MaterialPageRoute(
                  builder: (context) => ScheduleWidget(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
