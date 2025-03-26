import 'package:flutter/material.dart';
import 'package:trash_squad/components/schedule_redeem.dart';
import 'package:trash_squad/components/chart.dart';
import 'package:trash_squad/controllers/activity.dart';
import 'package:trash_squad/models/activity_model.dart';
import 'package:trash_squad/screens/all_activities.dart';
import 'package:trash_squad/screens/notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ActivityControllerT _activityController = ActivityControllerT();
  late Future<List<Activity>> _activities;

  @override
  void initState() {
    super.initState();
    _activities = _activityController.fetchActivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8), 
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 30),
              _buildStatsSection(),
              const SizedBox(height: 20),
              _buildRecentActivitySection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Waste of Wealth',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.teal.shade800,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Let's protect the earth together",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.teal.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.teal.shade700,
                size: 28,
              ),
              onPressed: () {
               Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                  );
              },
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.shade100,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsSection() {
    return Column(
      children: [
        const ChartWidget(),
        const SizedBox(height: 16),
        const ScheduleandRedeem(),
      ],
    );
  }

  Widget _buildRecentActivitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Activity',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AllActivities()),
                  );
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 16, 
                    color: Colors.teal.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<Activity>>(
          future: _activities,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                  ),
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
                child: Text(
                  "No activities available.",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            } else {
              List<Activity> activities = snapshot.data!.take(3).toList();
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                itemCount: activities.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return ActivityCard(
                    icon: Icons.recycling,
                    title: activities[index].title,
                    subtitle: '${activities[index].estimateWeight} kg',
                    points: activities[index].points,
                    timeAgo: activities[index].date,
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}