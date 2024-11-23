import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TableDataPelanggan extends StatelessWidget {
  const TableDataPelanggan({super.key});

  Stream<List<Map<String, dynamic>>> getCustomerTotals() {
    return FirebaseFirestore.instance
        .collection('transactions')
        .snapshots()
        .map((snapshot) {
      Map<String, Map<String, dynamic>> totals = {};

      for (var doc in snapshot.docs) {
        String name = doc.data()['name'] ?? '';
        String type = doc.data()['type'] ?? '';
        double amount = double.tryParse(doc.data()['amount'] ?? '0') ?? 0;

        if (!totals.containsKey(name)) {
          totals[name] = {
            'inflow': 0.0,
            'outflow': 0.0,
            'total': 0.0,
          };
        }

        if (type == 'Inflow') {
          totals[name]!['inflow'] =
              (totals[name]!['inflow'] as double) + amount;
          totals[name]!['total'] = (totals[name]!['total'] as double) + amount;
        } else if (type == 'Outflow') {
          totals[name]!['outflow'] =
              (totals[name]!['outflow'] as double) + amount;
          totals[name]!['total'] = (totals[name]!['total'] as double) - amount;
        }
      }

      // Mengurutkan berdasarkan total transaksi (descending)
      var sortedEntries = totals.entries.toList()
        ..sort((a, b) =>
            (b.value['total'] as double).compareTo(a.value['total'] as double));

      return sortedEntries
          .map((entry) => {
                'name': entry.key,
                'inflow': entry.value['inflow'],
                'outflow': entry.value['outflow'],
                'total': entry.value['total'],
              })
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: getCustomerTotals(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Terjadi kesalahan');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final customerTotals = snapshot.data ?? [];

        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Data Pelanggan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Lihat semua',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 16),
              if (customerTotals.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text('Belum ada data transaksi'),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      customerTotals.length > 5 ? 5 : customerTotals.length,
                  itemBuilder: (context, index) {
                    final customer = customerTotals[index];
                    final customerName = customer['name'] as String;
                    final inflow = customer['inflow'] as double;
                    final outflow = customer['outflow'] as double;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue.shade100,
                                  child: Text(
                                    customerName[0].toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        customerName,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '${customerTotals.length > 1 ? (index + 1).toString() : "1"}° Tertinggi',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.arrow_upward,
                                            color: Colors.green, size: 16),
                                        const SizedBox(width: 4),
                                        Text(
                                          'Rp ${inflow.toStringAsFixed(0)}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.arrow_downward,
                                            color: Colors.red, size: 16),
                                        const SizedBox(width: 4),
                                        Text(
                                          'Rp ${outflow.toStringAsFixed(0)}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
