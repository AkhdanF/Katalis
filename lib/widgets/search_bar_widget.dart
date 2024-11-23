import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(24),
            shadowColor: Colors.black.withOpacity(0.25),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari transaksi..',
                hintStyle: const TextStyle(
                  color: Colors.black54,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterButton(
                  icon: Icons.dashboard,
                  label: 'Semua tipe',
                ),
                SizedBox(width: 10), // Space between buttons
                FilterButton(
                  icon: Icons.calendar_month_rounded,
                  label: '30 hari terakhir',
                ),
                SizedBox(width: 10), // Space between buttons
                FilterButton(
                  icon: Icons.filter_list,
                  label: 'Filter',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const FilterButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black.withOpacity(0.25),
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 20, color: Colors.black),
        label: Text(
          label,
          style: const TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
          ),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: const BorderSide(color: Colors.black),
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
    );
  }
}
