import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF086C74), // Updated main color
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Color(0xFF086C74)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationItem(
            title: 'Pickup Scheduled',
            message: 'Your pickup has been scheduled for tomorrow at 10:00 AM',
            time: '2 hours ago',
            isUnread: true,
          ),
          _buildNotificationItem(
            title: 'Points Earned',
            message: 'You earned 15 points for your recent recycling activity',
            time: '1 day ago',
            isUnread: true,
          ),
          _buildNotificationItem(
            title: 'New Reward Available',
            message: 'Redeem 200 points for a \$20 gift card at EcoStore',
            time: '2 days ago',
            isUnread: false,
          ),
          _buildNotificationItem(
            title: 'Weekly Summary',
            message: 'You recycled 22kg this week, 15% more than last week!',
            time: '5 days ago',
            isUnread: false,
          ),
          _buildNotificationItem(
            title: 'Pickup Completed',
            message: 'Your recycling pickup was completed successfully',
            time: '1 week ago',
            isUnread: false,
          ),
          _buildNotificationItem(
            title: 'Special Promotion',
            message: 'Double points on all glass recycling this weekend!',
            time: '1 week ago',
            isUnread: false,
          ),
          _buildNotificationItem(
            title: 'Community Milestone',
            message: 'Our community has recycled over 10,000kg this month!',
            time: '2 weeks ago',
            isUnread: false,
          ),
          _buildNotificationItem(
            title: 'Account Update',
            message: 'Your profile has been verified successfully',
            time: '3 weeks ago',
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String message,
    required String time,
    required bool isUnread,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isUnread ? Color(0xFFE6F2F3) : Colors.white, // Lighter shade to match new color
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFFE0E0E0),
          width: 1,
        ),
        boxShadow: isUnread ? [
          BoxShadow(
            color: Color(0xFF086C74).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          )
        ] : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isUnread 
                    ? Color(0xFF086C74).withOpacity(0.2) 
                    : Color(0xFFEEEEEE),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_outlined,
                color: isUnread ? Color(0xFF086C74) : Colors.grey,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: isUnread ? FontWeight.bold : FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      if (isUnread)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Color(0xFF086C74), // Updated unread indicator
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
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
}