import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trash_squad/bloc/schedule_bloc.dart';
import 'package:trash_squad/controllers/schedule_controller.dart';
import 'package:trash_squad/screens/history.dart';
import 'package:trash_squad/screens/main_screen.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({super.key});

  @override
  _ScheduleWidgetState createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final TextEditingController timePicker = TextEditingController();
  final TextEditingController _wasteTypesController = TextEditingController();
  final TextEditingController _estimatesController = TextEditingController();
  final ScheduleController _scheduleController = ScheduleController();
  final TextEditingController _selectedDateController = TextEditingController();
  final List<Map<String, String>> wasteTypes = [
    {"name": "Plastic", "image": "assets/images/plastic.png"},
    {"name": "Metal", "image": "assets/images/metal.png"},
    {"name": "Paper", "image": "assets/images/paper.png"},
    {"name": "Glass", "image": "assets/images/glass.png"},
    {"name": "Electricity", "image": "assets/images/electricity.png"},
  ];

  Set<String> selectedWasteTypes = {};

  void _toggleWasteType(String wasteType) {
    setState(() {
      if (selectedWasteTypes.contains(wasteType)) {
        selectedWasteTypes.remove(wasteType);
      } else {
        selectedWasteTypes.add(wasteType);
      }
    });
    _wasteTypesController.text = selectedWasteTypes.join(", ");
  }

  void _schedule() async {
    final String date = _selectedDateController.text.trim();
    final String wasteTypes = _wasteTypesController.text.trim();
    final String estimate = _estimatesController.text.trim();

    if (date.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a date'),
          backgroundColor: Color(0xFFFF0000),
        ),
      );
      return;
    }

    if (wasteTypes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select at least one waste type'),
          backgroundColor: Color(0xFFFF0000),
        ),
      );
      return;
    }

    if (estimate.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter an estimated quantity'),
          backgroundColor: Color(0xFFFF0000),
        ),
      );
      return;
    }
    DateTime selectedDate = DateFormat('yyyy-MM-dd').parse(date);
    String formattedDate = DateFormat(
      'yyyy-MM-dd HH:mm:ss.SSS',
    ).format(selectedDate);

    final scheduleBloc = BlocProvider.of<ScheduleBloc>(context);

    print("Date: $formattedDate");
    print("Waste Types: $wasteTypes");
    print("Estimate: $estimate");

    final schedule = await _scheduleController.pickupSchedule(
      formattedDate,
      wasteTypes,
      estimate,
      scheduleBloc,
    );

    if (schedule != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HistoryWidget()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pickup schedule created successfully'),
          backgroundColor: Color(0xFF086C74),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pickup schedule failed'),
          backgroundColor: Color(0xFFFF0000),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
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
              margin: EdgeInsets.symmetric(horizontal: 25),
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

                  // Update the text controller
                  _selectedDateController.text = DateFormat(
                    'yyyy-MM-dd',
                  ).format(selectedDay);
                },
                calendarFormat: CalendarFormat.month,
                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                    color: Color(0xFF086C74),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  formatButtonVisible: false,
                ),

                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.teal),
                  weekendStyle: TextStyle(color: Colors.teal),
                ),
                calendarStyle: CalendarStyle(
                  defaultTextStyle: TextStyle(
                    color: Color(0xFF086C74),
                  ),
                  weekendTextStyle: TextStyle(
                    color: Color(0xFF086C74),
                  ),
                  selectedTextStyle: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  todayTextStyle: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
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
                  prefixIcon: Icon(Icons.access_time, color: Color(0xFF086C74)),
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
                    borderSide: BorderSide(color: Color(0xFF086C74), width: 2),
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
              margin: EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    wasteTypes.map((waste) {
                      final isSelected = selectedWasteTypes.contains(
                        waste["name"]!,
                      );
                      return GestureDetector(
                        onTap: () => _toggleWasteType(waste["name"]!),
                        child: Card(
                          color:
                              isSelected ? Colors.green.shade200 : Colors.white,
                          child: Container(
                            margin: EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 90,
                                  child: Image.asset(waste["image"]!),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  waste["name"]!,
                                  style: TextStyle(
                                    color:
                                        isSelected
                                            ? Colors.green
                                            : Color(0xFF5BB59B),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                "Quantity Estimation",
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
                controller: _estimatesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.analytics_outlined,
                    color: Color(0xFF086C74),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  contentPadding: EdgeInsets.all(18),
                  hintText: "Kg",
                  hintStyle: TextStyle(
                    color: const Color(0xFF5BB59B),
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF086C74), width: 2),
                  ),
                ),
                onTap: () {},
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 200,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: _schedule,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5BB59B),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        minimumSize: Size(465, 65),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Schedule Pickup",
                        style: TextStyle(fontSize: 18),
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

  AppBar _appBar(BuildContext context) {
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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0xFF086C74),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            },
          ),
        ),
      ),
    );
  }
}
