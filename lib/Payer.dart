// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:payer/Reusable_Widget/Colors.dart';
import 'package:payer/Reusable_Widget/Widgets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Payer extends StatefulWidget {
  const Payer({Key? key}) : super(key: key);

  @override
  State<Payer> createState() => _PayerState();
}

class GridPay {
  const GridPay({this.image, this.id});

  final String? image;
  final int? id;
}

class PhnList {
  PhnList(
      {this.image,
      this.id,
      this.brands,
      this.spec,
      this.items,
      this.price,
      required this.count});

  String? image;
  int? id;
  String? brands;
  String? spec;
  String? items;
  int? price;
  int? count;
}

class _PayerState extends State<Payer> {
// ============= Payment Option ==================
  List<GridPay> cardType = <GridPay>[
    GridPay(
      image: "assets/mc.png",
      id: 0,
    ),
    GridPay(
      image: "assets/am.png",
      id: 1,
    ),
    GridPay(image: "assets/pp.png", id: 2),
    GridPay(image: "assets/visa.png", id: 3),
  ];

  final reuse = ReusableWidget();
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  bool isSelected = false;
  int selectedCard = 0;
  String? dropdownvalue="Redmi";

// ============== Phone list =============

  List<PhnList> PhoneList = <PhnList>[
    PhnList(
        id: 0,
        brands: "Redmi M5",
        image: "assets/redme.png",
        spec: "6 GB, Dark grey",
        items: 'Redmi',
        price: 20000,
        count: 1),
    PhnList(
        id: 1,
        brands: "Realme Narzo",
        image: "assets/realme.png",
        spec: "4 GB, Lite mix blue",
        items: 'Realme',
        price: 10000,
        count: 1),
    PhnList(
        id: 2,
        brands: "Poco M2",
        image: "assets/poco.png",
        spec: "12 GB, Auro green",
        items: 'Oppo',
        price: 30000,
        count: 1),
    PhnList(
        id: 3,
        brands: "Samsung Note 10",
        image: "assets/samsung.png",
        spec: "8 GB, Navy blue",
        items: 'Samsung',
        price: 12000,
        count: 1),
  ];

  var items = [
    'Redmi',
    'Realme',
    'Oppo',
    'Samsung',
  ];

  int? Total;


