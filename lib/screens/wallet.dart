import 'package:flutter/material.dart';
import 'package:mykuya/screens/wallet_service.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final WalletService _walletService = WalletService();
  final TextEditingController _intController = TextEditingController();

  Future<void> depositDialog() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          'Deposit',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: _intController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter amount',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _intController.clear();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              _depositBalance();
              _intController.clear();
            },
            child: const Text(
              'Confirm',
              style: TextStyle(color: Color(0XFF55A2F0)),
            ),
          ),
        ],
      ),
    );
  }

  void _depositBalance() {
    final int? parsedValue = int.tryParse(_intController.text);
    if (parsedValue != null && parsedValue > 0) {
      setState(() {
        _walletService.addBalance(parsedValue, type: 'Deposit');
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final int balance = _walletService.balance;
    final List<Map<String, dynamic>> transactions = _walletService.transactions;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔵 Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome, Brams!',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/icons/brams.jpg',
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 120,
                                height: 120,
                                color: Colors.grey[300],
                                child: const Icon(Icons.person, size: 40),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Brams Sicat',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text('40 ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text('errands ran',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('6 ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text('errands booked',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // White Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Balance',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Balance Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF55A2F0),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Available Balance',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '\$$balance',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.white70, thickness: 1),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Deposit Button
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF55A2F0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 12),
                        ),
                        onPressed: () {
                          depositDialog().then((_) => setState(() {}));
                        },
                        child: const Text(
                          'Deposit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Transactions Header
                    const Text(
                      'Latest Transactions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Transaction List
                    if (transactions.isEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'No transactions yet',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      )
                    else
                      Column(
                        children: transactions.map((tx) {
                          final isExpense = tx['type'] == 'Hire';
                          return ListTile(
                            leading: Icon(
                              isExpense? Icons.arrow_downward: Icons.arrow_upward,
                              color: isExpense ? Colors.red : Colors.green,
                            ),
                            title: Text(
                              tx['type'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Text(
                              '${isExpense ? '-' : '+'}\$${tx['amount']}',
                              style: TextStyle(
                                color: isExpense ? Colors.red : Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
