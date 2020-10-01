import 'package:AIAGroup_CodingAssesment/data/dataVendingMachine.dart';
import 'package:AIAGroup_CodingAssesment/sources/strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendingMachine extends StatefulWidget
{
  @override
  _VendingMachineState createState() => _VendingMachineState();
}

class _VendingMachineState extends State<VendingMachine>
{
  List<Widget> sellItems = List();

  initData() async
  {
    sellItems.clear();

    List dataSellItems = DataVendingMachine.sellItems;

    for (int i = 0; i < dataSellItems.length; i++)
    {
      sellItems.add(
        _itemSell(
          index: i,
          data: dataSellItems
        )
      );
    }
  }

  setupConfig() async
  {
    initData();
  }

  @override
  void initState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    setupConfig();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        leading: SizedBox.shrink(),
        title: Text(
          "Vending Machine",
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontFamily: "${Strings.fontFamily}",
            fontSize: 18.0,
            fontWeight: FontWeight.w500
          ),
          textAlign: TextAlign.center,
        ),
        toolbarOpacity: 0.0,
      ),
      backgroundColor: Colors.red[900],
      body: _body(context: context),
    );
  }

  Widget _body({@required BuildContext context})
  {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MediaQuery.removePadding(
      context: context,
      child: Container(
        child: GridView.count(
          children: sellItems.toList(),
          childAspectRatio: 0.60,
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          primary: false,
          shrinkWrap: false,
        ),
        width: width,
        height: height,
        color: Colors.white,
        padding: EdgeInsets.all(10.0),
      ),
      removeBottom: true,
      removeTop: true,
      removeLeft: true,
      removeRight: true,
    );
  }

  Widget _itemSell({@required int index, @required List data})
  {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height / 3.0;

    return Material(
      child: Container(
        child: Stack(
          children: <Widget>[
            // begin: image of sell item
            Container(
              child: CachedNetworkImage(
                imageUrl: "${data[index]["urlPhoto"]}",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
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
            Align(
              child: Column(
                children: <Widget>[
                  Expanded(child: SizedBox.shrink(),),

                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "${data[index]["label"]}",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontFamily: "${Strings.fontFamily}",
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          textAlign: TextAlign.left,
                        ),
                        
                        SizedBox(height: 5.0),

                        Text(
                          "${data[index]["price"][0]["withCurrency"]}",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontFamily: "${Strings.fontFamily}",
                            fontSize: 12.0,
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
                    width: width,
                    color: Colors.black.withOpacity(0.85),
                    padding: EdgeInsets.all(15.0),
                  ),
                ],
              ),
              alignment: Alignment.bottomCenter,
            ),
            // end: information

            // begin: tap area
            Material(
              child: InkWell(
                child: Container(
                  color: Colors.transparent,
                ),
                onTap: ()=> print("Click item -> ${data[index]["label"]}"),
              ),
              color: Colors.transparent,
              elevation: 0.0,
            ),
            // end: tap area
          ],
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
        ),
        width: width,
        height: height,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 2.50,
    );
  }
}