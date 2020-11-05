import 'package:covid19/app/core/consts.dart';
import 'package:covid19/app/ui/dashboard.dart';
import 'package:covid19/app/ui/home_view.dart';
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
      padding: const EdgeInsets.only(top: 40.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          'COVID-19',
          style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              fontFamily: 'PlayfairDisplay',
              color: Colors.black87),
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeView()));
              },
              child: Container(
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
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
