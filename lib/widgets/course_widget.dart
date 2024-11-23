import 'package:flutter/material.dart';
import 'package:katalis2/screens/fitur_screens/course_detail_screen.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // List of course data
    final courses = [
      {
        'title': 'Manajemen Rantai Makanan',
        'image': 'lib/assets/image/course1.png',
        'sections': 12,
        'videos': 12,
        'description':
            'Pelajari strategi dan konsep manajemen rantai makanan yang efektif untuk bisnis anda.'
      },
      {
        'title': 'Laporan Keuangan Sederhana',
        'image': 'lib/assets/image/course2.png',
        'sections': 8,
        'videos': 10,
        'description':
            'Panduan praktis membuat laporan keuangan yang akurat dan mudah dipahami.'
      },
      {
        'title': 'Memanfaatkan Sosial Media untuk Usaha',
        'image': 'lib/assets/image/course3.png',
        'sections': 10,
        'videos': 15,
        'description':
            'Strategi mengoptimalkan media sosial untuk mengembangkan bisnis anda.'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        ...courses.map((course) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CourseCard(
                title: course['title'] as String,
                image: course['image'] as String,
                sections: course['sections'] as int,
                videos: course['videos'] as int,
                description: course['description'] as String,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetailScreen(
                        title: course['title'] as String,
                        image: course['image'] as String,
                        sections: course['sections'] as int,
                        videos: course['videos'] as int,
                        description: course['description'] as String,
                      ),
                    ),
                  );
                },
              ),
            )),
      ],
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String image;
  final int sections;
  final int videos;
  final String description;
  final VoidCallback onTap;

  const CourseCard({
    required this.title,
    required this.image,
    required this.sections,
    required this.videos,
    required this.description,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Image.asset(
                image,
                width: 120,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),

            // Course Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Course Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),

                    // Description
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),

                    // Course Info
                    Row(
                      children: [
                        const Icon(Icons.file_copy,
                            size: 16, color: Colors.blue),
                        const SizedBox(width: 5),
                        Text('$sections Bagian',
                            style: const TextStyle(fontSize: 12)),
                        const SizedBox(width: 15),
                        const Icon(Icons.play_circle,
                            size: 16, color: Colors.green),
                        const SizedBox(width: 5),
                        Text('$videos Video',
                            style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
