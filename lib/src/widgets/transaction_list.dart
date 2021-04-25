import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/src/models/transaction_model.dart';
import 'package:personal_expenses/src/widgets/empty_state.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? EmptyState()
        : Container(
            height: 650,
            child: ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: FittedBox(
                            child: Text('\$${transactions[index].ammount}'),
                          ),
                        ),
                      ),
                      title: Text(
                        '${transactions[index].title}',
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMMd().format(transactions[index].date),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            _deleteTransaction(transactions[index].id),
                        color: Theme.of(context).errorColor,
                      )),
                );
              },
              itemCount: transactions.length,
            ),
          );
  }
}
