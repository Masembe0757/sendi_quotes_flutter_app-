import 'package:flutter/material.dart';
import 'package:quotes/Qts.dart';

void main() {
  runApp(MaterialApp(
    home: Quote(),
  ));
}
class Quote extends StatefulWidget {
  const Quote({super.key});

  @override
  State<Quote> createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  List<Quotes> qts = [
    Quotes("All or nothing", "Sendi Joseph"),
    Quotes("All is well that ends well", "Farnando"),
    Quotes("Unfaced fears become our limits", "Rolland fillips"),
    Quotes("Be good like no one is watching", "Marrie curie"),
    Quotes("Life is what you make it", "Markenzi Packson"),
    Quotes("Celebrate yourself no one knows what it takes to be you", "Klaus Mikaelson"),
    Quotes("If you cant be loved then make sure your feared", "Klaus Mikaelson"),
    Quotes("In a group of blind people, a one eyed man is a king", "Elijah"),
    Quotes("Beauty creates the first impression but character keeps a man", "Rebecca peruth")
  ];

  Widget quoteTemplate (quot, {required Null Function() delete}){
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                quot.quote,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600]
            ),
            ),
            SizedBox(height: 6,),
            Text(
              quot.author,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800]
              ),
            ),
            SizedBox(height: 2),
            TextButton.icon(

                 onPressed: delete,
              icon: Icon(Icons.delete, color: Colors.red,),
              label: Text("Delete quote",style: TextStyle(fontSize: 11,color: Colors.red),),

            )

          ],
        ),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.redAccent[200],
        title: Center(child: Text("My quotes")),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: qts.map((quot) =>
              quoteTemplate(
                  quot,
                  delete: (){
                    setState(() {
                      qts.remove(quot);
                    });
                  }
              ),
            
          ).toList(),
        ),
      ),
    );
  }
}

