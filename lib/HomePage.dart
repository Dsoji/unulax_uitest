import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:test_user_interface/LIst.dart';
import 'package:toast/toast.dart';
import 'dart:math' as math;
import 'LIst.dart';



class HomePage extends StatefulWidget {
  bool checked = true;
  double balance = 1.202352369;
  int currentIndex = 0 ;
  var dropValue ;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: "Hello\n",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Kevin Adekoya",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage("assets/images/profile.jpg"),
                          fit: BoxFit.cover,
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: double.infinity,
              height: size.height * .20,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Balance",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      Text(
                        "\$ ${widget.balance}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )
                    ],
                  ),
                  FlutterSwitch(
                    inactiveToggleColor: Colors.white,
                    activeToggleColor: Theme.of(context).primaryColor,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    height: 32,
                    width: 60,
                    padding: 2,
                    borderRadius: 18,
                    toggleSize: 31,
                    value: widget.checked,
                    onToggle: (val) {
                      setState(() => widget.checked = val);
                      Toast.show(widget.checked ? "On" : "Off", context);
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...data.map((parts) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15),
                              splashColor: Colors.blue.shade200,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade100
                                        .withOpacity(.5),
                                    borderRadius:
                                    BorderRadius.circular(12)),
                                child: Icon(
                                  parts["icon"],
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              onTap: () => Toast.show(
                                  parts["part"], context,
                                  backgroundRadius: 4,
                                  backgroundColor: Colors.purple,
                                  textColor: Colors.white),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          parts["part"],
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
                  ].toList()),
            ),
            Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 15,right: 15,bottom: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Balance Overview",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                                Container(
                                    width: size.width*.30,
                                    height: 35,
                                    padding: EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.white,width: 1)
                                    ),
                                    child: DropdownButton(
                                      underline: Container(),
                                      style:TextStyle(color: Colors.black ,fontSize: 15),
                                      hint: Text(widget.dropValue == null ?"Monthly": widget.dropValue,style: TextStyle(color: Colors.white ,fontSize: 17),),
                                      isExpanded: true,
                                      icon: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,),
                                      items: [
                                        ...months.map((month) => DropdownMenuItem<String>(
                                          value: month,
                                          child: Text(month),
                                        )),
                                      ].toList(),
                                      onChanged: (val) {
                                        setState(()=> widget.dropValue = val);
                                        Toast.show(widget.dropValue, context,gravity: Toast.TOP ,backgroundColor: Colors.deepPurple);
                                      },
                                    )
                                )
                              ],
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text("\$ ${1.70}M", style: TextStyle(color: Colors.white),)
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 8),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: months.length,
                                  itemBuilder: (_,index)
                                  =>Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5, left: 15 , right: 15),
                                            width: 10,
                                            height: 150,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.withOpacity(.5),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5, left: 15 , right: 15),
                                            width: 10,
                                            height: Profit[index],
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(months[index],style: TextStyle(color: Colors.white),)
                                    ],
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child:ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(21),topLeft: Radius.circular(21)),
                        child: BottomNavigationBar(
                          elevation: 2,
                          backgroundColor: Colors.white,
                          currentIndex: widget.currentIndex,
                          selectedItemColor: Theme.of(context).primaryColor,
                          unselectedItemColor: Colors.grey,
                          onTap: (val){
                            setState(()=> widget.currentIndex = val);
                          },
                          items: <BottomNavigationBarItem>[
                            ...navigationBarItem.map((e) => BottomNavigationBarItem(icon: Icon(e["icon"]),label: e["part"]))
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
