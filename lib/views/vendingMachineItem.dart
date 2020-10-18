import 'dart:async';

import 'package:AIAGroup_CodingAssesment/data/dataVendingMachine.dart';
import 'package:AIAGroup_CodingAssesment/sources/strings.dart';
import 'package:AIAGroup_CodingAssesment/widgets/buttons.dart';
import 'package:AIAGroup_CodingAssesment/widgets/notifications.dart';
import 'package:AIAGroup_CodingAssesment/widgets/texts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendingMachineItem extends StatefulWidget
{
  final Object tag;
  final List data;

  VendingMachineItem({
    @required this.tag,
    @required this.data
  });

  @override
  _VendingMachineItemState createState() => _VendingMachineItemState(
    tag: this.tag,
    data: this.data
  );
}

class _VendingMachineItemState extends State<VendingMachineItem>
{
  final Object tag;
  final List data;

  _VendingMachineItemState({
    @required this.tag,
    @required this.data
  });

  GlobalKey<ScaffoldState> scaffoldState;
  ScrollController scrollController;

  initBuyDialog()
  {
    TextEditingController textQuantity = TextEditingController();
    TextEditingController textJumlahUang = TextEditingController();

    Widget contentBuyDialog = Wrap(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[

              // begin: item information
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text(
                          "${data[0]["label"]}",
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontFamily: "${Strings.fontFamily}",
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          textAlign: TextAlign.left,
                        ),
                        height: 55.0,
                        alignment: Alignment.centerLeft,
                      ),
                    ),

                    SizedBox(width: 10.0),

                    Container(
                      child: Text(
                        "${data[0]["price"][0]["withCurrency"]}" + " / item",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: "${Strings.fontFamily}",
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        textAlign: TextAlign.right,
                      ),
                      height: 55.0,
                      alignment: Alignment.centerRight,
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                alignment: Alignment.centerLeft,
              ),
              // end: item information

              SizedBox(height: 10.0),

              // begin: quantity
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Quantity",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: "${Strings.fontFamily}",
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                    ),

