import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Post {
  final String userId;
  final String userName;
  final String userCompany;
  final String content;
  final List<String>? images;
  final DateTime timestamp;

  Post({
    required this.userId,
    required this.userName,
    required this.userCompany,
    required this.content,
    this.images,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

class CreatePostWidget extends StatefulWidget {
  final Function(Post) onPostCreated;

  const CreatePostWidget({Key? key, required this.onPostCreated})
      : super(key: key);

  @override
  _CreatePostWidgetState createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  final TextEditingController _postController = TextEditingController();
  List<File> _selectedImages = [];

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> pickedFiles = await picker.pickMultiImage();

    setState(() {
      _selectedImages = pickedFiles.map((file) => File(file.path)).toList();
    });
  }

  void _submitPost() {
    if (_postController.text.isNotEmpty) {
      final newPost = Post(
        userId: 'current_user_id',
        userName: 'Akmal Imani',
        userCompany: 'Katalis Consulting',
        content: _postController.text,
        images: _selectedImages.map((file) => file.path).toList(),
      );

      widget.onPostCreated(newPost);

      // Reset form
      _postController.clear();
      _selectedImages.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('lib/assets/image/profile4.png'),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: _postController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          hintText: 'Apa yang sedang kamu pikirkan...',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Tampilkan gambar yang dipilih
                if (_selectedImages.isNotEmpty)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _selectedImages.map((image) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.file(
                            image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.image),
                          onPressed: _pickImages,
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.insert_chart_outlined),
                        const SizedBox(width: 10),
                        const Icon(Icons.calendar_month_outlined),
                      ],
                    ),
                    GestureDetector(
                      onTap: _submitPost,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEB3B),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Post',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
