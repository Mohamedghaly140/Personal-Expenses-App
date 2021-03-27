import 'package:flutter/material.dart';

import '../models/transaction.dart';

import './transactionCard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransactionHandler;

  TransactionList({
    @required this.transactions,
    @required this.deleteTransactionHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  height: 250,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, i) {
                return TransactionCard(
                  id: transactions[i].id,
                  title: transactions[i].title,
                  amount: transactions[i].amount,
                  date: transactions[i].date,
                  deleteHandler: deleteTransactionHandler,
                );
              }),
    );
  }
}
