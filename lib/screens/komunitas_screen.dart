import 'dart:io';

import 'package:flutter/material.dart';
import 'package:katalis2/widgets/create_post_widget.dart';
import 'package:katalis2/widgets/feeds_widget.dart';
import 'package:katalis2/widgets/komunitassaya_widget.dart';

class KomunitasScreen extends StatefulWidget {
  const KomunitasScreen({Key? key}) : super(key: key);

  @override
  _KomunitasScreenState createState() => _KomunitasScreenState();
}

class _KomunitasScreenState extends State<KomunitasScreen> {
  final List<Post> _posts = [];

  void _addPost(Post newPost) {
    setState(() {
      _posts.insert(0, newPost);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Komunitas',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreatePostWidget(onPostCreated: _addPost),
            const SizedBox(height: 20),
            ..._posts.map((post) => _buildPostItem(post)),
            const FeedsWidget(),
            const SizedBox(height: 20),
            const KomunitassayaWidget()
          ],
        ),
      ),
    );
  }

  Widget _buildPostItem(Post post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
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
                  radius: 24,
                  backgroundImage: AssetImage('lib/assets/image/profile3.jpg'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            post.userName,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '| ${post.userCompany}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        _formatTimestamp(post.timestamp),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      )
                    ],
                  ),
                ),
                const Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              post.content,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            if (post.images != null && post.images!.isNotEmpty)
              const SizedBox(height: 20),
            if (post.images != null && post.images!.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: post.images!.map((imagePath) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.file(
                        File(imagePath),
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
              ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border),
                    SizedBox(width: 10),
                    Text('0'),
                    SizedBox(width: 10),
                    Icon(Icons.comment_outlined),
                    SizedBox(width: 10),
                    Text('0'),
                  ],
                ),
                Icon(Icons.share),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final Duration difference = DateTime.now().difference(timestamp);
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
