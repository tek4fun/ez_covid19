import 'package:ez_covid19/constants.dart';
import 'package:ez_covid19/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailsAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 21),
                      blurRadius: 53,
                      color: Colors.black.withOpacity(.05),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitleWithMoreIcon(),
                    const SizedBox(height: 15),
                    buildCaseNumber(context),
                    const SizedBox(height: 15),
                    const Text(
                      "From Health Center",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: kTextMedium,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const WeeklyChart(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildInfoTextWithPercentage(
                            title: "From Last Week", percentage: "6.43"),
                        buildInfoTextWithPercentage(
                            title: "Recovery Rate", percentage: "9.43"),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 21),
                      blurRadius: 54,
                      color: Colors.black.withOpacity(.05),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Global Map",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SvgPicture.asset("assets/icons/more.svg"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SvgPicture.asset("assets/icons/map.svg"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  RichText buildInfoTextWithPercentage(
      {required String title, required String percentage}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$percentage% \n",
            style: const TextStyle(
              fontSize: 20,
              color: kPrimaryColor,
            ),
          ),
          TextSpan(
            text: title,
            style: const TextStyle(
              color: kTextMedium,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: [
        Text(
          "547 ",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: kPrimaryColor, height: 1.2),
        ),
        const Text(
          "5,9%",
          style: TextStyle(color: kPrimaryColor),
        ),
        SvgPicture.asset("assets/icons/increase.svg"),
      ],
    );
  }

  Row buildTitleWithMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "New Cases",
          style: TextStyle(
            color: kTextMedium,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SvgPicture.asset("assets/icons/more.svg"),
      ],
    );
  }

  AppBar buildDetailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackGroundColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search.svg"),
        ),
      ],
    );
  }
}
