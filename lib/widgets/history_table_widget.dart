import 'package:flutter/material.dart';
import 'package:katalis2/widgets/transaction_model.dart';
import 'package:intl/intl.dart';

class HistoryTableWidget extends StatelessWidget {
  final List<TransactionModel> transactions;

  const HistoryTableWidget({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Text
        const Padding(
          padding: EdgeInsets.only(left: 20, bottom: 10),
          child: Text(
            'History Transaction Table',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Existing Container with DataTable
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: WidgetStateColor.resolveWith(
                    (states) => Colors.grey.shade100),
                dividerThickness: 0.5,
                columnSpacing: 20,
                dataRowHeight: 60,
                headingRowHeight: 60,
                columns: [
                  _buildDataColumn('Name'),
                  _buildDataColumn('Amount'),
                  _buildDataColumn('Date'),
                  _buildDataColumn('Type'),
                  _buildDataColumn('Actions'),
                ],
                rows: transactions.map((transaction) {
                  return DataRow(
                    cells: <DataCell>[
                      // Name Cell
                      DataCell(
                        Text(
                          transaction.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      // Amount Cell
                      DataCell(
                        Text(
                          _formatCurrency(transaction.amount),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Date Cell
                      DataCell(
                        Text(
                          _formatDate(transaction.date),
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      // Type Cell
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getTypeColor(transaction.type)
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            transaction.type,
                            style: TextStyle(
                              color: _getTypeColor(transaction.type),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // Actions Cell
                      DataCell(
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildActionButton(
                              icon: Icons.edit,
                              color: Colors.blue,
                              onPressed: () {
                                // Implement edit functionality
                              },
                            ),
                            const SizedBox(width: 5),
                            _buildActionButton(
                              icon: Icons.delete,
                              color: Colors.red,
                              onPressed: () {
                                // Implement delete functionality
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Existing helper methods remain the same
  // (No changes to _buildDataColumn, _getTypeColor, _buildActionButton,
  // _formatDate, and _formatCurrency methods)
}

// Helper Methods
DataColumn _buildDataColumn(String label) {
  return DataColumn(
    label: Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    ),
  );
}

Color _getTypeColor(String type) {
  switch (type.toLowerCase()) {
    case 'inflow':
      return Colors.green;
    case 'outflow':
      return Colors.red;
    default:
      return Colors.blue;
  }
}

Widget _buildActionButton({
  required IconData icon,
  required Color color,
  required VoidCallback onPressed,
}) {
  return IconButton(
    icon: Icon(icon, color: color, size: 20),
    onPressed: onPressed,
    splashRadius: 20,
  );
}

String _formatDate(String dateString) {
  try {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('dd MMM yyyy').format(date);
  } catch (e) {
    return dateString;
  }
}

String _formatCurrency(String amount) {
  try {
    // Konversi string ke double
    double value = double.parse(amount);

    // Format dengan NumberFormat
    return NumberFormat.currency(
            locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
        .format(value);
  } catch (e) {
    return amount;
  }
}
