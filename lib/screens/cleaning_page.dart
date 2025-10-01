import 'package:flutter/material.dart';

class CleaningPage extends StatefulWidget {
  const CleaningPage({super.key});

  @override
  State<CleaningPage> createState() => _CleaningPageState();
}

// Cleaning service types
List<String> cleaningTypes = ['Regular Cleaning', 'Deep Cleaning', 'Carwash'];

class _CleaningPageState extends State<CleaningPage> {

  TextEditingController _dateController = TextEditingController();

  String chosenType = cleaningTypes[0];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Close keyboard when tapping outside
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Book Cleaning Services'),
          centerTitle: true,
          backgroundColor: Colors.white,
          ),

        backgroundColor: Colors.white,

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Cleaning types section
            Container(
              margin: EdgeInsets.only(top: 20,left: 20),
              child: Text('Cleaning Types',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF55A2F0)
                ),
              ),
            ),

            // Options with radio buttons
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text('Regular Cleaning',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                    ),
                  ),
                  leading: Radio(
                    value: cleaningTypes[0], 
                    groupValue: chosenType,
                    activeColor: Color(0xFF55A2F0),
                    onChanged: (value) {
                      setState(() {
                        chosenType = value.toString();
                        }
                      );
                    }
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('Light home cleaning to maintain a tidy and fresh space.'),
                ),

                ListTile(
                  title: const Text('Deep Cleaning',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                    ),
                  ),
                  leading: Radio(
                    value: cleaningTypes[1], 
                    groupValue: chosenType, 
                    activeColor: Color(0xFF55A2F0),
                    onChanged: (value) {
                      setState(() {
                        chosenType = value.toString();
                        }
                      );
                    }
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('Intensive cleaning for hard-to-reach areas and built-up grime.'),
                ),

                ListTile(
                  title: const Text('Carwash',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                    ),
                  ),
                  leading: Radio(
                    value: cleaningTypes[2], 
                    groupValue: chosenType, 
                    activeColor: Color(0xFF55A2F0),
                    onChanged: (value) {
                      setState(() {
                        chosenType = value.toString();
                        }
                      );
                    }
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('Exterior and interior car cleaning for a spotless vehicle.'),
                ),

              ],
            ),

            // Date picker section
            Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Text('Pick a Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                ),
              ),
            ),

            // Date input field
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20, top: 10),
                child: TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xFF55A2F0))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xFF55A2F0))
                    )
                  ),
                  readOnly: true,
                  onTap: () {
                    _pickDate();
                  },
                ),
              ),
            ),

            // Location input field
            Container(
              margin: EdgeInsets.only(top: 20,left: 20),
              child: Text('Location',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10, left: 20,right: 20),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF55A2F0))
                  )
                ),
              ),
            ),

            // Price breakdown section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Text('Price Breakdown',
                   style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),

            Spacer(),
      
            // Confirm button
              Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF55A2F0),
                    fixedSize: Size(450, 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                  child: Text('Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                    ),
                  ),
                ),
              )  
          ],
        ),
      ),
    );
  }

  // Pick a date and set it to the text field
  Future<void> _pickDate() async{
    DateTime? _pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025), 
      lastDate: DateTime(2030)
      );

      if (_pickedDate != null) {
        setState(() {
          _dateController.text = _pickedDate.toString().split(" ")[0];
        }
      );
    }
  }
}
