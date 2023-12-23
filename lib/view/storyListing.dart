import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:story360/view/widget/card.dart';
import 'package:story360/view/widget/tdCard.dart';

late final String greeting;

class StoryListing extends StatefulWidget {
  final String name;
  final String profile;
  final int userId;

  const StoryListing(
      {Key? key,
      required this.name,
      required this.profile,
      required this.userId})
      : super(key: key);

  @override
  State<StoryListing> createState() => _StoryListingState();
}

//to get the greeting of the app starting(like good morning,....)
void greet() {
  // Get the current time
  DateTime currentTime = DateTime.now();

  DateTime noon =
      DateTime(currentTime.year, currentTime.month, currentTime.day, 12, 0);
  DateTime evening =
      DateTime(currentTime.year, currentTime.month, currentTime.day, 18, 0);
  DateTime night =
      DateTime(currentTime.year, currentTime.month, currentTime.day, 20, 0);

  // Compare the current time with different times of the day
  if (currentTime.isBefore(noon)) {
    greeting = 'Good Morning';
  } else if (currentTime.isBefore(evening)) {
    greeting = 'Good Afternoon';
  } else if (currentTime.isBefore(night)) {
    greeting = 'Good Evening';
  } else {
    greeting = 'Good Night';
  }
}

class _StoryListingState extends State<StoryListing> {
  var jsonList;

  @override
  void initState() {
    super.initState();
    getData();
    greet();
  }

  Future<void> getData() async {
    try {
      var response = await Dio().get(
          'http://app360dev-001-site17.atempurl.com/api/Interview/Stories?userId=${widget.userId}');
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['content'] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  void _showFullDescriptionDialog(
      String date, String title, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(20.0),
            width: double.infinity,
            height: double.infinity,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFFFFEFE9), width: 8.0),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE8B2A6),
                      minimumSize: Size(47, 47),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back_ios),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF292929),
                      fontSize: 18,
                      fontFamily: 'Sarabun',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Color(0xFF292929),
                      fontSize: 18,
                      fontFamily: 'Sarabun',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String todayDayName = DateFormat('EEEE').format(DateTime.now());
    String name = DateFormat('EEEE').format(DateTime.now()).substring(0, 3);

    String day1 =
        DateFormat('EEEE').format(now.add(Duration(days: 1))).substring(0, 3);
    String day2 =
        DateFormat('EEEE').format(now.add(Duration(days: 2))).substring(0, 3);
    String day3 =
        DateFormat('EEEE').format(now.add(Duration(days: 3))).substring(0, 3);
    String day4 =
        DateFormat('EEEE').format(now.add(Duration(days: 4))).substring(0, 3);
    String day5 =
        DateFormat('EEEE').format(now.add(Duration(days: 5))).substring(0, 3);

    String tdm = DateFormat('MMM').format(DateTime.now());
    String d1 = DateFormat('MMM').format(DateTime.now().add(Duration(days: 1)));
    String d2 = DateFormat('MMM').format(DateTime.now().add(Duration(days: 2)));
    String d3 = DateFormat('MMM').format(DateTime.now().add(Duration(days: 3)));
    String d4 = DateFormat('MMM').format(DateTime.now().add(Duration(days: 4)));
    String d5 = DateFormat('MMM').format(DateTime.now().add(Duration(days: 5)));

    return Scaffold(
      body: Column(
        children: [
          // First Row
          Container(
            height: 100,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 16),
                CircleAvatar(
                  backgroundColor: Colors.brown,
                  backgroundImage: NetworkImage(widget.profile),
                  radius: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFE8B2A6),
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$greeting,',
                      style: TextStyle(
                        color: Color(0xFF371B34),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      widget.name + '!',
                      style: TextStyle(
                        color: Color(0xFFE8B2A6),
                        fontSize: 26,
                        fontFamily: 'Epilogue',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Second Row
          Container(
            height: 100,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tdCard(
                      name: '$name',
                      date: DateTime.now().day,
                      month: '$tdm',
                    ),
                    card(
                      name: '$day1',
                      date: DateTime.now().add(Duration(days: 1)).day,
                      month: '$d1',
                    ),
                    card(
                      name: '$day2',
                      date: DateTime.now().add(Duration(days: 2)).day,
                      month: '$d2',
                    ),
                    card(
                      name: '$day3',
                      date: DateTime.now().add(Duration(days: 3)).day,
                      month: '$d3',
                    ),
                    card(
                      name: '$day4',
                      date: DateTime.now().add(Duration(days: 4)).day,
                      month: '$d4',
                    ),
                    card(
                      name: '$day5',
                      date: DateTime.now().add(Duration(days: 5)).day,
                      month: '$d5',
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Third Row with GridView Builder
          Expanded(
            child: RefreshIndicator(
              onRefresh: getData,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          color: Color(0xFFFFF2E7),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Visibility(
                                    visible: false,
                                    child: Text(
                                      jsonList[index]['createdDate'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    jsonList[index]['title'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Product Sans',
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Visibility(
                                    visible: true,
                                    child: InkWell(
                                      onTap: () {
                                        _showFullDescriptionDialog(
                                          jsonList[index]['createdDate'],
                                          jsonList[index]['title'],
                                          jsonList[index]['description'],
                                        );
                                      },
                                      child: Text(
                                        jsonList[index]['description'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Product Sans',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: jsonList == null ? 0 : jsonList.length,
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(bottom: 16.0, right: 16.0),
              child: FloatingActionButton(
                onPressed: () {
                  // Add your onPressed logic here
                },
                child: Icon(Icons.add),
                backgroundColor: Color(0xFFE8B2A6),
              ),
            ),
          )
        ],
      ),
    );
  }
}
