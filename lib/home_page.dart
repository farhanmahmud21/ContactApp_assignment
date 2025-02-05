import 'package:assignment_exam2/contact_details.dart';
import 'package:flutter/material.dart';

import 'number_view.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameTEController = TextEditingController();

  TextEditingController _phoneTEControler = TextEditingController();

  List<ContactDetails> _contractDetails = [
    ContactDetails(name: 'farhan', number: '01856406497')
  ];

  void deleteItem(int index) {
    setState(() {});
    _contractDetails.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Contact List',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  wordSpacing: 2,
                  color: Colors.white),
            ),
            backgroundColor: Colors.blueGrey,
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _nameTEController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      label: Text('Name'),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter Your Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _phoneTEControler,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Phone-Number',
                      label: Text('Phone- Number'),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter Your Number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _contractDetails.add(
                              ContactDetails(
                                  name: _nameTEController.text,
                                  number: _phoneTEControler.text),
                            );
                          });
                        }

                        _nameTEController.clear();
                        _phoneTEControler.clear();
                      },
                      child: Text('Add'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: NumberView(
                      contractDetails: _contractDetails,
                      onDelete: deleteItem,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
