import 'package:flutter/material.dart';
import 'package:trash_squad/screens/history.dart';
import 'package:trash_squad/screens/reward.dart';

class ScheduleandRedeem extends StatelessWidget {
  const ScheduleandRedeem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HistoryWidget()),
                  );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0F5ED), // Mint green
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: const Color(0xFF0F766E), // Teal 700
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 32,
                          color: const Color(0xFF0F766E),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Schedule',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF0F766E),
                          ),
                        ),
                        Text(
                          'Pickup',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF0F766E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RewardsScreen()),
                  );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0F5ED), // Match the color
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: const Color(0xFF0D9488), // Teal 600
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          size: 32,
                          color: const Color(0xFF0D9488),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Redeems',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF0D9488),
                          ),
                        ),
                        Text(
                          'Points',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF0D9488),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
