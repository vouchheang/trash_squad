import 'package:flutter/material.dart';
import 'package:trash_squad/controllers/activity_controller.dart';
import 'package:trash_squad/models/activity_model.dart';
import 'package:trash_squad/screens/main_screen.dart';

class AllActivities extends StatefulWidget {
  const AllActivities({super.key});

  @override
  State<AllActivities> createState() => _AllActivitiesState();
}

class _AllActivitiesState extends State<AllActivities> {
  final ActivityController _activityController = ActivityController();
  late Future<List<Activity>> _activities;

  @override
  void initState() {
    super.initState();
    _activities = _activityController.fetchActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8), // Softer background color
      body: SafeArea(
        child: Column(
          children: [
            // Improved App Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Color(0xFF0D9488),
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    },
                  ),
                  const Spacer(),
                  const Text(
                    'Recent Activity',
                    style: TextStyle(
                      color: Color(0xFF0D9488),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48), // Balancing the back button
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: FutureBuilder<List<Activity>>(
                future: _activities,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF0D9488),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Error: ${snapshot.error}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete_outline,
                            size: 80,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "No activities available",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  } else {
                    List<Activity> activities = snapshot.data!;
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: activities.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ActivityCard(
                            icon: _getIconForActivity(activities[index].title),
                            title: activities[index].title,
                            subtitle: '${activities[index].estimateWeight} kg',
                            points: activities[index].points,
                            timeAgo: activities[index].date,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForActivity(String title) {
    if (title.toLowerCase().contains('recycling')) {
      return Icons.recycling_rounded;
    } else if (title.toLowerCase().contains('cleanup')) {
      return Icons.cleaning_services_rounded;
    } else if (title.toLowerCase().contains('collection')) {
      return Icons.delete_sweep_rounded;
    } else if (title.toLowerCase().contains('money')) {
      return Icons.monetization_on_rounded;
    }
    return Icons.eco_rounded;
  }
}

class ActivityCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String points;
  final DateTime timeAgo;

  const ActivityCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.points,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F5ED),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: const Color(0xFF0D9488), size: 28),
                ),
                const SizedBox(width: 16),

                // Middle Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                // Right Content
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      points,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF10B981),
                      ),
                    ),
                    Text(
                      _formatTimeAgo(timeAgo),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
