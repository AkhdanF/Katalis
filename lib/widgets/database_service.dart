import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:katalis2/widgets/transaction_model.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _transactionRef =>
      _firestore.collection('transactions');

  // Fungsi untuk mendapatkan semua transaksi (tanpa filter berdasarkan pengguna)
  Stream<List<TransactionModel>> getTransactions() {
    return _transactionRef
        .orderBy('date', descending: true) // You can still order by date
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TransactionModel.fromFirestore(doc))
            .toList());
  }

  // Fungsi untuk menambahkan transaksi
  Future<void> addTransaction(TransactionModel transaction) async {
    await _transactionRef.add(transaction.toFirestore());
  }

  // Fungsi untuk memperbarui transaksi
  Future<void> updateTransaction(TransactionModel transaction) async {
    await _transactionRef.doc(transaction.id).update(transaction.toFirestore());
  }

  // Fungsi untuk menghapus transaksi
  Future<void> deleteTransaction(String id) async {
    await _transactionRef.doc(id).delete();
  }
}
