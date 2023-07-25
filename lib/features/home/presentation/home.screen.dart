import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_quest/core/style/colors.dart';

import '../../shared/view_controller.interface.dart';
import '../domain/abstractions/controllers/home_controller.interface.dart';
import '../domain/models/transaction.model.dart';

class HomeScreen extends ViewController<IHomeController> {
  HomeScreen({super.key});

  final List<TransactionModel> transactions = [
    TransactionModel(
      id: '1',
      title: 'Groceries',
      value: 50.0,
      date: DateTime.now(),
      isBilling: true,
    ),
    TransactionModel(
      id: '2',
      title: 'Gas',
      value: 30.0,
      date: DateTime.now().subtract(const Duration(days: 1)),
      isBilling: false,
    ),
    TransactionModel(
      id: '3',
      title: 'Dinner',
      value: 75.0,
      date: DateTime.now().subtract(const Duration(days: 2)),
      isBilling: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<TransactionModel>> groupedTransactions = {};
    for (TransactionModel transaction in transactions) {
      DateTime date = DateTime(
        transaction.date.year,
        transaction.date.month,
        transaction.date.day,
      );
      if (!groupedTransactions.containsKey(date)) {
        groupedTransactions[date] = [];
      }
      groupedTransactions[date]!.add(transaction);
    }

    List<Widget> dateGroupWidgets = [];
    for (final date in groupedTransactions.keys) {
      dateGroupWidgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                DateFormat('dd/MM/yyyy').format(date),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: groupedTransactions[date]!.length,
              itemBuilder: (_, int index) {
                final transaction = groupedTransactions[date]![index];

                return ListTile(
                  title: Text(
                    transaction.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    transaction.isBilling ? 'Billing' : 'Non-billing',
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    transaction.value?.toStringAsFixed(2) ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(CColors.background),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Listagem de Transações'),
      ),
      body: ListView(children: dateGroupWidgets),
    );
  }
}
