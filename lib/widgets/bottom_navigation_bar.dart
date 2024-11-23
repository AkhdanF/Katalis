import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, -2), // Posisi bayangan
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon('lib/assets/image/homeV.png', 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('lib/assets/image/moneyV.png', 1),
            label: 'Keuangan',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('lib/assets/image/operasiV.png', 2),
            label: 'Operasi',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('lib/assets/image/komunitasV.png', 3),
            label: 'Komunitas',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('lib/assets/image/profileV.png', 4),
            label: 'Profil',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildIcon(String assetPath, int index) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == selectedIndex ? const Color(0xFFFFA726) : Colors.transparent, // Warna latar belakang bulat
      ),
      padding: const EdgeInsets.all(8), // Padding untuk bulatan
      child: Image.asset(
        assetPath,
        width: 35,
        height: 35,
      ),
    );
  }
}