                    // begin: input
                    Container(
                      child: iText(
                        context: context,
                        keyboardType: TextInputType.number,
                        keyboardAction: TextInputAction.done,
                        controller: textQuantity,
                        textAlign: TextAlign.right,
                        isObscureText: false,
                        isEnabled: true,
                        fontSize: 12.0
                      ),
                      width: 75.0,
                    )
                    // end: input
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                alignment: Alignment.centerLeft,
              ),
              // end: quantity

              SizedBox(height: 10.0),

              // begin: jumlah uang
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Jumlah uang Anda",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: "${Strings.fontFamily}",
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                    ),

                    // begin: input
                    Container(
                      child: iText(
                        context: context,
                        keyboardType: TextInputType.number,
                        keyboardAction: TextInputAction.done,
                        controller: textJumlahUang,
                        textAlign: TextAlign.right,
                        isObscureText: false,
                        isEnabled: true,
                        fontSize: 12.0
                      ),
                      width: 75.0,
                    )
                    // end: input
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                alignment: Alignment.centerLeft,
              ),
              // end: jumlah uang

            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          width: MediaQuery.of(context).size.width,
        )
      ],
    );

    Widget okButton = FlatButton(
      child: Padding(
        child: Text(
          "Buy now",
          style: TextStyle(
            color: Colors.red[900],
            decoration: TextDecoration.none,
            fontFamily: "${Strings.fontFamily}",
            fontSize: 12.0,
            fontWeight: FontWeight.w300
          ),
        ),
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
      ),
      highlightColor: Colors.red[100],
      splashColor: Colors.red[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: (){
        String valQty = textQuantity.text;
        String valMoney = textJumlahUang.text;

        String message = "";
        bool backToHome = false;
        
        if (valQty.isEmpty || valMoney.isEmpty)
        {
          setState(()=> message = "Oops! Data pembelian belum diisi.");
        }
        else if (int.tryParse("$valQty") > int.tryParse("${data[0]["availability"][0]["stock"]}"))
        {
          setState(()=> message = "Oops! Stok yang tersedia hanya" + " " + "${data[0]["availability"][0]["stock"]}" + " " + (int.tryParse("${data[0]["availability"][0]["stock"]}") > 1 ? "items" : "item"));
        }
        else if (int.tryParse("$valMoney") < int.tryParse("${data[0]["price"][0]["noCurrency"]}"))
        {
          setState(()=> message = "Oops! Nominal uang yang dimasukan kurang.");
        }
        else
        {
          List<int> values = [];
          for (int x = 0; x < DataVendingMachine.acceptableMoney.length; x++)
          {
            values.add(
              int.tryParse("${DataVendingMachine.acceptableMoney[x]["label"]}")
            );
          }
          // print("");
          // print("$values");

          if (values.contains(int.tryParse("$valMoney")) == true)
          {
            setState((){
              message = "Berhasil !\nTunggu barang keluar dari mesin.";
              backToHome = true;
            });
          }
          else
          {
            String valPecahan = "";

            for (int i = 0; i < DataVendingMachine.acceptableMoney.length; i++)
            {
              valPecahan = "" + valPecahan + DataVendingMachine.acceptableMoney[i]["withNumberFormat"] + (
                (i+1) == DataVendingMachine.acceptableMoney.length ? "" : ", "
              );
            }

            setState(()=> message ="Oops! Nominal uang tidak dapat diproses.\nPecahan: $valPecahan");
          }
        }

        Navigator.pop(context);

        const detik1 = Duration(milliseconds: 350);
        Timer.periodic(detik1, (Timer timer){
          timer.cancel();
          iSnackBar(scaffoldState: scaffoldState, message: message);
        });

        if (backToHome == true)
        {
          const detik2 = Duration(milliseconds: 3000);
          Timer.periodic(detik2, (Timer timer){
            timer.cancel();
            Navigator.pop(context);
          });
        }
      },
    );

    AlertDialog buyDialog = AlertDialog(
      title: Text(
        "Order Item",
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.none,
          fontFamily: "${Strings.fontFamily}",
          fontWeight: FontWeight.w500,
        ),
      ),
      content: contentBuyDialog,
      actions: <Widget>[
        okButton,
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );

    showDialog(
      context: this.context,
      builder: (BuildContext builder){
        return buyDialog;
      }
    );
  }

  @override
  void initState()
  {
    scaffoldState = GlobalKey<ScaffoldState>();
    scrollController = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Hero(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        key: scaffoldState,

        appBar: AppBar(
          backgroundColor: Colors.red[900],
          centerTitle: true,
          leading: appBarBack(
            iconColor: Colors.white,
            iconSize: 20.0,
            onTap: ()=> Navigator.pop(context)
          ),
          title: Text(
            "${Strings.appName}",
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontFamily: "${Strings.fontFamily}",
              fontSize: 18.0,
              fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            _body(context: context),

            Align(
              child: iButton(
                context: context,
                backgroundColor: Colors.red[900],
                text: "${Strings.label0001}",
                textColor: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                onTap: ()=> (data[0]["availability"][0]["status"] == false ? iSnackBar(scaffoldState: scaffoldState, message: "Oops! Stok habis."): initBuyDialog())
              ),
              alignment: Alignment.bottomCenter,
            )
          ],
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
        ),
      ),
      tag: this.tag,
    );
  }

  Widget _body({@required BuildContext context})
  {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollStartNotification) {
        } else if (scrollNotification is ScrollUpdateNotification) {
        } else if (scrollNotification is ScrollEndNotification) {
        }
        return true;
      },

      child: CustomScrollView(
        anchor: 0.0,
        cacheExtent: 0.0,
        controller: scrollController,
        center: widget.key,
        physics: BouncingScrollPhysics(),
        primary: false,
        scrollDirection: Axis.vertical,
        semanticChildCount: 0,
        shrinkWrap: false,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int i){
                return _bodyItems();
              },
              childCount: 1,
            ),
          ),
        ]
      ),
    );
  }

  Widget _bodyItems()
  {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height / 3.0;

    int index = 0;

    return Container(
      child: MediaQuery.removePadding(
        child: Stack(
          children: <Widget>[
            
            SafeArea(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  child: Column(
                    children: <Widget>[

                      Container(
                        child: Stack(
                          children: <Widget>[
                            
                            Column(
                              children: <Widget>[
                                // begin: image of sell item
                                Container(
                                  child: CachedNetworkImage(
                                    imageUrl: "${data[index]["urlPhoto"]}",
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.scaleDown,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => CupertinoActivityIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                  width: width,
                                  height: height,
                                  alignment: Alignment.topCenter,
                                  padding: EdgeInsets.all(double.tryParse("${data[index]["padding"]}")),
                                ),
                                // end: image of sell item

                                // begin: information
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "${data[index]["label"]}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                          fontFamily: "${Strings.fontFamily}",
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        textAlign: TextAlign.left,
                                      ),
                                      
                                      SizedBox(height: 15.0),

                                      Text(
                                        "${data[index]["price"][0]["withCurrency"]}" + " / item",
                                        style: TextStyle(
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                          fontFamily: "${Strings.fontFamily}",
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        textAlign: TextAlign.left,
                                      ),

                                      SizedBox(height: 15.0),

                                      Text(
                                        "Stok : " + (
                                          data[index]["availability"][0]["status"] == false ?
                                          "habis" :
                                          "${data[index]["availability"][0]["stock"]}" + " " + (
                                            int.tryParse("${data[index]["availability"][0]["stock"]}") > 1 ? "items" : "item"
                                          )
                                        ),
                                        style: TextStyle(
                                          color: (data[index]["availability"][0]["status"] == false ? Colors.red[900] : Colors.black),
                                          decoration: TextDecoration.none,
                                          fontFamily: "${Strings.fontFamily}",
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                  ),
                                  padding: EdgeInsets.all(25.0)
                                ),
                                // end: information
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                            ),

                          ],
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  constraints: BoxConstraints(),
                ),
              ),
            )

          ],
        ),
        context: context,
        removeTop: true,
      ),
    );
  }
}