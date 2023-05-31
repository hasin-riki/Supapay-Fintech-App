
  import 'package:flutter/material.dart';

Future<dynamic> showTransactionInfo(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Spacer(),
                        Text(
                          "Amount",
                          style: TextStyle(fontSize: 25),
                        ),
                        Spacer()
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      title: Text("To"),
                      trailing: Text("Username"),
                    ),
                    const ListTile(
                      title: Text("From"),
                      trailing: Text("Hasin"),
                    ),
                    const ListTile(
                      title: Text("Transaction ID"),
                      trailing: Text("XXXXX"),
                    ),
                    const ListTile(
                      title: Text("Acc Number"),
                      trailing: Text("03110887898"),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }