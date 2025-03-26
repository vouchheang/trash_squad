import 'package:flutter/material.dart';
import 'package:trash_squad/screens/socialpost.dart';

class SocialWidget extends StatelessWidget {
   SocialWidget({super.key});

  final List<Map<String, String>> posts = [
    {
      "name": "Alex Sky",
      "time": "2 hrs ago",
      "profile": "assets/images/profile.png",
      "title": "Keep cleaning",
      "postImage": "assets/images/post.png",
      "text": "Make our environment clean 🌿✨",
    },
    {
      "name": "Emma Watson",
      "time": "5 hrs ago",
      "profile": "assets/images/profile.png",
      "title": "Plastic",
      "postImage": "assets/images/post2.png",
      "text": "Say no to plastic",
    },
    {
      "name": "John Doe",
      "time": "1 day ago",
      "profile": "assets/images/profile.png",
      "title": "Love trees",
      "postImage": "assets/images/post3.png",
      "text": "Love trees, love our planet",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          children: posts.map((post) => _buildPostCard(post)).toList(),
        ),
      ),
    );
  }

  /// Post Card Widget
  Widget _buildPostCard(Map<String, String> post) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      margin: EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(post["profile"]!),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post["name"]!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 2),
                    Text(
                      post["time"]!,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_horiz, color: Colors.grey),
              ],
            ),

            SizedBox(height: 12),
            Text(
              post["title"]!,
              style: TextStyle(fontSize: 16,
              fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 5),
            Text(
              post["text"]!,
              style: TextStyle(fontSize: 14),
            ),

            SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(post["postImage"]!),
            ),

            SizedBox(height: 10),
            Divider(color: Colors.grey[300]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButton(Icons.thumb_up_alt_outlined, "1.5K Like", Colors.blue),
                _buildButton(Icons.comment_outlined, "Comment", Colors.grey),
                _buildButton(Icons.share_outlined, "Share", Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, String text, Color color) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: color),
      label: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const Text("Trash Squad Social"),
      titleTextStyle: TextStyle(
        color: Color(0xFF086C74),
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              icon: Icon(
                Icons.add_photo_alternate_outlined,
                color: Color(0xFF086C74),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SocialpostWidget()),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
