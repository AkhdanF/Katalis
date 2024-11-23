import 'package:flutter/material.dart';

class ProductContainerWidget extends StatelessWidget {
  const ProductContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First row - one container on top, one on bottom
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.5)), // Border
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2), // Shadow position
                    ),
                  ],
                ),
                height: 100,
                child: const Center(
                  child: Text(
                    'Container 1',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans', // Consistent font family
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                height: 100,
                child: const Center(
                  child: Text(
                    'Container 2',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans', // Consistent font family
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Second row - two containers, stacked one on top of the other
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                height: 100,
                child: const Center(
                  child: Text(
                    'Container 3',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans', // Consistent font family
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                height: 100,
                child: const Center(
                  child: Text(
                    'Container 4',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans', // Consistent font family
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Third row - two containers, stacked one on top of the other
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                height: 100,
                child: const Center(
                  child: Text(
                    'Container 5',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans', // Consistent font family
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                height: 100,
                child: const Center(
                  child: Text(
                    'Container 6',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans', // Consistent font family
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
