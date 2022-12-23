import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodtrips/SiteDataModels.dart';
import 'package:goodtrips/widgets/home_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {

  var category = [
    'Best Places',
    'Most Visited',
    'Favorites',
    'New Added',
    'Hotels',
    'Restaurants'];

  var siteInfos = [
    'Lomé, 10km',
    'Kara, 15km',
    'Atakpamé, 10km',
    'Lomé, 10km',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: HomeAppBar(),
          preferredSize: Size.fromHeight(90.0),
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30,),
            child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index){
                        return InkWell(
                          onTap: (){

                          },
                          child: Container(
                            width: 160,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage("images/one${index+1}.jpg"),
                                  fit: BoxFit.cover,
                                  opacity: 0.7,),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.bookmark_border_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text("Site Name",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,

                                  ),),
                                ),

                              ],
                            ),
                          ),
                        );
                      }),
                    ),
        ),
              ],
            ),
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                  padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    for(int i =0; i<6; i++)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: Text(
                        category[i],
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
              return Padding(
                  padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){

                      },
                     child: Container(
                       height: 200,
                       decoration: BoxDecoration(
                         color: Colors.black,
                         borderRadius: BorderRadius.circular(10),
                         image: DecorationImage(
                             image: AssetImage("images/one${index+1}.jpg"),
                         fit: BoxFit.cover,
                         opacity: 0.8)
                       ),
                     ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Site Name',
                            style:
                            GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(Icons.star,
                        color: Colors.amber,
                        size: 20,),
                        Text('4.6',
                        style: GoogleFonts.poppins(
                        ),)
                      ],
                    )
                  ],
                ),
              );
            }),
          ],
        ),
      ),
          ),
      ),
    );
  }
  Future<List<SiteDataModels>> ReadJsonData() async {
    final jsondata = await rootBundle.loadString('jsonfile/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => SiteDataModels.fromJson(e)).toList();
  }
}