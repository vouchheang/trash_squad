// import 'package:flutter/material.dart';
// import 'package:trash_squad/controllers/activity.dart';
// import 'package:trash_squad/models/activity_model.dart';
// import 'package:trash_squad/screens/all_activities.dart';

// class RecentActivityScreen extends StatelessWidget {
//   const RecentActivityScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Header(),
//             ),
//             Expanded(  // Wrap the ActivityList with Expanded
//               child: ActivityList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Header extends StatelessWidget {
//   const Header({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text(
//           'Recent Activity',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF006064),
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const AllActivities()),
//             );
//           },
//           child: const Text(
//             'See All',
//             style: TextStyle(fontSize: 16, color: Colors.blue),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ActivityList extends StatefulWidget {
//   const ActivityList({super.key});

//   @override
//   State<ActivityList> createState() => _ActivityListState();
// }

// class _ActivityListState extends State<ActivityList> {
//   final ActivityControllerT _activityController = ActivityControllerT();
//   late Future<List<Activity>> _activities;

//   @override
//   void initState() {
//     super.initState();
//     _activities = _activityController.fetchActivity();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Activity>>(
//       future: _activities,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text("Error: ${snapshot.error}"));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text("No activities available."));
//         } else {
//           List<Activity> activities = snapshot.data!;
//           return ListView.separated(
//             padding: const EdgeInsets.all(16),
//             itemCount: activities.length,
//             separatorBuilder: (context, index) => const SizedBox(height: 16),
//             itemBuilder: (context, index) {
//               return ActivityCard(
//                 icon: Icons.recycling,
//                 title: activities[index].title,
//                 subtitle: '${activities[index].estimateWeight} kg',
//                 points: activities[index].points,
//                 timeAgo: (activities[index].date),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }

// class ActivityCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;
//   final String points;
//   final DateTime timeAgo;

//   const ActivityCard({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//     required this.points,
//     required this.timeAgo,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey.shade200, width: 1),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 6,
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             // Icon Container
//             Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFE0F2F1),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Icon(
//                 Icons.real_estate_agent,
//                 color: Color(0xFF006064),
//                 size: 24,
//               ),
//             ),
//             const SizedBox(width: 16),

//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     subtitle,
//                     style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
//                   ),
//                 ],
//               ),
//             ),

//             // Points and Time
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   points,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: const Color(0xFF10B981),
//                   ),
//                 ),
//                 Text(
//                   timeAgo.toString(),
//                   style: const TextStyle(fontSize: 14, color: Colors.black54),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
