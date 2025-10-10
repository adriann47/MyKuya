import 'package:flutter/material.dart';
import 'package:mykuya/models/activeErrands_models.dart';

class History extends StatefulWidget {
  History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<ActiveErrands> activeErrands = [];

  void _getActiveErrands() {
    setState(() {
      activeErrands = ActiveErrands.getActive();
    });
  }

  @override
  void initState(){
    super.initState();
    _getActiveErrands();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyErrands'),
      ),
    backgroundColor: Colors.white,
    
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Active Errands',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black
            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          height: 750,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(left: 20,right: 20),
            separatorBuilder: (context, index) => SizedBox(height: 0,), 
            itemCount: activeErrands.length,
            itemBuilder: (context, index){
              /* return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, activeErrands[index].route)
                },
              ); */
              return Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset(activeErrands[index].imagePath),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activeErrands[index].errand,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                          ),
                        ),
                         Text(
                      '\$${activeErrands[index].rate}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF55A2F0)
                      ),
                    )
                      ],
                    ),
                    Spacer(),
                   
                  ],
                ),
              );
            }
          )
        )
      ],
    ),
    );
  }
}