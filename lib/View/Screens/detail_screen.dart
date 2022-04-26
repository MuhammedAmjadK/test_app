import 'package:flutter/material.dart';
import 'package:test_app/Controller/Repository/court_repository.dart';
import 'package:test_app/Model/court_model.dart';
import 'package:test_app/View/Widgets/common_widgets.dart';
import 'package:test_app/View/Widgets/detail_screen_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CourtRepository().fetchDetails();

    return Scaffold(
      backgroundColor: const Color(0xff243878),
      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  CustomButton(
                    icon: Icons.arrow_back_ios,
                    padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                  ),
                  Text(
                    'Court Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  CustomButton(icon: Icons.more_vert),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ValueListenableBuilder(
                              valueListenable: courtDetailNotifier,
                              builder:
                                  (BuildContext context, CourtModel detail, _) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomHeader(text: detail.title),
                                    const SizedBox(height: 5),
                                    CustomBodyText(
                                      text: detail.description,
                                      maxLines: 3,
                                    ),
                                  ],
                                );
                              }),
                        ),
                        SizedBox(
                          width: 100,
                          height: 80,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.waves_outlined,
                                    size: 36,
                                    color: Color(0xff243878),
                                  ),
                                  Text(
                                    '86.1°',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff243878),
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                'Humidity: 45%',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xff243878),
                                ),
                              ),
                              const Text(
                                'Wind: 9 Km/h',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xff243878),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomHeader(text: 'About Court'),
                            const SizedBox(height: 20),
                            Row(
                              children: const [
                                AboutCourtWidget(
                                  icon: Icons.call_missed_outgoing,
                                  title: 'Total Courts',
                                  value: '1',
                                ),
                                AboutCourtWidget(
                                  icon: Icons.light_mode_outlined,
                                  title: 'Court Type',
                                  value: 'Outdoor',
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: const [
                                AboutCourtWidget(
                                  icon: Icons.light_sharp,
                                  title: 'Lights',
                                  value: 'Available',
                                ),
                                AboutCourtWidget(
                                  icon: Icons.public_off,
                                  title: 'Public / Private',
                                  value: 'Private',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const CustomHeader(text: 'Court Timings'),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        CustomBodyText(
                          text: 'Thursday',
                          fontSize: 14,
                        ),
                        Spacer(),
                        Text('-     '),
                        Text(
                          '1:00 AM - 8:00 PM',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                    Container(
                      height: 70,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              CustomBodyText(text: 'Total Check-in'),
                              Text('17'),
                            ],
                          ),
                          const VerticalDivider(
                            thickness: 1,
                            width: 20,
                            color: Colors.grey,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              CustomBodyText(text: 'Active Check-in'),
                              Text('0'),
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          '1:00 AM',
                          style: TextStyle(fontSize: 12),
                        ),
                        Spacer(),
                        Text(
                          '8:00 PM',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
