import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/MarksPredictionProvider.dart';

class MarksPredictionScreen extends StatelessWidget {
  const MarksPredictionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _studyHoursController = TextEditingController();

    return Scaffold(
      body: Consumer<MarksPredictionProvider>(
        builder: (context, provider, _) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Color.fromRGBO(196, 135, 198, .3)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(196, 135, 198, 1),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _studyHoursController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Study Hours',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: provider.isLoading
                  ? null
                  : () {
                final double studyHours =
                    double.tryParse(_studyHoursController.text) ?? 0;
                provider.getMarks(studyHours);
              },
              child: Container(
                  width: MediaQuery.of(context).size.width-200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(75, 0, 130, 1),
                  ),

                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("Get Marks",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),)
                  ),),
            ),
            SizedBox(height: 16),
            if (provider.isLoading)
              CircularProgressIndicator()
            else
              Container(
                margin: EdgeInsets.all(20),
                width: 265,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text("Predicted Marks: ${provider.marks}"),
                      ),
                      SizedBox(height: 16),
                      if (provider.image.isNotEmpty) Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(provider.image,),
                      )
                      else
                        Text("no prediction made yet")
                    ],
                  ),



              ),

          ],
        ),
      ),
    );
  }
}
