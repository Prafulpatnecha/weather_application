import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/provider/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homeProviderFalse =
        Provider.of<HomeProvider>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future:
                Provider.of<HomeProvider>(context, listen: false).apiDataGet(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                homeProviderTrue.apiModalScan = snapshot.data;
                // print(homeProviderTrue.apiModalScan!.forecast.forecastday[0].day.uv);
                return Container(
                  height: h,
                  width: w,
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(end: Alignment.bottomCenter, colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).disabledColor,
                    ]),
                    image: const DecorationImage(
                        image: AssetImage('assets/image/sun.png'),
                        alignment: Alignment.topCenter),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            // height: 80,
                            width: w,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .disabledColor
                                    .withOpacity(0.5),
                                borderRadius: BorderRadius.circular(50)),
                            child: TextFormField(
                              controller: homeProviderTrue.txtFind,
                              onFieldSubmitted: (value) {},
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Theme.of(context).disabledColor,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0))),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        buildPaddingLocation(homeProviderTrue, context),
                        GridTile(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Container(
                            height: 350,
                            width: w,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .disabledColor
                                    .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Image.network(
                                    'https:' +
                                        homeProviderTrue.apiModalScan!.current
                                            .condition.icon,
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0.5, -0.3),
                                  child: Container(
                                    width: 70,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Theme.of(context)
                                            .disabledColor
                                            .withOpacity(0.5)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Today",
                                      style: TextStyle(
                                        color: Theme.of(context).disabledColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0.7, 0.4),
                                  child: Text(
                                    "${homeProviderTrue.apiModalScan!.current.tempC.toString().split(".").sublist(0, 1).join(".").replaceAll(".0", '')}°",
                                    style: TextStyle(
                                      fontSize: 90,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).disabledColor,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        const Icon(
                                          Icons.arrow_upward,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          "${homeProviderTrue.apiModalScan!.current.heatindexC.toString().split(".").sublist(0, 1).join(".").replaceAll(".0", '')}°",
                                          style: TextStyle(
                                            fontSize: 25,
                                            color:
                                                Theme.of(context).disabledColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Icon(
                                          Icons.arrow_downward,
                                          color:
                                              Theme.of(context).disabledColor,
                                        ),
                                        Text(
                                          "${homeProviderTrue.apiModalScan!.current.dewpointC.toString().split(".").sublist(0, 1).join(".").replaceAll(".0", '')}°",
                                          style: TextStyle(
                                            fontSize: 25,
                                            color:
                                                Theme.of(context).disabledColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 93,
                                    )
                                  ],
                                ),
                                Align(
                                  alignment: Alignment(0, 0.7),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Divider(
                                      color: Theme.of(context)
                                          .disabledColor
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0, 0.93),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Theme.of(context).disabledColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                        SizedBox(height: 50,),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 38, vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Hours Weather",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).disabledColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(width: 30,),
                              ...List.generate(
                                homeProviderTrue.apiModalScan!.forecast
                                    .forecastday[0].hour.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 135,
                                    width: 110,
                                    decoration: BoxDecoration(
                                    color: Theme.of(context).disabledColor.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Column(
                                      children: [
                                        // Image.network();
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                      color: Colors.pink.withOpacity(0.5)),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Padding buildPaddingLocation(
      HomeProvider homeProviderTrue, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                homeProviderTrue.apiModalScan!.location.name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).disabledColor,
                ),
              ),
              Text(
                homeProviderTrue.apiModalScan!.location.region,
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
