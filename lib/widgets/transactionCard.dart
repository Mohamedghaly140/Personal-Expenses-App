import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Function deleteHandler;

  TransactionCard({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
    @required this.deleteHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FittedBox(
              child: Text('\$${amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(date),
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete_forever,
            color: Theme.of(context).errorColor,
          ),
          onPressed: () => deleteHandler(id),
        ),
      ),
    );
  }
}
