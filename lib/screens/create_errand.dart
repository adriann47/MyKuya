import 'package:flutter/material.dart';

// Delivery booking page
class CreateErrand extends StatelessWidget {
  const CreateErrand({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Close keyboard when tapping outside of input fields
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        // Page app bar
        appBar: AppBar(
          title: Text('Create an Errand'),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),

        backgroundColor: Colors.white,

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            // Section title: Errand description
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Errand Description',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Box for errand description input (currently empty)
            Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              height: 250,
              width: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color.fromRGBO(207, 216, 220, 1),
                ),
              ),
            ),
      
            // Origin and Destination fields
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),

                // Origin input label
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Origin input field
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: const Color.fromRGBO(207, 216, 220, 1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: const Color.fromRGBO(207, 216, 220, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('Errand Logo',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),

            Spacer(),
            // Price breakdown section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'Price Breakdown',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            Spacer(),

            // Confirm button at bottom of page
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
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),  
          ],
        ),
      ),
    );
  }
}
