import 'package:flutter/material.dart';

class CourseDetailScreen extends StatefulWidget {
  final String title;
  final String image;
  final int sections;
  final int videos;
  final String description;

  const CourseDetailScreen({
    required this.title,
    required this.image,
    required this.sections,
    required this.videos,
    required this.description,
    super.key,
  });

  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  bool _isEnrolled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.black54,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildCourseInfo(),
                const SizedBox(height: 20),
                _buildCourseDescription(),
                const SizedBox(height: 20),
                _buildSectionsList(),
                const SizedBox(height: 20),
                _buildEnrollButton(),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoCard(
            Icons.layers, '${widget.sections} Sections', Colors.blue),
        _buildInfoCard(
            Icons.video_library, '${widget.videos} Videos', Colors.green),
        _buildInfoCard(Icons.access_time, '12 Hours', Colors.orange),
      ],
    );
  }

  Widget _buildInfoCard(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Course Description',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.description,
          style: TextStyle(
            color: Colors.grey[600],
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Course Sections',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.sections,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.withOpacity(0.1),
                child: Text('${index + 1}'),
              ),
              title: Text('Section ${index + 1}'),
              trailing: const Icon(Icons.lock_outline),
            );
          },
        ),
      ],
    );
  }

  Widget _buildEnrollButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isEnrolled = !_isEnrolled;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isEnrolled
                ? 'You are now enrolled in this course'
                : 'You have unenrolled from this course'),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _isEnrolled ? Colors.grey : Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        _isEnrolled ? 'Unenroll' : 'Enroll Now',
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
