import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/app/dashboard/constants.dart';
import 'package:flutter_course/app/home/Models/product.dart';
import 'package:flutter_course/app/product_details/detail.dart';
import 'package:flutter_course/app/product_details/detail_screen.dart';
import 'package:flutter_course/app/product_details/screen.dart';
import 'package:flutter_course/app/services/database.dart';
import 'package:provider/provider.dart';

class MyProductListTile extends StatelessWidget {
  const MyProductListTile({Key key, @required this.product, this.onTap })
      : super(key: key);
  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context ,listen: false);
    /* return ListTile(
      title: Text(product.name),
      subtitle: Text(
          'Price : ${(product.price).toString()}\nSpecification : ${(product
              .specification).toString()}\nContact No : ${(product.contact)
              .toString()}\nAddress : ${(product.address).toString()}'),
      trailing: Icon(Icons.chevron_right),
      onTap: () => Screen(product: product,),

    );*/
    return Container(
      //color: Colors.teal[50],
      child: Container(
        margin: EdgeInsets.all(10),
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: Colors.teal[900],
            )),
        child: GestureDetector(
          onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(product: product))),
          //margin: EdgeInsets.all(10),
          /* decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: Colors.blueGrey,
                )),
*/
          child: Row(
            children: [
              SizedBox(width: 8.0,),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(product.imgUrl,
                  width: 100,

                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${product.name}',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[900]),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price : ${product.price}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ksecond),
                            overflow: TextOverflow.ellipsis,
                          ),
                          IconButton(icon: Icon(Icons.delete_forever), onPressed: ()=>{
                            showDialog(context: context,builder: (context){
                              return AlertDialog(
                                title: Text("Are you sure ?"),
                                content: Text("Do you really want to delete the post?"),
                                actions: [
                                  FlatButton(onPressed: ()=> Navigator.of(context).pop(), child: Text("no")),
                                  FlatButton(onPressed: () { database.deleteProduct("product/${product.documentId}");
                                  Navigator.of(context).pop();}, child: Text("yes")),


                                ],
                              );
                            })
                          })
                        ],
                      ),
                      SizedBox(height: 4.0,),
                      Text(
                        'Contact No : ${product.contact}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ksecond),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
