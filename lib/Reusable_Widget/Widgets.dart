// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payer/Reusable_Widget/Colors.dart';


class ReusableWidget{

// BoxDecoration shadowDecoration(){
//  return BoxDecoration(
//     color: Colors.white,
//   borderRadius: BorderRadius.circular(15),  
//     boxShadow: [

//       BoxShadow(
//        offset: Offset(0, 1),
//         blurRadius: 25,
//         color: Colors.black.withOpacity(0.2),
//         ),
      
//     ],
//   );
// }

BoxDecoration ContainerDecoration(){
 return BoxDecoration(
    color: BlueColor,
  borderRadius: BorderRadius.circular(20),  
 );
}

Widget payContainer({required Image image}){
  return  Container(
                
                // margin: EdgeInsets.fromLTRB(20, 8, 8, 16),
                width: 61,
                height: 61,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2.5,
                    )),
                child: image
              );
}
Widget NoPayContainer({required Image image}){
  return  Container(
                
                // margin: EdgeInsets.fromLTRB(20, 8, 8, 16),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: circleGraycolor,
                      width: 0.6,
                    )),
                    child: image,
              );
}
Widget TextFieldContainer({required hintText }){
  return Container(
    height: 38,
    width: double.infinity,
     decoration: BoxDecoration(
      color: liteBlue,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    shape: BoxShape.rectangle,
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      cursorWidth: 1.5,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 14,color: circleGraycolor),
                          hintText:hintText,
                          
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(17),
                        ),
                      ),

  );
}

Widget ButtonContainer(){
  return Container(
    height: 60,
    width: double.infinity,
     decoration: BoxDecoration(
      color: GreenColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    shape: BoxShape.rectangle,
                    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 25,right: 25),
      child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text("Rs. 3025.00",style: GoogleFonts.dmSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color:Colors.white)),
                               Row(
                                 children: [
                                   Text("Checkout",style: GoogleFonts.dmSans(
                                                fontSize: 15,
                                                // fontWeight: FontWeight.bold,
                                                color:Colors.white)),
                                   Icon(Icons.arrow_forward,color: Colors.white,)             
                                 ],
                               ),
    
                             ],),
    ),

  );
}
// BoxDecoration GreyDecoration(){
//  return BoxDecoration(
//     color: lightgraycolor,
//   borderRadius: BorderRadius.circular(15),  
//  );
// }

Widget PhoneContainer({required url}){
 return
 Container(
  child:Image.asset(url) ,
  height: 70,
  width: 70,
  decoration: BoxDecoration(
    color: Green,
  borderRadius: BorderRadius.circular(10),  

    
      
    
  )
 );
 
}

Widget totalContainer({required String count}){
  return Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black,width: 0.5),
    color: Colors.white,
  borderRadius: BorderRadius.circular(10),),
  child: Center(child: Text(count)),
  );

}

}