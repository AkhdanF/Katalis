import 'package:flutter/material.dart';
import 'package:katalis2/screens/fitur_screens/elearning_screen.dart';
import 'package:katalis2/widgets/course_widget.dart';
import 'package:katalis2/widgets/lowest_items_widget.dart';
import 'package:provider/provider.dart';
import 'package:katalis2/widgets/transaction_model.dart';
import 'package:katalis2/widgets/fitur_widget.dart';
import 'package:katalis2/widgets/highlight_widget.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFEEEEE),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, $username!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Consumer<TransactionProvider>(
                builder: (context, provider, child) {
                  return HighlightWidget(
                    totalIncome: provider.totalIncome,
                    totalExpenditure: provider.totalExpenditure,
                  );
                },
              ),
              const SizedBox(height: 20),
              const FiturWidget(),
              const SizedBox(height: 20),
              const LowestItemsWidget(),
              const SizedBox(height: 20),
              _buildSectionHeader('Lanjutkan Course Kamu', context),
              const CourseWidget(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ElearningScreen(),
                ),
              );
            },
            child: const Text(
              'Lihat Semua',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
