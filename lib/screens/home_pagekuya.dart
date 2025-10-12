import 'package:flutter/material.dart';
import 'package:mykuya/models/kuya_model.dart';

// HomePage widget (main screen for errands)
class HomePageKuya extends StatefulWidget {
  HomePageKuya({super.key});

  @override
  State<HomePageKuya> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageKuya> {
  List<KuyaModel> kuyas = [];

  void _getKuyas(){
    kuyas = KuyaModel.getkuyas();
  }

  @override
  void initState(){
    //Load kuya models on start
    _getKuyas();
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
          title: Image.asset('assets/icons/mainlogo.png', height: 40),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
      
        backgroundColor: Colors.white,
      
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchField(), // top search bar
            SizedBox(height: 15),

            // Section title
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Book Errands',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFF55A2F0)
                ),
              ),
            ),
            
            SizedBox(height: 50),

            Expanded(
              child:Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.70,
                  children: List.generate(kuyas.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        acceptDialog(
                          context, 
                          kuyas[index].kuya, 
                          kuyas[index].imagePath);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),  
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image
                            Container(
                              height: 180,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset(
                                kuyas[index].imagePath,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    kuyas[index].kuya,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.star,
                                color: Color(0xFF55A2F0),
                                size: 16,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text('4.5'),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                kuyas[index].work,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                kuyas[index].location,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),    
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
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
          hintText: 'Search for kuyas'
        ),
      ),
    );
  }

  Future acceptDialog(BuildContext context, String kuyaName, String image) => showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Hire $kuyaName'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.star,
                color: Color(0XFF55A2F0),
                size: 32,
              ),
              Text('4.5',
                style: TextStyle(fontSize: 24
                ),
              )
            ],
          ),
          Image.asset(image),
          Text('\$1000',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0XFF55A2F0)
            ),
          )
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                }, 
              child: Text('Cancel',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey
                ),
              )
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                }, 
                child: Text('Accept',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF55A2F0)
                )
              )
            )
          ],
        )
      ],
    )
  );
}