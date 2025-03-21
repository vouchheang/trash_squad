import 'package:flutter/material.dart';
import 'package:trash_squad/screens/home.dart';

class AllActivities extends StatelessWidget {
  const AllActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF0D9488),
          ),
          onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: const Text(
          'Recent Activity',
          style: TextStyle(
            color: Color(0xFF0D9488),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Activity Card 1
            ActivityCard(
              icon: Icons.recycling,
              title: 'Plastic Collection',
              subtitle: '3.5 kg',
              points: 7,
              timeAgo: '2 hours ago',
              isPositive: true,
            ),
            const SizedBox(height: 12),
            // Activity Card 2
            ActivityCard(
              icon: Icons.recycling,
              title: 'Metal Collection',
              subtitle: '2.1 kg',
              points: 10,
              timeAgo: 'Yesterday',
              isPositive: true,
            ),
            const SizedBox(height: 12),
            // Activity Card 3
            ActivityCard(
              icon: Icons.recycling,
              title: 'Points Redeemed',
              subtitle: '\$ 5.00',
              points: 25,
              timeAgo: '2 days ago',
              isPositive: false,
            ),
            const SizedBox(height: 16),
            // Activity Card 1
            ActivityCard(
              icon: Icons.recycling,
              title: 'Plastic Collection',
              subtitle: '3.5 kg',
              points: 7,
              timeAgo: '2 hours ago',
              isPositive: true,
            ),
            const SizedBox(height: 12),
            // Activity Card 2
            ActivityCard(
              icon: Icons.recycling,
              title: 'Metal Collection',
              subtitle: '2.1 kg',
              points: 10,
              timeAgo: 'Yesterday',
              isPositive: true,
            ),
            const SizedBox(height: 12),
            // Activity Card 3
            ActivityCard(
              icon: Icons.recycling,
              title: 'Points Redeemed',
              subtitle: '\$ 5.00',
              points: 25,
              timeAgo: '2 days ago',
              isPositive: false,
            ),
            const SizedBox(height: 16),
            // Activity Card 1
            ActivityCard(
              icon: Icons.recycling,
              title: 'Plastic Collection',
              subtitle: '3.5 kg',
              points: 7,
              timeAgo: '2 hours ago',
              isPositive: true,
            ),
            const SizedBox(height: 12),
            // Activity Card 2
            ActivityCard(
              icon: Icons.recycling,
              title: 'Metal Collection',
              subtitle: '2.1 kg',
              points: 10,
              timeAgo: 'Yesterday',
              isPositive: true,
            ),
            const SizedBox(height: 12),
            // Activity Card 3
            ActivityCard(
              icon: Icons.recycling,
              title: 'Points Redeemed',
              subtitle: '\$ 5.00',
              points: 25,
              timeAgo: '2 days ago',
              isPositive: false,
            ),
            const SizedBox(height: 16),
            // Activity Card 1
            ActivityCard(
              icon: Icons.recycling,
              title: 'Plastic Collection',
              subtitle: '3.5 kg',
              points: 7,
              timeAgo: '2 hours ago',
              isPositive: true,
            ),
            const SizedBox(height: 12),
            // Activity Card 2
            ActivityCard(
              icon: Icons.recycling,
              title: 'Metal Collection',
              subtitle: '2.1 kg',
              points: 10,
              timeAgo: 'Yesterday',
              isPositive: true,
            ),
            const SizedBox(height: 12),
            // Activity Card 3
            ActivityCard(
              icon: Icons.recycling,
              title: 'Points Redeemed',
              subtitle: '\$ 5.00',
              points: 25,
              timeAgo: '2 days ago',
              isPositive: false,
            ),
          ],
        ),
      )),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final int points;
  final String timeAgo;
  final bool isPositive;

  const ActivityCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.points,
    required this.timeAgo,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE6E6E6),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Left icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F5ED),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF0D9488),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          // Middle content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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
          // Right content
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                isPositive ? '+ $points points' : '- $points points',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isPositive ? const Color(0xFF10B981) : Colors.red,
                ),
              ),
              Text(
                timeAgo,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}