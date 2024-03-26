import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenMessages extends StatelessWidget {
  const ScreenMessages({super.key});

  @override
  Widget build(BuildContext context) {
    ////////////////////////////////////////////////////////////////mediaqueryyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy
    final screenwidth = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Messages",
          style: GoogleFonts.merriweather(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 1)],
              border: Border.all(color: Colors.black),
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 40,
                  right: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 227, 224, 224),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        hintStyle: GoogleFonts.quicksand(),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Chats",
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.grey),
                      title: Text("Harshal (employee)",
                          style: GoogleFonts.alata()),
                      subtitle: Text(
                          "hey, we are intrested to have a discussion with you"),
                      trailing: Column(
                        children: [
                          Text(
                            "2 minutes ago",
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: 17,
                            height: 17,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text(
                                "1",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 7),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
