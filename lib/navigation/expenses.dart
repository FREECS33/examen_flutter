import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_flutter/modules/expenses/entities/expense.dart';
import 'package:examen_flutter/modules/expenses/screens/add_expense.dart';
import 'package:examen_flutter/modules/expenses/screens/expense_details.dart';
import 'package:examen_flutter/modules/expenses/widgets/custom_list_expenses.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
  });

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  bool _isLoading = true;
  List<Expense> expenses = [];

  final db = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    (() async => {
          db.collection("expenses").snapshots().listen((event) {
            expenses.clear();
            for (var doc in event.docs) {
              final expense = Expense(
                  doc.data()['name'],
                  doc.data()['amount'],
                  doc.data()['description']);
              expenses.add(expense);
            }
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          })
        })();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gastos'),
        backgroundColor: Colors.cyan[200],
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(6),
        itemCount: expenses.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExpenseDetails(
                            expense: expenses[index],
                          )));
            },
            child: CustomListExpenses(expense: expenses[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpense()),
          );
        },
        backgroundColor: Colors.cyan[200],
        child: const Icon(Icons.add),
      ),
    );
  }
}
