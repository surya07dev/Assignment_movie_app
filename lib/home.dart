import 'package:demo/cubit/demo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Home Page',
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Text(
                        "Company:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Geeksynergy\nTechnologies")
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Text(
                        "Address:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Sanjayanagar,\nBengaluru-56")
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Text(
                        "Phone:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text("xxxxxxxx09")
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Text(
                        "Email:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text("abc@gmail.com")
                    ],
                  ),
                ),
              ],
              color: Colors.white,
              elevation: 2,
              child: const Center(child: Text("Company Info:    ")),
            )
          ],
        ),

        // <<----------------     --------------->>

        body: BlocBuilder<DemoCubit, DemoState>(
          builder: (context, state) {
            return Column(
              children: [
                (state.responseData?.result != null &&
                        state.responseData!.result!.isNotEmpty)
                    ? Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: state.responseData!.result!.length,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 5, color: Colors.blue),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //    Directors

                                    Row(
                                      children: [
                                        const Text("Director"),
                                        const SizedBox(width: 20),
                                        if (state.responseData!.result![index]
                                                    .director !=
                                                null &&
                                            state.responseData!.result![index]
                                                    .director !=
                                                []) ...[
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: state
                                                  .responseData!
                                                  .result![index]
                                                  .director!
                                                  .length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, indexx) {
                                                return Text(state
                                                        .responseData!
                                                        .result![index]
                                                        .director?[indexx] ??
                                                    "");
                                              },
                                            ),
                                          )
                                        ]
                                      ],
                                    ),

                                    //// Writers

                                    Row(
                                      children: [
                                        const Text("Writers"),
                                        const SizedBox(width: 24),
                                        if (state.responseData!.result![index]
                                                    .writers !=
                                                null &&
                                            state.responseData!.result![index]
                                                    .director !=
                                                []) ...[
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: state
                                                  .responseData!
                                                  .result![index]
                                                  .writers!
                                                  .length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, indexx) {
                                                return Text(state
                                                        .responseData!
                                                        .result![index]
                                                        .writers?[indexx] ??
                                                    "");
                                              },
                                            ),
                                          )
                                        ]
                                      ],
                                    ),

                                    ///// stars
                                    Row(
                                      children: [
                                        const Text("Stars"),
                                        const SizedBox(width: 35),
                                        if (state.responseData!.result![index]
                                                    .stars !=
                                                null &&
                                            state.responseData!.result![index]
                                                    .stars !=
                                                []) ...[
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: state.responseData!
                                                  .result![index].stars!.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, indexx) {
                                                return Text(state
                                                        .responseData!
                                                        .result![index]
                                                        .stars?[indexx] ??
                                                    "");
                                              },
                                            ),
                                          )
                                        ]
                                      ],
                                    ),

                                    // production Company
                                    Row(
                                      children: [
                                        const Text("Production Company"),
                                        const SizedBox(width: 16),
                                        if (state.responseData!.result![index]
                                                    .productionCompany !=
                                                null &&
                                            state.responseData!.result![index]
                                                    .productionCompany !=
                                                []) ...[
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: state
                                                  .responseData!
                                                  .result![index]
                                                  .productionCompany!
                                                  .length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, indexx) {
                                                return Text(state
                                                            .responseData!
                                                            .result![index]
                                                            .productionCompany?[
                                                        indexx] ??
                                                    "");
                                              },
                                            ),
                                          )
                                        ]
                                      ],
                                    ),

                                    Text(
                                        "Title:                     ${state.responseData!.result![index].title ?? ""}"),
                                    Text(
                                        "language:             ${state.responseData!.result![index].language ?? ""}"),
                                    Text(
                                        "Released date:    ${state.responseData!.result![index].releasedDate ?? ""}"),
                                    Text(
                                        "Genre:                   ${state.responseData!.result![index].genre ?? ""}"),
                                    Text(
                                        "Runtime:              ${state.responseData!.result![index].runTime ?? ""}"),
                                    Text(
                                        "Total Voted:          ${state.responseData!.result![index].totalVoted ?? ""}"),
                                    Text(
                                        "Total Voted:          ${state.responseData!.result![index].voting ?? ""}"),

                                    Center(
                                      child: Image.network(
                                        state.responseData!.result![index]
                                                .poster ??
                                            "https://thumb.ac-illust.com/73/7387030e5a5600726e5309496353969a_t.jpeg",
                                        filterQuality: FilterQuality.low,
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        ),
                      )
                    : Container()
              ],
            );
          },
        ));
  }
}
