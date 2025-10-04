import 'package:flutter/material.dart';

class DeliveryPreview extends StatelessWidget {
  const DeliveryPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Viewing Errand',
        style: TextStyle(
          fontWeight: FontWeight.w600,
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
              'Tech Help',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Image.asset('assets/icons/techhelp2.png'),
          Padding(
            padding: EdgeInsetsGeometry.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text('Errand Details',
                  style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF55A2F0),
                  fontWeight: FontWeight.w600
                  ),
                ),
              Text('Laptop Won\'t Connect to Wifi',
                  style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 1, 1, 1),
                  fontWeight: FontWeight.w600
                  ),
                ),
              Text('Description',
                style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600
                  ),
                ),
              Text('Laptop stopped connecting to WiFi since yesterday.',
                style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                  ),
                ),
                Text('Other devices in the house are working fine.',
                style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                  ),
                ),
                Text('Needs troubleshooting on laptop settings.',
                style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                  ),
                ),
              ],
            ),),
              /* Text('Errand Details',
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
                ), */

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