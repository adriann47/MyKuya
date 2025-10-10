import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<ErrandModel> filteredErrands = [];
  List<SpecializedErrandModel> specialErrands = [];
  String category = '';
  String addPath = '';
  String addType = '';
  String addRoute = '';
  TextEditingController searchController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  // Fetch errands from model
  void _getErrands() {
    errands = ErrandModel.getErrands();
    filteredErrands = errands;
  }

  void _getSpecialErrands(){
    specialErrands = SpecializedErrandModel.getErrands();
  }
  @override
  void initState(){
    _getErrands(); // load errands on start
    _getSpecialErrands();

    searchController.addListener(filterErrands);
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
            SizedBox(height: 10),
            // Section title
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                  'Run Errands',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color(0xFF55A2F0)
                  ),
                ),
            ),

            SizedBox(height: 10),
            Expanded(
              child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.79,
                children: List.generate(filteredErrands.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, filteredErrands[index].route);
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
                              filteredErrands[index].imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:8.0),
                            child: Text('800 meters away',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12
                              ),
                            )
                          ),
                          // Title
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              filteredErrands[index].errand,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:8.0),
                            child: Text(
                            'Starts at \$${errands[index].rate}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                              ),
                            )
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
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
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
          ),
          SizedBox(width: 10),
          ElevatedButton(onPressed: (){ topUpDialog();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF55A2F0),
            fixedSize: Size(50, 50),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,)
            )
        ],
      ),
    );
  }

  Future topUpDialog() => showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Add Errand',
      style: TextStyle(
        fontWeight: FontWeight.bold
        ),
      ),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setDialogState){
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Errand Title'
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: rateController,
                decoration: InputDecoration(
                  hintText: 'Rate'
                ),
              ),
              SizedBox(height: 10,),
              RadioListTile(
                title: Text('Tech Help'),
                value: 'tech', 
                groupValue: category, 
                onChanged: (value) {
                  setDialogState(() {
                    category = value!;
                    }
                  );
                }
              ),
              RadioListTile(
                title: Text('Cleaning Services'),
                value: 'clean', 
                groupValue: category, 
                onChanged: (value) {
                  setDialogState(() {
                    category = value!;
                    }
                  );
                }
              ),
              RadioListTile(
                title: Text('Shopping'),
                value: 'shopping', 
                groupValue: category, 
                onChanged: (value) {
                  setDialogState(() {
                    category = value!;
                    }
                  );
                }
              ),
              RadioListTile(
                title: Text('Pet Sitting'),
                value: 'pet', 
                groupValue: category, 
                onChanged: (value) {
                  setDialogState(() {
                    category = value!;
                    }
                  );
                }
              ),
            ],
          ),
        );
        }
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: (){Navigator.of(context).pop();}, 
              child: Text('Cancel',
              style: TextStyle(
                color: Colors.grey
                ),)
            ),
            TextButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                rateController.text.isNotEmpty &&
                category.isNotEmpty) {

                  switch (category) {
                    case 'tech':
                      addPath = 'assets/icons/techhelp2.png';
                      addType = 'Tech Help';
                      addRoute = '/deliverypreview';
                      break;
                    case 'clean':
                      addPath = 'assets/icons/klining.png';
                      addType = 'Cleaning';
                      break;
                    case 'shopping':
                      addPath = 'assets/icons/grusire.png';
                      addType = 'Shopping';
                      break;
                    case 'pet':
                      addPath = 'assets/icons/pitsiting.png';
                      addType = 'Pet Sitting';
                      break;
                    default:
                  }
                  
                  _addErrand(
                    ErrandModel(
                      errand: titleController.text, 
                      imagePath: addPath, 
                      rate: rateController.text,
                      type: addType,
                      route: '/newErrand'
                    )
                  );

                  titleController.clear();
                  rateController.clear();
                  setState(() {
                    category = '';
                  });
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please Fill all fields.')),
                    );
                }
              }, 
              child: Text('Add',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF55A2F0)
              ),))
          ],
        )
      ],
    )
  );
  
  void _addErrand(ErrandModel newErrand) {
    setState(() {
      errands.add(newErrand);
    });

    filterErrands();

  }
  void filterErrands () {
    final query = searchController.text.toLowerCase();

    setState(() {
      filteredErrands = errands.where((errand) {
        return errand.type.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}