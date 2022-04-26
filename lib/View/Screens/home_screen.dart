import 'package:flutter/material.dart';
import 'package:test_app/Controller/Repository/court_repository.dart';
import 'package:test_app/Model/court_model.dart';
import 'package:test_app/View/Widgets/common_widgets.dart';
import 'package:test_app/View/Widgets/home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CourtRepository().fetchList();

    return Scaffold(
      backgroundColor: const Color(0xff243878),
      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.my_location_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Location',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '1,South Phase, INDUSTRIAL ESTATE, ...',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const CustomButton(
                    icon: Icons.person_outline,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/background image.jpg"),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomHeader(text: 'Near you'),
                      const SizedBox(height: 5),
                      const Text(
                        '7 Places near you',
                        style: TextStyle(fontSize: 12),
                      ),
                      Expanded(
                        child: ValueListenableBuilder(
                            valueListenable: courtModelListNotifier,
                            builder: (BuildContext context,
                                List<CourtModel> courtList, _) {
                              return ListView.builder(
                                itemCount: courtList.length,
                                itemBuilder: (context, index) {
                                  var _courtModel = courtList[index];
                                  return CourtItem(
                                    title: _courtModel.title,
                                    description: _courtModel.description,
                                  );
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      CustomBodyText(
                        text: 'Search Court',
                        fontSize: 14,
                      ),
                      Spacer(),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Icon(Icons.tune_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey.shade200,
        elevation: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_sharp,
              color: Colors.blue.shade200,
            ),
            const Text(
              '82.4°',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff243878),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
