import 'package:flutter/material.dart';
import 'package:katalis2/widgets/inventory_summary_widget.dart';
import 'package:katalis2/widgets/inventory_table_widget.dart';
import 'package:katalis2/widgets/product_container_widget.dart';
import 'package:katalis2/widgets/product_summary_widget.dart';
import 'package:katalis2/widgets/search_bar_widget.dart';

class OperasiScreen extends StatefulWidget {
  const OperasiScreen({super.key});

  @override
  _OperasiScreenState createState() => _OperasiScreenState();
}

class _OperasiScreenState extends State<OperasiScreen> {
  int _selectedIndex = 0;

  // Define the inventory data here
  final List<Map<String, String>> inventoryData = [
    {'name': 'Paper Size A5', 'quantity': '200', 'category': 'Paper'},
    {'name': 'Ballpoint Pen', 'quantity': '150', 'category': 'Pen'},
    {'name': 'Marker Blue', 'quantity': '100', 'category': 'Marker'},
    {'name': 'Printer Ink', 'quantity': '30', 'category': 'Ink'},
    {'name': 'Notebook A4', 'quantity': '120', 'category': 'NoteBook'},
    {'name': 'Sketch Paper', 'quantity': '75', 'category': 'Paper'},
    {'name': 'Highlighter', 'quantity': '60', 'category': 'Marker'},
  ];

  final List<Widget> _contentWidgets = [];

  @override
  void initState() {
    super.initState();
    // Initialize content widgets
    _contentWidgets.addAll([
      Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
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
            child: const InventorySummary(),
          ),
          const SizedBox(height: 10),
          const SearchBarWidget(),
          const SizedBox(height: 10),
          InventoryTableWidget(inventoryData: inventoryData),
        ],
      ),
      Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xFF51BE56),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const ProductSummary(),
          ),
          const SizedBox(height: 15),
          const SearchBarWidget(),
          const SizedBox(height: 20),
          const ProductContainerWidget()
        ],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text(
          'Rincian Inventori',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'InstrumentSans',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _selectedIndex = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: _selectedIndex == 0
                            ? const Color(0xFFFFEB3B)
                            : Colors.transparent,
                        boxShadow: _selectedIndex == 0
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : [],
                      ),
                      child: Text(
                        'Stock Inventory',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InstrumentSans',
                          color:
                              _selectedIndex == 0 ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => _selectedIndex = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: _selectedIndex == 1
                            ? const Color(0xFFFFEB3B)
                            : Colors.transparent,
                        boxShadow: _selectedIndex == 1
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : [],
                      ),
                      child: Text(
                        'Stock Produk',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InstrumentSans',
                          color:
                              _selectedIndex == 1 ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: _contentWidgets[_selectedIndex],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
