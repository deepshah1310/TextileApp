//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_course/app/home/Models/job.dart';
import 'package:flutter_course/app/home/Models/product.dart';
import 'package:flutter_course/app/home/product/list_item_builder.dart';
import 'package:flutter_course/app/home/product/product_list_tile.dart';
import 'package:flutter_course/app/persons/addJob.dart';
import 'package:flutter_course/app/persons/jobListTile.dart';
import 'package:flutter_course/app/persons/jobScreen.dart';
import 'package:flutter_course/app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_course/app/product_details/screen.dart';
class Person extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Need of Job'),
        actions: [
          FlatButton(
            onPressed: () =>
        AddJobPage.show(context),
                // Navigator.push(context, MaterialPageRoute(builder: (_) {
                //   return Provider<Database>(
                //     create: (_) => FirestoreDatabase(uid: user.uid),
                //     child: AddJobPage(),
                //   );
                // })),
            // child: Text(
            //   'Favorite',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 17,
            //   ),
            // )
            child: Text("Add Job")
          )
        ],
      ),
      body: _buildContents(context),

    );

  }
  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Job>>(
        stream: database.jobStream(),
        builder: (context, snapshot) {
          return ListItemsBuilder<Job>(
            snapshot: snapshot,
            itemBuilder: (context, job) => JobListTile(
              job: job,
              onTap: () => JobScreen(job: job),
            ),
            /*    itemBuilder: (context, product) => ItemCard(
            product: product,
            press: () {},
              ),*/
          );
        });
  }
}
