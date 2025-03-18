import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScheduleWidgetState createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  TextEditingController timePicker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                "Select Date",
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
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF086C74), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              width: double.infinity,
              height: 400,
              child: TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2100, 12, 31),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarFormat: CalendarFormat.month,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                "Select Time",
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
              child: TextField(
                controller: timePicker,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.access_time,
                    color: Color(0xFF086C74),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  contentPadding: EdgeInsets.all(18),
                  hintText: "Time",
                  hintStyle: TextStyle(
                    color: const Color(0xFF5BB59B),
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFF086C74),
                      width: 2,
                    ),
                  ),
                ),
                onTap: () async {
                  var time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
      
                  if (time != null) {
                    setState(() {
                      timePicker.text = time.format(context);
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                "Waste Type",
                style: TextStyle(
                  color: Color(0xFF086C74),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 90,
                            child: Image.asset("assets/images/plastic.png"),
                          ),
                          SizedBox(height: 10),
                          const Text(
                            "Plastic",
                            style: TextStyle(
                              color: Color(0xFF5BB59B),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 90,
                            child: Image.asset("assets/images/metal.png"),
                          ),
                          SizedBox(height: 10),
                          const Text(
                            "Metal",
                            style: TextStyle(
                              color: Color(0xFF5BB59B),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 90,
                            child: Image.asset("assets/images/paper.png"),
                          ),
                          SizedBox(height: 10),
                          const Text(
                            "Paper",
                            style: TextStyle(
                              color: Color(0xFF5BB59B),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 90,
                            child: Image.asset("assets/images/glass.png"),
                          ),
                          SizedBox(height: 10),
                          const Text(
                            "Glass",
                            style: TextStyle(
                              color: Color(0xFF5BB59B),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 90,
                            child: Image.asset(
                              "assets/images/electricity.png",
                            ),
                          ),
                          SizedBox(height: 10),
                          const Text(
                            "Electricity",
                            style: TextStyle(
                              color: Color(0xFF5BB59B),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5BB59B),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  minimumSize: Size(465, 65)
                ),
                child: Text("schedule Pickup"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("Schedule Pickup"),
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
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF086C74),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.notifications_active_outlined,
              color: Color(0xFF086C74),
            ),
          ),
        ),
      ],
    );
  }
}
