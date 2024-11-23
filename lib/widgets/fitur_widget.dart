import 'package:flutter/material.dart';
import 'package:katalis2/screens/fitur_screens/customer_management_screen.dart';
import 'package:katalis2/screens/fitur_screens/elearning_screen.dart';
import 'package:katalis2/screens/fitur_screens/konsultasi_screen.dart';

class FiturWidget extends StatelessWidget {
  const FiturWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const KonsultasiScreen()),
              );
            },
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/image/konsulV.png',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Konsultasi',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ElearningScreen()),
              );
            },
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/image/elearnV.png',
                ),
                const SizedBox(height: 8),
                const Text(
                  'E-learning',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CustomerManagementScreen()),
              );
            },
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/image/crmV.png',
                ),
                const SizedBox(height: 8),
                const Text(
                  'CRM',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const KonsultasiScreen()),
              );
            },
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/image/InsightV.png',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Insight',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
