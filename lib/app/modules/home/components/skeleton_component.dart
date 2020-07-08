import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Shimmer.fromColors(
      baseColor: Colors.grey[350],
      highlightColor: Colors.white,
      child: Container(
        width: double.infinity,
        height: 100,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: size.height * 0.1,
                  width: size.height * 0.1,
                  color: Colors.grey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 15,
                      width: size.width * 0.7,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 15,
                      width: size.width * 0.6,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 15,
                      width: size.width * 0.5,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 15,
                      width: size.width * 0.4,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 15,
                      width: size.width * 0.3,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 15,
                      width: size.width * 0.2,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
