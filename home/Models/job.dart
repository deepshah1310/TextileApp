import 'package:flutter/cupertino.dart';

class Job{
  final String title, address,company_name,description;

  final int contact_no,salary;
// final List<String> photos;

  Job(
      {
        @required this.salary,
      @required this.address,
       // @required this.no_employee,
        @required this.contact_no,
        @required this.description,
        @required this.company_name,
        @required this.title});
  factory Job.fromMap(Map<String,dynamic>data){
    if(data == null){
      return null;
    }
    final String title =data['title'];
    final String company_name=data['company_name'];
    final String address =data['address'];
    final int contact_no =data['contact_no'];
    final int salary = data['salary'];
    final String description= data['description'];
   // final String id = data['id'];

    return Job(title: title, company_name: company_name, address: address , contact_no: contact_no ,salary: salary,description: description );
  }
  Map<String , dynamic> toMap(){
    return{
      'title' : title,
      'company_name' : company_name,
      'contact_no' :contact_no,
     // 'no_employee' : no_employee,
      'address' : address,
      'salary' : salary,
      'description' : description
      //'id' : uid,
    };
  }
}
