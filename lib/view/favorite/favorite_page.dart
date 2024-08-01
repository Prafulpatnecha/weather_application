import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homeProviderFalse =
        Provider.of<HomeProvider>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Management'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 70,),
            ...List.generate(
              homeProviderTrue.addList.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.blue,
                  child: Container(
                    height: 100,
                    width: w,
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(homeProviderTrue.addList[index].split("-").sublist(0,1).join("-"),style: TextStyle(color: Theme.of(context).disabledColor,fontSize: 30,fontWeight: FontWeight.bold),),
                            Text("${homeProviderTrue.addList[index].split("-").sublist(1,4).join(" ")}°",style: TextStyle(color: Theme.of(context).disabledColor,fontSize: 15),),
                          ],
                        ),
                        Spacer(),
                        Text('${homeProviderTrue.addList[index].split("-").sublist(4,5).join("-")}°C',style: TextStyle(color: Theme.of(context).disabledColor,fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(width: 10,),
                        IconButton(onPressed: () {
                          homeProviderFalse.removeListBook(index);
                        }, icon: Icon(Icons.delete,color: Theme.of(context).disabledColor,)),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