  @override
  void initState() {
    super.initState();
      Total = PhoneList.map((expense) => expense.price).fold(0, (prev, price) => prev! + price!);
                                                          
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: liteWhite,
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                size: 17,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Continue shoping",
                                style: GoogleFonts.dmSans(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: circleGraycolor,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Shoping Cart",
                            style: GoogleFonts.dmSans(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("You have 4 items in your cart",
                                  style: GoogleFonts.dmSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Greycolor)),
                              Row(
                                children: [
                                  Text("Sort by:",
                                      style: GoogleFonts.dmSans(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: Greycolor)),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      hint: Text(
                                        'Select Item',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: items
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value:item,
    
                                                child: Text(item,
                                                    style: GoogleFonts.dmSans(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Greycolor)),
                                              ))
                                          .toList(),
                                  value: dropdownvalue,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

// ==================== Animated List view =====================
                          AnimatedList(
                            shrinkWrap: true,
                            reverse: true,
                            key: _key,
                            initialItemCount: items.length,
                            padding: const EdgeInsets.all(10),
                            itemBuilder: (_, index, animation) {
                              
                                print(Total);
                              return SizeTransition(
                                key: UniqueKey(),
                                sizeFactor: animation,
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.13,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                children: [
                                                  reuse.PhoneContainer(
                                                      url: PhoneList[index]
                                                          .image),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        PhoneList[index]
                                                            .brands!,
                                                        style:
                                                            GoogleFonts.dmSans(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        PhoneList[index].spec!,
                                                        style: GoogleFonts.dmSans(
                                                            fontSize: 11,
                                                            color:
                                                                fontGraycolor),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                child: Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      PhoneList[index].count! >=
                                                              2
                                                          ? IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  PhoneList[
                                                                          index]
                                                                      .count = PhoneList[
                                                                              index]
                                                                          .count! -
                                                                      1;
                                                                       Total=Total! - PhoneList[index].price!;
                                                                });
                                                              },
                                                              icon: Icon(
                                                                Icons.remove,
                                                                size: 15,
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              width: 42,
                                                            ),
                                                      reuse.totalContainer(
                                                          count:
                                                              PhoneList[index]
                                                                  .count
                                                                  .toString()),
                                                      IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            PhoneList[index].count =PhoneList[index] .count! + 1;

                                                                    Total=Total! + PhoneList[index].price!;
                                                          });

                                                          print(PhoneList[index]
                                                              .count);
                                                        },
                                                        icon: Icon(
                                                          Icons.add,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                // SizedBox(
                                                //   width: 40,
                                                // ),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "₹ ${PhoneList[index].count! * PhoneList[index].price!}",
                                                          style: GoogleFonts
                                                              .dmSans(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                      ),
                                                      //       SizedBox(
                                                      //   width: 30,
                                                      // ),
                                                      Expanded(
                                                        child: InkWell(
                                                            onTap: () {
                                                             setState(() {
                                                                 Total=Total! - PhoneList[index].price!;
                                                             });
                                                                _removeItem(
                                                                    index);},
                                                            child: Icon(
                                                                FontAwesomeIcons
                                                                    .trashCan),),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.85,
                    decoration: reuse.ContainerDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Card Details",
                                  style: GoogleFonts.dmSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Center(
                                    child: Text(
                                  "👨‍⚕️",
                                  style: TextStyle(fontSize: 25),
                                )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Card type",
                              style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  // fontWeight: FontWeight.bold,
                                  color: circleGraycolor)),
                          SizedBox(
                            height: 6,
                          ),
                          GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: cardType.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // ontap of each card, set the defined int to the grid view index
                                        selectedCard = index;
                                      });
                                    },
                                    child: selectedCard == index
                                        ? reuse.payContainer(
                                            image: Image(
                                            image: AssetImage(
                                                cardType[index].image!),
                                          ))
                                        : reuse.NoPayContainer(
                                            image: Image(
                                            image: AssetImage(
                                                cardType[index].image!),
                                          )));
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Name on Card",
                              style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  // fontWeight: FontWeight.bold,
                                  color: circleGraycolor)),
                          SizedBox(
                            height: 6,
                          ),
                          reuse.TextFieldContainer(hintText: "Ravan Dev"),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Card Number",
                              style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  // fontWeight: FontWeight.bold,
                                  color: circleGraycolor)),
                          SizedBox(
                            height: 6,
                          ),
                          reuse.TextFieldContainer(
                              hintText: "1111 2222 3333 4444"),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Expiration Date",
                                        style: GoogleFonts.dmSans(
                                            fontSize: 14,
                                            // fontWeight: FontWeight.bold,
                                            color: circleGraycolor)),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    reuse.TextFieldContainer(
                                        hintText: "10/2023"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("CVV",
                                        style: GoogleFonts.dmSans(
                                            fontSize: 14,
                                            // fontWeight: FontWeight.bold,
                                            color: circleGraycolor)),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    reuse.TextFieldContainer(hintText: "123"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            color: circleGraycolor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Subtotal",
                                  style: GoogleFonts.dmSans(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: circleGraycolor)),
                              Text("Rs. $Total.00",
                                  style: GoogleFonts.dmSans(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Shipping",
                                  style: GoogleFonts.dmSans(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: circleGraycolor)),
                              Text("Rs. 20.00",
                                  style: GoogleFonts.dmSans(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total(Tax Include)",
                                  style: GoogleFonts.dmSans(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: circleGraycolor)),
                              Text("Rs. ${Total!+20}.00",
                                  style: GoogleFonts.dmSans(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ],
                          ),
                          SizedBox(height: 15),
                          InkWell(
                              child: reuse.ButtonContainer(),
                              onTap: () {
                                Dialogs.materialDialog(
                                  color: Colors.white,
                                  title: 'Congratulations',
                                  lottieBuilder: Lottie.asset(
                                      'assets/paypop.json',
                                      fit: BoxFit.contain,
                                      height: 30.0),
                                  dialogWidth: 0.3,
                                  context: context,
                                );
                                print("Animation");
                              })
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // Remove an item

  void _removeItem(int index) {
    _key.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.13,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      reuse.PhoneContainer(url: PhoneList[index].image),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            PhoneList[index].brands!,
                            style: GoogleFonts.dmSans(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            PhoneList[index].spec!,
                            style: GoogleFonts.dmSans(
                                fontSize: 11, color: fontGraycolor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          PhoneList[index].count! >= 2
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      PhoneList[index].count =
                                          PhoneList[index].count! - 1;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    size: 15,
                                  ),
                                )
                              : SizedBox(
                                  width: 42,
                                ),
                          reuse.totalContainer(
                              count: PhoneList[index].count.toString()),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                PhoneList[index].count =
                                    PhoneList[index].count! + 1;
                              });

                              print(PhoneList[index].count);
                            },
                            icon: Icon(
                              Icons.add,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // SizedBox(
                    //   width: 40,
                    // ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "₹ ${PhoneList[index].count! * PhoneList[index].price!}",
                              style: GoogleFonts.dmSans(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          //       SizedBox(
                          //   width: 30,
                          // ),
                          Expanded(
                            child: InkWell(
                                onTap: () => _removeItem(index),
                                child: Icon(
                                  FontAwesomeIcons.trashCan,
                                  color: Colors.red,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      );
      
    }, duration: Duration(milliseconds: 400));

    items.removeAt(index);
  }
}
