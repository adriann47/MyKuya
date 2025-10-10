import 'package:flutter/material.dart';
import 'package:mykuya/models/activeErrands_models.dart';

class CleaningPreview extends StatefulWidget {
  const CleaningPreview({super.key});

  @override
  State<CleaningPreview> createState() => _CleaningPreviewState();
}

class _CleaningPreviewState extends State<CleaningPreview> {
List<ActiveErrands> activeErrands = [];

void _getActiveErrands() {
  activeErrands = ActiveErrands.getActive();
}

@override
void initState(){
  _getActiveErrands();
}

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
              'Cleaning',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Image.asset('assets/icons/klining.png'),
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
              Text('Clean My Office',
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

                Spacer(),
                
                Container(
                  margin: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  ActiveErrands newErrand = ActiveErrands(
                    errand: 'Clean Aircon', 
                    type: 'Cleaning', 
                    rate: '67', 
                    imagePath: 'assets/icons/klining.png',
                    );

                    ActiveErrands.addErrand(newErrand);
                    Navigator.pushNamedAndRemoveUntil(context, '/layout', (route) => false);
                }, 
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