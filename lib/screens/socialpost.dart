import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:trash_squad/screens/social.dart';

class SocialpostWidget extends StatefulWidget {
  const SocialpostWidget({super.key});

  @override
  _SocialpostWidgetState createState() => _SocialpostWidgetState();
}

class _SocialpostWidgetState extends State<SocialpostWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://your-api.com/upload'),
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        _image!.path,
        filename: basename(_image!.path),
      ),
    );

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Upload successful');
    } else {
      print('Upload failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(18),
                  labelText: "Title",
                  labelStyle: TextStyle(
                    color: Color(0xFF5BB59B),
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                minLines: 6,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "What's on your mind?",
                  labelStyle: TextStyle(
                    color: Color(0xFF5BB59B),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            _image != null
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(_image!, fit: BoxFit.cover),
                    ),
                  )
                : SizedBox(),

            SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: Icon(Icons.image, color: Colors.white),
              label: Text("Upload Image", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5BB59B),
                padding: EdgeInsets.symmetric(horizontal: 168, vertical: 30),
              ),
            ),

            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: _uploadImage,
              icon: Icon(Icons.upload, color: Colors.white),
              label: Text("Submit Post", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF086C74),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text("Create Post"),
      titleTextStyle: TextStyle(
        color: Color(0xFF086C74),
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.cancel_outlined, color: Color(0xFF086C74)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SocialWidget()),
          );
        },
      ),
    );
  }
}
