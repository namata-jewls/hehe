import 'package:exer5_app/drawer.dart';
import 'package:exer5_app/profile.dart';
import 'package:exer5_app/summaryData.dart';
import 'package:flutter/material.dart';

//Displays the friend list of the user
class FriendsPage extends StatefulWidget {
  // must have the saved summaries
  final List<SummaryData>? summaries;
  const FriendsPage({this.summaries, super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friends"),
      ),
      drawer: const DrawerWidget(),
      // show list if the summaries list is not empty, 
      // otherwise, shows a message  
      body: widget.summaries!.isNotEmpty ? 
        ListView.builder(
          itemCount: widget.summaries!.length,
          itemBuilder: (BuildContext context, int index){
            // A container that has a child list tile which contains a button and the friend's name
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal:15),
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient( 
                  colors: [ 
                    Color.fromARGB(255, 69, 39, 160), 
                    Colors.white 
                  ]
                )
              ),
              child: ListTile(
              title: Text(widget.summaries![index].name), // Name of friend
              // button for showing the friends details
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                ),
                child: const Text("View Details", style: TextStyle(color: Colors.white)),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(widget.summaries![index].name, widget.summaries![index].nickname, widget.summaries![index].age, widget.summaries![index].inRelationship, widget.summaries![index].happinessLevel, widget.summaries![index].superpower, widget.summaries![index].motto,)),
                )
              )
            )
            );
          },
        )
        // this is shown when summaries list is empty
        : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.group),
              const Text("No friends added yet"),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/second");
                  }, 
                  child: const Text("Go to Slambook", style: TextStyle(color: Color.fromARGB(255, 18, 6, 37), fontWeight: FontWeight.bold))
                )
              )
            ]
          ) 
        ),
    );
  }
}