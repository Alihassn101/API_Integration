import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_project/Bloc/Api/api_bloc.dart';
import 'package:task_project/Utilities/Contants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ApiBloc>(context).add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            "API's Integration With BLOC",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Container(
        color: Colors.black12,
        child: BlocConsumer<ApiBloc, ApiState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is FetchedData) {
              return ListView.builder(
                  itemCount: state.dataList!["data"].length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      padding: EdgeInsets.only(bottom: 30,right: 10,left: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(state.dataList!["data"]
                                          [index]["user_detail"]
                                          ["profile_image"]
                                      .toString()),
                                )),
                            height: MediaQuery.of(context).size.width * 0.15,
                            width: MediaQuery.of(context).size.width * 0.15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: [

                                Text(
                                  state.dataList!["data"]
                                  [index]["business_name"].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Icon(Icons.check_circle_outline,color: appThemeColor,size: 20,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0,top: 20),

                            child: Row(
                              children: [

                                Icon(
                                  state.dataList!["data"]
                                  [index]["avg_rating"]<1?
                                  Icons.star_border:Icons.star,

                                  color:
                                  state.dataList!["data"]
                                  [index]["avg_rating"]<1?
                                  Colors.black26:appThemeColor,
                                  size: 20,),



                                Icon(
                                  state.dataList!["data"]
                                  [index]["avg_rating"]<2?
                                  Icons.star_border:Icons.star,

                                  color:
                                  state.dataList!["data"]
                                  [index]["avg_rating"]<2?
                                  Colors.black26:appThemeColor,
                                  size: 20,),

                                Icon(
                                  state.dataList!["data"]
                                  [index]["avg_rating"]<3?
                                  Icons.star_border:Icons.star,

                                  color:
                                  state.dataList!["data"]
                                  [index]["avg_rating"]<3?
                                  Colors.black26:appThemeColor,
                                  size: 20,),

                                Icon(
                                  state.dataList!["data"]
                                  [index]["avg_rating"]<4?
                                  Icons.star_border:Icons.star,

                                  color:
                                  state.dataList!["data"]
                                  [index]["avg_rating"]<4?
                                  Colors.black26:appThemeColor,
                                  size: 20,),

                                Icon(
                                  state.dataList!["data"]
                                  [index]["avg_rating"]<5?
                                  Icons.star_border:Icons.star,

                                  color:
                                  state.dataList!["data"]
                                  [index]["avg_rating"]<5?
                                  Colors.black26:appThemeColor,
                                  size: 20,),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,top: 20,bottom: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${state.dataList!["data"][index]["total_feedback_count"]} Feedback Review",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    color: appThemeColor
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(

                                  state.dataList!["data"][index]["initiated_jobs"]==0?
                                  "No Job Performed":
                                  "${state.dataList!["data"][index]["initiated_jobs"]} Job Performed",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      color: appThemeColor
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      color: appThemeColor,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: TextButton(
                                    onPressed: (){},
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10,vertical: 0)),

                                    ),
                                    child: Text(
                                      "Post Job & Invite to Bid",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black12,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on,color: appThemeColor,size: 22,),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Location ",
                                      style:  TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "${state.dataList!["data"][index]["user_detail"]["city"]} ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                          )
                                        )
                                      ]
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on,color: appThemeColor,size: 22,),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Member since ",
                                        style:  TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400
                                        ),
                                        children: [
                                          TextSpan(
                                              text: state.dataList!["data"][index]["formatted_created_at"],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                              )
                                          )
                                        ]
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),


                          Container(
                            padding: const EdgeInsets.only(left: 18.0,top: 5),
                            width: double.infinity,
                            // color: Colors.red,
                            child: Text(
                              state.dataList!["data"][index]["business_details"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                fontSize: 16
                              ),
                            ),
                          ),


                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
