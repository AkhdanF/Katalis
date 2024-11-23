import 'package:flutter/material.dart';
import 'package:katalis2/widgets/ringkasan_pelanggan_widget.dart';
import 'package:katalis2/widgets/search_bar_widget.dart';
import 'package:katalis2/widgets/table_data_pelanggan.dart';

class CustomerManagementScreen extends StatelessWidget {
  const CustomerManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Customer Management',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RingkasanPelangganWidget(),
            SizedBox(height: 20),
            SearchBarWidget(),
            SizedBox(
              height: 20,
            ),
            TableDataPelanggan()
          ],
        ),
      ),
    );
  }
}
