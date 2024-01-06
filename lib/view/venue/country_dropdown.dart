import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:provider/provider.dart';
import 'package:skdoosh/data/response/status.dart';
import 'package:skdoosh/model/country_response.dart';
import 'package:skdoosh/view_models/venu_view_model.dart';

class CountryDropdown extends StatefulWidget {
  const CountryDropdown({super.key});


  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  VenuViewModel venueViewModel = VenuViewModel();
  var items = [
    'India',

  ];
  String dropdownvalue = 'India';

  @override
  void initState() {
    venueViewModel.fetchCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<VenuViewModel>(
          create: (BuildContext context) => venueViewModel,
          child: Consumer<VenuViewModel>(builder: (context, value, _) {
            //debugPrint(value.cntryList.status.toString());
            switch (value.cntryList.status) {
              case Status.LOADING:
                return SizedBox(
                  height: 50,
                  child: const Center(child: CircularProgressIndicator()),
                );
              case Status.ERROR:
                return Text(value.cntryList.message.toString());
              case Status.COMPLETED:
                debugPrint(value.cntryList.data!.data!.length.toString());
                // _popularMovieList(value);
                return DropdownButton(
                  //value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (Object? value) {
                    dropdownvalue = value.toString();
                  },
                  value: dropdownvalue,
                );
              default:
                return const Text("Hata");
            }
          })),
    );
  }
}
