import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:supapay/features/home/components/bottom_sheet.dart';
import 'package:supapay/features/home/models/transaction_model.dart';
import 'package:supapay/features/home/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.transactions,
    required this.onRefresh,
    required this.userData,
  }) : super(key: key);

  final List<TransactionModel> transactions;
  final Function onRefresh;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return onRefresh();
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person), backgroundColor: const Color(0xFF1C6758)),
                    title: Text(userData.name!),
                    trailing: Image.network(
                        'https://static.vecteezy.com/system/resources/previews/022/100/815/non_2x/master-card-logo-transparent-free-png.png'),
                    subtitle: const Text("Hello There!"),
                  ),
                  ListTile(
                    title: const Text("Total Balance:"),
                    trailing: Text(
                      "Rs. ${userData.balance}",
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              iconSize: 35,
                              icon: const Icon(Icons.send),
                              onPressed: () {
                                Navigator.pushNamed(context, '/home/sendFunds')
                                    .whenComplete(() {
                                  onRefresh();
                                });
                              },
                            ),
                            const Text("Send Funds"),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              iconSize: 35,
                              icon: const Icon(Icons.monetization_on),
                              onPressed: () {
                                Navigator.pushNamed(context, '/home/addFunds',
                                    arguments: userData);
                              },
                            ),
                            const Text("Add Funds"),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              iconSize: 35,
                              icon: const Icon(Icons.more_horiz_outlined),
                              onPressed: () {
                                bottomSheetMore(context);
                              },
                            ),
                            const Text("More")
                          ],
                        )
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ).animate().fadeIn().shimmer(),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
              child: Text(
                "Recent Transactions",
                style: TextStyle(fontSize: 25),
              ),
            ).animate().fadeIn(),
            for (var data in transactions)
              data.amount! > 0
                  ? Card(
                      child: ListTile(
                      leading: const Icon(
                        Icons.arrow_circle_right_rounded,
                        color: Colors.green,
                      ),
                      title: Text(data.from!),
                      subtitle: Text(data.date!),
                      trailing: Text(data.amount.toString()),
                      onTap: () {
                        showTransactionInfo(context, data);
                      },
                    )).animate().fadeIn()
                  : Card(
                      child: ListTile(
                      leading: const Icon(
                        Icons.arrow_circle_left_rounded,
                        color: Colors.red,
                      ),
                      title: Text(data.to!),
                      subtitle: Text(data.date!),
                      trailing: Text(data.amount.toString()),
                      onTap: () {
                        showTransactionInfo(context, data);
                      },
                    )).animate().fadeIn(),
            Card(
              child: ListTile(
                title: const Text("See More"),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.pushNamed(context, '/home/transactions');
                },
              ),
            ).animate().fadeIn()
          ],
        ),
      ),
    );
  }
}
