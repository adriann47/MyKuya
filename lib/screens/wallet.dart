import 'dart:async';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  TextEditingController _intController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('My Wallet',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28
          ),
        ),
      ),

      backgroundColor: Colors.white,

      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: atmCard(), // ATM card UI container
          ),

          SizedBox(
            height: 30,
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF55A2F0)
            ),
            onPressed: () {
              topUpDialog();
            },
            child: Text('Top Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16
                ),
              ),
            ),
            SizedBox(
              height: 30
              ),
            Align(
              alignment: Alignment.topLeft ,
              child: Container(
                margin: EdgeInsets.only(left: 30),
                child: Text('Latest Transactions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),)
                )
              )
          ]
      ),
    );
  }

  Future topUpDialog() => showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Top Up',
      style: TextStyle(
        fontWeight: FontWeight.bold
        ),
      ),
      content: TextField(
        controller: _intController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Enter amount'
          ),
        ),
      // Dialog action buttons: Cancel and Confirm
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {Navigator.of(context).pop();}, 
                child: Text('Cancel',
                style: TextStyle(
                  color: Colors.grey[900]
                ),)
                ),

              TextButton(
                onPressed: () {
                  _topUpBalance();
                  _intController.clear();
                }, 
                child: Text('Confirm',
                style: TextStyle(
                  color: Colors.grey[900]
                ),)
                ),
            ],
          ),
        ],
      )
    );

  int balance = 0;

  // Add entered amount to balance
  void _topUpBalance(){
    final int? parsedValue = int.tryParse(_intController.text);
    if (parsedValue != null) {
      setState(() {
        balance += parsedValue; // Update balance
        });
      Navigator.of(context).pop();
    }
  }
  
  // ATM card UI container
  Container atmCard() {
    return Container(
            margin: EdgeInsets.only(top: 20),
            height: 250,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFF55A2F0)
            ),

            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text('P O N S I L I C I O U S',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26
                      ),
                    ),
                  ),
                ),
                
                Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 20),
                      child: Text('Current Balance:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                        ),
                      ),
                    ),
          
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, right: 20),
                      child: Text('\$ ${balance.toString()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          );
  }
}
