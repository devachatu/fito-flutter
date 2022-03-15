import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkOutScreen extends StatefulWidget {
  const WorkOutScreen({Key? key}) : super(key: key);

  @override
  State<WorkOutScreen> createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen> {
  List<dynamic> setWarray = [];
  int weightCount = 1;
  int repsCount = 1;

  void setAddFunction() {
    var newModel = {
      'kgs': weightCount,
      'reps': repsCount,
    };
    setWarray.add(newModel);
    // print(setWarray.length);
    //setWarray.add(index+1);
  }

  void addWeight(bool isReduce) {
    weightCount = (isReduce == true && weightCount != 1)
        ? weightCount - 1
        : weightCount + 1;
  }

  void addreps(bool isReduce) {
    repsCount =
        (isReduce == true && repsCount != 1) ? repsCount - 1 : repsCount + 1;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    var widthOfScreen = screen.size.width / 100;
    var heighOfScreen = screen.size.height / 100;
    var assetsImage = const AssetImage('images/workoutBG.png');
    var checkImage = const AssetImage('images/check.png');
    var tickImage = const AssetImage('images/tick.png');

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          centerTitle: true,
          title: const Text('Workout Set'),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.blueGrey.shade500,
              height: heighOfScreen * 30,
              child: Image(
                  image: assetsImage,
                  fit: BoxFit.cover,
                  height: heighOfScreen * 29,
                  width: widthOfScreen * 100),
            ),
            Container(
              //color: Color(0xFFC51162),
              height: heighOfScreen * 59,
              width: widthOfScreen * 100,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
                    child: SizedBox(
                      height: heighOfScreen * 7,
                      width: widthOfScreen * 75,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              elevation: 23,
                              builder: (BuildContext context) {
                                // return StatefulBuilder(
                                //builder: (context, setState) {
                                return Container(
                                  height: heighOfScreen * 45,
                                  width: widthOfScreen * 100,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Set ${index + 1}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Image(
                                              image: checkImage,
                                              height: 25,
                                              width: 25,
                                              fit: BoxFit.fill,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: widthOfScreen * 100,
                                          height: heighOfScreen * 0.2,
                                          color: Colors.grey.shade100,
                                        ),
                                        SizedBox(
                                            width: widthOfScreen * 100,
                                            height: heighOfScreen * 10,
                                            //color: Colors.grey.shade100,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
                                                      return Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          //Image(image: assetsImage, height: 25, width: 25, fit: BoxFit.fill,),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                var countBool =
                                                                    (weightCount ==
                                                                            1)
                                                                        ? false
                                                                        : true;
                                                                if (countBool) {
                                                                  addWeight(
                                                                      true);
                                                                } else {
                                                                  //  addWeight(true);
                                                                }
                                                              });
                                                            },
                                                            child: const Text(
                                                              ' -  ',
                                                              style: TextStyle(
                                                                fontSize: 34,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            '$weightCount',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 34,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                addWeight(
                                                                    false);
                                                              });
                                                            },
                                                            child: const Text(
                                                              '  + ',
                                                              style: TextStyle(
                                                                fontSize: 34,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          //Image(image: assetsImage, height: 25, width: 25, fit: BoxFit.fill,),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                  const Center(
                                                    child: Text(
                                                      'KGS WEIGHT',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              Colors.black45),
                                                    ),
                                                  ),
                                                ])),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: widthOfScreen * 100,
                                          height: heighOfScreen * 0.2,
                                          color: Colors.grey.shade100,
                                        ),
                                        SizedBox(
                                            width: widthOfScreen * 100,
                                            height: heighOfScreen * 10,
                                            //color: Colors.grey.shade100,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
                                                      return Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                var countBool =
                                                                    (repsCount ==
                                                                            1)
                                                                        ? false
                                                                        : true;
                                                                if (countBool) {
                                                                  addreps(true);
                                                                } else {}
                                                              });
                                                            },
                                                            child: const Text(
                                                              ' -  ',
                                                              style: TextStyle(
                                                                fontSize: 34,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          //Image(image: assetsImage, height: 25, width: 25, fit: BoxFit.fill,),
                                                          Text(
                                                            '$repsCount',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 34,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                addreps(false);
                                                              });
                                                            },
                                                            child: const Text(
                                                              '  + ',
                                                              style: TextStyle(
                                                                fontSize: 34,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          //Image(image: assetsImage, height: 25, width: 25, fit: BoxFit.fill,),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                  const Center(
                                                    child: Text(
                                                      'REPS',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              Colors.black45),
                                                    ),
                                                  ),
                                                ])),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: widthOfScreen * 100,
                                          height: heighOfScreen * 0.2,
                                          color: Colors.grey.shade100,
                                        ),
                                        SizedBox(
                                          width: widthOfScreen * 100,
                                          height: heighOfScreen * 10,
                                          //color: Colors.grey.shade100,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: (() {
                                                  Get.back();
                                                }),
                                                child: Container(
                                                  height: heighOfScreen * 7,
                                                  width: widthOfScreen * 37,
                                                  // color: Colors.red,
                                                  decoration: BoxDecoration(
                                                    //shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                        color: Colors.yellow),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Previous',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    setAddFunction();
                                                  });
                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: heighOfScreen * 7,
                                                  width: widthOfScreen * 37,
                                                  //color: Colors.yellow,
                                                  decoration: BoxDecoration(
                                                    color: Colors.yellow,
                                                    //shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                        color: Colors.yellow),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Next Set',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
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
                                // },
                                //);
                              });
                          // setState(() {
                          //   setAddFunction();
                          // });
                        },
                        child: (setWarray.length == index)
                            ? const Card(
                                child: Center(
                                    child: Text(' + Add Workout Plans ')),
                              )
                            : Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Set ${index + 1}'),
                                    // Text('23 KGS'),
                                    // Text('10 reps'),
                                    Text('${setWarray[index]['kgs']} KGS'),
                                    Text('${setWarray[index]['reps']} reps'),
                                    Image(
                                      image: tickImage,
                                      height: 25,
                                      width: 25,
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ),
                  );
                },
                itemCount: (setWarray.isEmpty) ? 1 : setWarray.length + 1,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              ),
              color: Colors.grey.shade100,
            ),
          ],
        ));
  }
}
