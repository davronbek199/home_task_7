import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            collapsedHeight: 90,
            // floating: true,
            // primary: true,
            leading: Icon(
              Icons.format_align_left,
              color: Colors.black,
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 12),
                child: (Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                )),
              )
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            backgroundColor: Colors.orangeAccent.shade100,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 40, bottom: 24),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    progressColor: Color(0xFFE57373),
                    backgroundColor: Colors.orangeAccent.shade100,
                    radius: 36,
                    lineWidth: 3.0,
                    percent: 0.75,
                    center: CircleAvatar(
                      backgroundColor: Color(0xFFEF5350),
                      radius: 30,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            "https://infosive.com/wp-content/uploads/man3.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Phillip Mccoy',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Project Manager',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My tasks",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      CircleAvatar(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        radius: 36,
                        child: Icon(Icons.calendar_today_outlined),
                      ),
                    ],
                  ),
                ),
                myWidget(Colors.red.shade300, Icons.access_time_rounded, "To Do",
                    "5 tasks now - 1 started"),
                myWidget(Colors.orangeAccent.shade100, Icons.light_mode_outlined,
                    "In Progress", "! task now - 1 started"),
                myWidget(Colors.indigo.shade300, Icons.play_arrow_outlined, "Done",
                    "18 tasks now - 18 complated"),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Active Projects",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        myClipRRect(Colors.teal, 0.25, Colors.teal.shade400, "25%", "Medical App", "9 hours progress"),
                        myClipRRect(Colors.red.shade300, 0.75, Colors.red.shade200, "75%", "Sport App", "40 hours progress"),
                      ],
                    ),
                    SizedBox(height: 26,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        myClipRRect(Colors.orangeAccent.shade100, 0.50, Colors.orangeAccent.shade100, "50%", "Finance App", "20 hours progress"),
                        myClipRRect(Colors.indigo.shade300, 1.0, Colors.indigo.shade300, "100%", "Education App", "80 hours progress"),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myWidget(color, icon, text1, text2) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0, bottom: 28),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: color,
            foregroundColor: Colors.white,
            child: Icon(icon),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                text2,
                style: TextStyle(color: Colors.black45),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget myClipRRect(
    color, percent, backColor, percentText, appText, progressText) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(40),
    child: Container(
      alignment: Alignment.topLeft,
      width: 150,
      height: 200,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircularPercentIndicator(
            radius: 40,
            percent: percent,
            progressColor: Colors.white,
            backgroundColor: backColor,
            center: Text(
              percentText,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appText,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                Text(
                  progressText,
                  style: TextStyle(color: Colors.white60),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
