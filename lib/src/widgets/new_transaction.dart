import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _ammountController = TextEditingController();
  DateTime _dateSelected;

  void _submitedData() {
    if (_ammountController.text.isEmpty) return;
    final enterTitle = _titleController.text;
    final enterAmount = double.parse(_ammountController.text);

    if (enterTitle.isEmpty || enterAmount <= 0 || _dateSelected == null) return;
    widget.addTx(
      enterTitle,
      enterAmount,
      _dateSelected,
    );
    Navigator.of(context).pop();
  }

  void _presentDayPicker() async {
    try {
      final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now(),
      );
      if (date == null) return;
      setState(() {
        _dateSelected = date;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration:
                  InputDecoration(labelText: 'title', hintText: 'title'),
              controller: _titleController,
              onSubmitted: (_) => _submitedData,
            ),
            TextField(
              decoration:
                  InputDecoration(labelText: 'ammount', hintText: 'ammount'),
              controller: _ammountController,
              onSubmitted: (_) => _submitedData,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _dateSelected == null
                          ? 'No date selected'
                          : 'Picked day: ${DateFormat.yMd().format(_dateSelected)}',
                    ),
                  ),
                  TextButton(
                    onPressed: _presentDayPicker,
                    child: Text(
                      'Select date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitedData,
              child: Text('Add transaction'),
            )
          ],
        ),
      ),
    );
  }
}
