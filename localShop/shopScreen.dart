import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/app/dashboard/constants.dart';
import 'package:flutter_course/app/home/Models/job.dart';
import 'package:flutter_course/app/home/Models/shop.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopScreen extends StatelessWidget {
  Shop shop;
  ShopScreen({@required this.shop});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Shop Detail"),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              // left: 0,
              // right: 0,
              // bottom: 0,
              // //height: MediaQuery.of(context).size.height / 2,
              child: Container(
                padding: const EdgeInsets.all(20.0),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(

                        child: Text(
                          "${shop.title}",
                          style: TextStyle(
                              color: Colors.teal[800],
                              fontSize: 26,
                              fontWeight: FontWeight.bold),                      ),
                      ),

                      SizedBox(
                        height: 15.0,
                      ),
                      RichText(
                        text :TextSpan(
                          text : "Product Description",
                          style: TextStyle(color: Colors.teal[300])
                          // fontSize: 18,
                          // fontWeight: FontWeight.bold
                          ,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "${shop.description}",
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .apply(color: Colors.grey),
                        //maxLines: 3,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'Email : ',
                              style: TextStyle(color: Colors.teal[300]))),
                      Text(
                        "${shop.email}",
                        style: TextStyle(
                            color: ksecond,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'Address : ',
                              style: TextStyle(color: Colors.teal[300]))),
                      Text(
                        "${shop.address}",
                        style: TextStyle(
                            color: ksecond,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),

                      RichText(
                          text: TextSpan(
                              text: 'Contact No :',
                              style: TextStyle(color: Colors.teal[300]))),
                      // SizedBox(
                      //   height: 2,
                      // ),
                      Row(
                        children: [
                          Text(
                            '${shop.contact_no}',
                            style: TextStyle(
                                color: ksecond,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          new IconButton(icon: Icon(Icons.phone,color: Colors.green,size: 30,), onPressed: () => launch("tel:${shop.contact_no}"),)
                        ],
                      ),
                      // Text(
                      //   "Photos",
                      //   style: Theme.of(context).textTheme.subhead,
                      // ),
                      //SizedBox(height: 5),
                      // Container(
                      //   height: 80,
                      //   child: ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: jobList[id].photos.length,
                      //     itemBuilder: (ctx, i) {
                      //       return Padding(
                      //         padding:
                      //         const EdgeInsets.symmetric(horizontal: 9.0),
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(15.0),
                      //           child:
                      //           Image.asset("${jobList[id].photos[i]}"),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 15.0,
                      // ),
                      // Container(
                      //   width: MediaQuery.of(context).size.height * .7,
                      //   height: 45,
                      //   child: RaisedButton(
                      //     child: Text(
                      //       "Apply For Job",
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .button
                      //           .apply(color: Colors.white),
                      //     ),
                      //     color: Colors.blue,
                      //     onPressed: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(builder: (context) {
                      //           return ApplyForJob();
                      //         }),
                      //       );
                      //     },
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
