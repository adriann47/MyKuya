import 'package:flutter/material.dart';
import 'package:mykuya/models/activeErrands_models.dart';
import 'package:mykuya/screens/wallet_service.dart';

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
    backgroundColor: Colors.white,
    
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40,),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Errand List',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Color(0XFF55A2F0)
            ),
          ),
        ),
        SizedBox(height: 15,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 100,
                child: Text('ERRAND',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
            Container(
              child: Text('DETAILS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
              )
            ),
            
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                child: Text('STATUS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold 
                ),),
              ),
            )
          ],
        ),
        Container(
          height: 750,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(left: 20,right: 20),
            separatorBuilder: (context, index) => SizedBox(height: 0,), 
            itemCount: activeErrands.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: activeErrands[index].status == 'Completed'
                  ? null
                  : () {
                      popUpDialog(
                        context,
                        activeErrands[index].errand,
                        index,
                        activeErrands[index].imagePath,
                        activeErrands[index].rate,
                      );
                    },
                child: Container(
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
                      Text(
                        activeErrands[index].status,
                        style: TextStyle(
                          color: getStatusColor(activeErrands[index].status)
                        ),)
                    ],
                  ),
                ),
              );
            }
          )
        )
      ],
    ),
    );
  }

  Future popUpDialog(BuildContext context, String errandName, int index, String image, String rate) => showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text(errandName),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(image),
          Text('\$$rate',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0XFF55A2F0)
          ),)
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: (){
                setState(() {
                  activeErrands[index].status = 'Cancelled';
                });
                Navigator.of(context).pop();
              }, 
              child: Text('Cancel',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),)),
            TextButton(
              onPressed: () {
                setState(() {
                  activeErrands[index].status = 'Completed';
                  final parsedrate = int.tryParse(rate.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
                  WalletService().addBalance(parsedrate);
                });
                Navigator.of(context).pop();
              }, 
              child: Text('Complete',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0XFF55A2F0)
              ),)),
          ],
        )
      ],
    )
  );

  Color getStatusColor(String status){
    switch (status) {
      case 'Ongoing':
        return Colors.grey;
        
      case 'Cancelled':
        return Colors.red;
      case 'Completed':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}