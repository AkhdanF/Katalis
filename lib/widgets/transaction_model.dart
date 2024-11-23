import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Tambahkan import untuk StreamSubscription
import 'package:katalis2/widgets/database_service.dart';

class TransactionModel {
  final String id;
  final String name;
  final String amount;
  final String date;
  final String type;

  TransactionModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
    required this.type,
  });

  factory TransactionModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return TransactionModel(
      id: doc.id,
      name: data['name'] ?? '',
      amount: data['amount'] ?? '0',
      date: data['date'] ?? '',
      type: data['type'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'amount': amount,
      'date': date,
      'type': type,
    };
  }

  TransactionModel copyWith({
    String? id,
    String? name,
    String? amount,
    String? date,
    String? type,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      type: type ?? this.type,
    );
  }
}

class TransactionProvider with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  List<TransactionModel> _transactions = []; // Specify type
  int _totalIncome = 0;
  int _totalExpenditure = 0;

  List<TransactionModel> get transactions =>
      _transactions; // Specify return type
  int get totalIncome => _totalIncome;
  int get totalExpenditure => _totalExpenditure;

  // Stream subscription for real-time updates
  late StreamSubscription<List<TransactionModel>> _transactionSubscription;

  TransactionProvider() {
    _initializeTransactions();
  }

  void _initializeTransactions() {
    _transactionSubscription =
        _databaseService.getTransactions().listen((transactions) {
      _transactions = transactions;
      _calculateTotals();
      notifyListeners();
    });
  }

  void _calculateTotals() {
    _totalIncome = 0;
    _totalExpenditure = 0;

    for (var transaction in _transactions) {
      int amount = int.tryParse(transaction.amount) ?? 0;
      if (transaction.type == 'Inflow') {
        _totalIncome += amount;
      } else if (transaction.type == 'Outflow') {
        _totalExpenditure += amount;
      }
    }
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    await _databaseService.addTransaction(transaction);
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    await _databaseService.updateTransaction(transaction);
  }

  Future<void> deleteTransaction(String id) async {
    await _databaseService.deleteTransaction(id);
  }

  @override
  void dispose() {
    _transactionSubscription.cancel();
    super.dispose();
  }
}
