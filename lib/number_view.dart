import 'package:flutter/material.dart';

import 'contact_details.dart';

class NumberView extends StatelessWidget {
  const NumberView(
      {super.key,
      required List<ContactDetails> contractDetails,
      required this.onDelete})
      : _contractDetails = contractDetails;

  final List<ContactDetails> _contractDetails;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: _contractDetails.length,
      itemBuilder: (context, index) => ListTile(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Do want to delete this ?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
onDelete(index);
                      Navigator.pop(context);

                    },
                    child: Text('Yes'),
                  )
                ],
              );
            },
          );
        },
        contentPadding: EdgeInsets.all(10),
        tileColor: Colors.grey.shade300,
        leading: Icon(Icons.person),
        title: Text(
          _contractDetails[index].name,
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.w500, fontSize: 22),
        ),
        subtitle: Text(_contractDetails[index].number),
        trailing: Icon(
          Icons.phone,
          color: Colors.blue,
        ),
      ),
    );
  }
}
