import 'package:flutter/material.dart';

class ProductSummary extends StatelessWidget {
  const ProductSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'Product Summary',
          style: TextStyle(
            fontSize: 26,
            fontFamily: 'InstrumentSans',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Highest Stock Section
              const Row(
                children: [
                  Text(
                    'Top 5 Highest Stock Amount',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_circle_up, color: Color(0xFF148619)),
                ],
              ),
              const SizedBox(height: 10),
              // Highest stock items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset('lib/assets/image/items/item1.png'),
                      const Text('Pencil'),
                      const Text('2,146'),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('lib/assets/image/items/item2.png'),
                      const Text('Scissors'),
                      const Text('1,920'),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('lib/assets/image/items/item3.png'),
                      const Text('Eraser'),
                      const Text('1,610'),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('lib/assets/image/items/item4.png'),
                      const Text('Paper'),
                      const Text('1,450'),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('lib/assets/image/items/item5.png'),
                      const Text('Pen'),
                      const Text('1,300'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
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
      ],
    );
  }
}
