import 'package:covid19/app/core/consts.dart';
import 'package:flutter/material.dart';

class OpeningView extends StatefulWidget {
  @override
  _OpeningViewState createState() => _OpeningViewState();
}

class _OpeningViewState extends State<OpeningView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            _buildHeader(context),
            Positioned(
              top: MediaQuery.of(context).size.height * .15,
              right: MediaQuery.of(context).size.width * .25,
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Image.asset("assets/doctor_xray.png"),
              ),
            ),
            _buildFooter(context)
          ],
        ),
      ),
    );
  }

  Padding _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          'Covid-19',
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.black87),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Positioned(
      bottom: 50,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              "Coronavirus disease (COVID-19)",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "is an infectious diease cause by a new\n virus.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1, 1),
                        spreadRadius: 1,
                        blurRadius: 3),
                  ]),
              width: MediaQuery.of(context).size.width * .85,
              height: 60,
              child: Center(
                child: Text(
                  "GET STARTED",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
