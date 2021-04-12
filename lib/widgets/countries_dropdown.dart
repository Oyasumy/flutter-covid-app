import 'package:flutter/material.dart';

class CountriesDropdown extends StatelessWidget {
  final List<String> countries;
  final String country;
  final Function(String) onchange;

  const CountriesDropdown(
      {@required this.countries,
      @required this.country,
      @required this.onchange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            value: country,
            items: countries
                .map(
                  (e) => DropdownMenuItem(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 12.0,
                          child: Image.asset(
                              'assets/images/${e.toLowerCase()}_flag.png'),
                        ),
                        SizedBox(width: 8),
                        Text(
                          e,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ],
                    ),
                    value: e,
                  ),
                )
                .toList(),
            onChanged: onchange),
      ),
    );
  }
}
