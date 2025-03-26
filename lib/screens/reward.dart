import 'package:flutter/material.dart';
import 'package:trash_squad/models/activity_reward.dart';
import 'package:trash_squad/models/option.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RewardOption> rewardOptions = [
      RewardOption(
        title: 'Cash Voucher',
        subtitle: '10\$',
        icon: '💰',
        points: 500,
      ),
      RewardOption(
        title: 'Shopping Discount',
        subtitle: '20% OFF',
        icon: '🛍️',
        points: 500,
      ),
      RewardOption(
        title: 'Free Pickup',
        subtitle: '1 Service',
        icon: '🚚',
        points: 500,
      ),
      RewardOption(
        title: 'Eco-friendly Products',
        subtitle: 'Gift Box',
        icon: '♻️',
        points: 300,
      ),
    ];

    final List<ActivityReward> activities = [
      ActivityReward(title: 'Cash Voucher', points: 500, code: 'DEF789'),
      ActivityReward(title: 'Cash Voucher', points: 300, code: 'GHI012'),
      ActivityReward(title: 'Cash Voucher', points: 500, code: 'DEF789'),
      ActivityReward(title: 'Shopping Discount', points: 700, code: 'VHU198'),
      ActivityReward(title: 'Cash Voucher', points: 100, code: 'DEF789'),
      ActivityReward(title: 'Shopping Discount', points: 300, code: 'VTU023'),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF086C74)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Reward', style: TextStyle(color: Colors.black87)),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    const Text(
                      'Available Points',
                      style: TextStyle(
                        color: Color(0xFF086C74),
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '1,500',
                      style: TextStyle(
                        color: Color(0xFF4CAF94),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A8A7F),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Cash out',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: rewardOptions.length,
                  itemBuilder: (context, index) {
                    final option = rewardOptions[index];
                    return RewardCard(option: option);
                  },
                ),
              ),

              // Recent Activity Section
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent Activity',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0A8A7F),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...activities.map(
                      (activity) => ActivityCard(activity: activity),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final RewardOption option;

  const RewardCard({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF0A8A7F)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(option.icon, style: const TextStyle(fontSize: 24)),
              const SizedBox(width: 8),
              Text(
                option.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            option.subtitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            '${option.points} points',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4CAF94),
              minimumSize: const Size(140, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Redeem', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final ActivityReward activity;

  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.settings,
              color: Color(0xFF0A8A7F),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                activity.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Text(
                '${activity.points} points',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
          const Spacer(),
          Text(
            activity.code,
            style: const TextStyle(
              color: Color(0xFF4CAF94),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
