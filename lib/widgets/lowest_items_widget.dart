import 'package:flutter/material.dart';

class LowestItemsWidget extends StatelessWidget {
  const LowestItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return         Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xFFFFA726),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Lowest Stock Section
            const Row(
              children: [
                Text(
                  'Top 5 Lowest Stock Amount',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'InstrumentSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_circle_down, color: Color(0xFFCF4A4A)),
              ],
            ),
            const SizedBox(height: 10),
            // Lowest stock items
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset('lib/assets/image/items/item6.png'),
                    const Text('Ruler'),
                    const Text('146'),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFCFFF5E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Critical',
                        style: TextStyle(color: Color(0xFFCB0000)),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('lib/assets/image/items/item7.png'),
                    const Text('Notebook'),
                    const Text('210'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('lib/assets/image/items/item8.png'),
                    const Text('Marker'),
                    const Text('280'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('lib/assets/image/items/item9.png'),
                    const Text('Brush'),
                    const Text('320'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('lib/assets/image/items/item10.png'),
                    const Text('Ink'),
                    const Text('390'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    )
;
  }
}
