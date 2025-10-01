import 'package:flutter/material.dart';

class DeliveryPreview extends StatelessWidget {
  const DeliveryPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Viewing Errand',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white
        ),
        ),
        backgroundColor: Color(0xFF55A2F0),
      ),
      backgroundColor: Colors.white,
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Center(
            child: Text(
              'Delivery',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Container(
            child: Image.asset('assets/icons/techhelp2.png')
          ),
          Text('Errand Details',
                  style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF55A2F0),
                  fontWeight: FontWeight.bold
                  ),
                ),
              Text('Laptop Won\'t Connect to Wifi',
                  style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 1, 1, 1),
                  fontWeight: FontWeight.bold
                  ),
                ),
              Text('Description',
                style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                  ),
                ),
              Text('Laptop stopped connecting to WiFi since yesterday.',
                style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                  ),
                ),
                Text('Other devices in the house are working fine.',
                style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                  ),
                ),
                Text('Needs troubleshooting on laptop settings.',
                style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                  ),
                ),

                Spacer(),
                
                Container(
                  margin: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF55A2F0),
                  fixedSize: Size(450, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Accept Errand',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
        ],
      )
    );
  }
}