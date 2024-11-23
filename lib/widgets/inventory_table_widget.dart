import 'package:flutter/material.dart';

class InventoryTableWidget extends StatelessWidget {
  final List<Map<String, String>> inventoryData;

  const InventoryTableWidget({super.key, required this.inventoryData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Stok Inventori',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'InstrumentSans',
                ),
              ),
              Text(
                'Lihat Semua',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF08538F),
                  decoration: TextDecoration.underline,
                  fontFamily: 'InstrumentSans',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          Table(
            columnWidths: const {
              0: FixedColumnWidth(150),
              1: FixedColumnWidth(100),
              2: FixedColumnWidth(100),
            },
            children: [
              const TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Nama',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'InstrumentSans',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Jumlah',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'InstrumentSans',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Kategori',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'InstrumentSans',
                      ),
                    ),
                  ),
                ],
              ),
              ...inventoryData.map((item) {
                return TableRow(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item['name']!,
                        style: const TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item['quantity']!,
                          style: const TextStyle(fontFamily: 'InstrumentSans'),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item['category']!,
                        style: const TextStyle(fontFamily: 'InstrumentSans'),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: InventoryTableWidget(
          inventoryData: [
            {'name': 'Paper Size A5', 'quantity': '200', 'category': 'Paper'},
            {'name': 'Ballpoint Pen', 'quantity': '150', 'category': 'Pen'},
            {'name': 'Marker Blue', 'quantity': '100', 'category': 'Marker'},
            {'name': 'Printer Ink', 'quantity': '30', 'category': 'Ink'},
            {'name': 'Notebook A4', 'quantity': '120', 'category': 'NoteBook'},
            {'name': 'Sketch Paper', 'quantity': '75', 'category': 'Paper'},
            {'name': 'Highlighter', 'quantity': '60', 'category': 'Marker'},
          ],
        ),
      ),
    ),
  ));
}
