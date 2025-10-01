import 'package:flutter/material.dart';
import 'package:mykuya/models/errand_models.dart';
import 'package:mykuya/models/specialized_models.dart';

// HomePage widget (main screen for errands)
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Stores errands data
  List<ErrandModel> errands = [];
  List<SpecializedErrandModel> specialErrands = [];
  // Fetch errands from model
  void _getErrands() {
    errands = ErrandModel.getErrands();
  }

  void _getSpecialErrands(){
    specialErrands = SpecializedErrandModel.getErrands();
  }

  @override
  void initState(){
    _getErrands(); // load errands on start
    _getSpecialErrands();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // hides keyboard when tapping outside TextField
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'MyKuya',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
      
        backgroundColor: Colors.white,
      
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchField(), // top search bar
            SizedBox(height: 20),

            // Section title
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Find a Kuya',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFF55A2F0)
                ),
              ),
            ),
            SizedBox(height: 15,),
      
            // Horizontal scroll list of errands
            Container(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20,right: 20),
                separatorBuilder: (context, index) => SizedBox(width: 20), 
                itemCount: errands.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    // Navigate to selected errand screen
                    onTap: () {
                      Navigator.pushNamed(context, errands[index].route);
                    },
                    child: Container(
                      height: 220,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Placeholder for errand image
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Image.asset(errands[index].imagePath),
                          ),
                          // Errand title
                          Text(
                            errands[index].errand,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              )
            ),
            // Section title
            /* Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Special Errands',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFF55A2F0)
                ),
              ),
            ), */
            SizedBox(height: 15,),
      
            // Horizontal scroll list of errands
            Container(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20,right: 20),
                separatorBuilder: (context, index) => SizedBox(width: 20), 
                itemCount: specialErrands.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    // Navigate to selected errand screen
                    onTap: () {
                      Navigator.pushNamed(context, specialErrands[index].route);
                    },
                    child: Container(
                      height: 220,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Placeholder for errand image
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Image.asset(specialErrands[index].imagePath),
                          ),
                          // Errand title
                          Text(
                            specialErrands[index].errand,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              )
            )
          ],
        ),
      ),
    );
  }

  // Search bar widget
  Container searchField() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: const Color.fromRGBO(207, 216, 220, 1),)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xFF55A2F0))
          ),
          hintText: 'Search for errands'
        ),
      ),
    );
  }
}