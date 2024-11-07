import 'package:examen_flutter/modules/expenses/entities/expense.dart';
import 'package:flutter/material.dart';

class CustomListExpenses extends StatelessWidget {
  const CustomListExpenses({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/money.jpg",
          width: 60,
          height: 60,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.name,
              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 200,
              height: 40,
              child: Text(
                expense.description,
              ),
            )
          ],
        ),
      ],
    );
  }
}