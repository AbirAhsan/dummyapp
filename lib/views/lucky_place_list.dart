import 'package:dummyapp/model/lucky_place_model.dart';
import 'package:dummyapp/services/api_service.dart';
import 'package:flutter/material.dart';

class LuckyPlaceList extends StatefulWidget {
  const LuckyPlaceList({Key? key}) : super(key: key);

  @override
  _LuckyPlaceListState createState() => _LuckyPlaceListState();
}

class _LuckyPlaceListState extends State<LuckyPlaceList> {
  late Future<List<LuckyPlace>> futureLuckyPlace;

  @override
  void initState() {
    futureLuckyPlace = APIService().getLuckyPlace();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lucky Place List"),
      ),
      body: SizedBox(
        height: _height,
        width: _width,
        child: FutureBuilder<List<LuckyPlace>>(
            future: futureLuckyPlace,
            builder: (context, snapshot) {
              if (!snapshot.hasError) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(
                      child: Text(
                        "Offline",
                        style: TextStyle(fontSize: 24, color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    );
                  case ConnectionState.waiting:
                    return const Text("Please Wait");

                  default:
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (buildContext, index) {
                        // var dataIndex = snapshot.data![index];
                        return Column(children: [
                          Text(snapshot.data![index].tiTle.toString())
                        ]);
                      },
                    );
                }
              } else {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
            }),
      ),
    );
  }
}
