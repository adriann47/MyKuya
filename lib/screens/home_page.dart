import 'package:flutter/material.dart';
import 'package:mykuya/models/errand_models.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ErrandModel> errands = [];

  void _getErrands() {
    errands = ErrandModel.getErrands();
  }

  @override
  void initState(){
    _getErrands();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('MyKuya',
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
            searchField(),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text('Common Errands',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xFF55A2F0)
                ),
              ),
            ),
            SizedBox(height: 15,),
            // Horizontal list of errands with clickable cards
            Container(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20,right: 20),
                separatorBuilder: (context, index) => SizedBox(width: 20), 
                itemCount: errands.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, errands[index].route);  // Navigate to selected errand route
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
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(15)
                            ),
                          ), // Display errand name
                          Text(errands[index].errand,
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
