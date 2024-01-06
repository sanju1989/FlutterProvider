import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:provider/provider.dart';
import 'package:skdoosh/data/response/status.dart';
import 'package:skdoosh/model/country_response.dart';
import 'package:skdoosh/view_models/venu_view_model.dart';

class StateDropdown extends StatefulWidget {
  const StateDropdown({super.key});

  @override
  State<StateDropdown> createState() => _StateDropdownState();
}

class _StateDropdownState extends State<StateDropdown> {
  VenuViewModel venueViewModel = VenuViewModel();
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var dropdownvalue ;


  @override
  void initState() {
    Map data={
      'country_id': '1',
    };
    venueViewModel.fetchStates(data, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<VenuViewModel>(
          create: (BuildContext context) => venueViewModel,
          child: Consumer<VenuViewModel>(builder: (context, value, _) {
            debugPrint(value.stateList.status.toString());
            switch (value.stateList.status) {
              case Status.LOADING:
                return SizedBox(
                  height: 50,
                  child: const Center(child: CircularProgressIndicator()),
                );
              case Status.ERROR:
                return Text(value.stateList.message.toString());
              case Status.COMPLETED:
                debugPrint(value.stateList.data!.data!.length.toString());
                // _popularMovieList(value);
                return DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: value.stateList.data!.data!.map((item) {
                    return DropdownMenuItem(
                      value: item.stateId.toString(),
                      child: Text(item.state.toString(),style: TextStyle(fontSize: 9),),
                    );
                  }).toList(),
                  onChanged: (Object? value) {
                    debugPrint(value.toString());
                    dropdownvalue = value.toString();
                    Map data={
                      'state_id': '1',
                    };
                    venueViewModel.fetchCities(data, context);
                  },
                );
              default:
                return const Text("Hata");
            }
          })),
    );
  }
}
