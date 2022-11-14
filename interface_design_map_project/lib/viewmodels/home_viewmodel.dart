import 'package:flutter/material.dart';
import '../models/bus.dart';
import '../views/busline_view.dart';
import '../views/favorites_view.dart';
import '../views/home_view.dart';
import 'package:provider/provider.dart';

/*import '../router.dart' as LocalRouter;
import '../constants.dart';

class HomeViewModel extends StatefulWidget {
  const HomeViewModel({super.key});

  @override
  State<HomeViewModel> createState() => _HomeViewModelState();
}

class _HomeViewModelState extends State<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/

//Dummy data
final List<Bus> initialData = List.generate(
    3,
    (index) =>
        //Have to figure out a way to individualize alerts
        Bus(title: "7$index" "C", alert: "On time."));

class HomeViewModel extends ChangeNotifier {
  final List<Bus> _buses = initialData;

  // Retrieve all buses
  List<Bus> get buses => _buses;

  // Favorite buses
  final List<Bus> _myList = [];

  // Retrieve favorite buses
  List<Bus> get myList => _myList;

  // Adding a bus to the favorites list
  void addToList(Bus bus) {
    _myList.add(bus);
    notifyListeners();
  }

  // Removing a bus from the favorites list
  void removeFromList(Bus bus) {
    _myList.remove(bus);
    notifyListeners();
  }

  //Is the return value displayed at the top of screen?
  String routes(String src, String dest) {
    if (src == "University of Pittsburgh" && dest == "Kennywood") {
      return "61C McKeesport";
    } else if (src == "Wood & Sixth" && dest == "CCAC South") {
      return "Y49 Prospect Flyer";
    } else {
      return "Sorry, no route exists.";
    }
  }
}


/* testing
class HomeViewModel extends ChangeNotifier {
  List<String> buses = <String>[
    "bus1",
    "bus2",
    "bus3",
    "bus4",
    "bus5",
    "bus6",
    "bus7",
    "bus8",
    "bus9",
    "bus10",
    "bus11",
    "bus12",
    "bus13",
    "bus14",
    "bus15",
    "bus16",
    "bus17",
    "bus18",
    "bus19"
  ];
  List<String> favorites = <String>["favorite1", "favorite2", "favorite3"];
  ValueNotifier<int> favLen = ValueNotifier<int>(2);

  addFavorite(String favorite) {
    favorites.add(favorite);
    print("adding " + favorite);
    for (int i = 0; i < favorites.length; i++) print(favorites[i]);
    notifyListeners();
  }

  removeFavorite(String favorite) {
    favorites.remove(favorite);
    print("removing " + favorite);
    for (int i = 0; i < favorites.length; i++) print(favorites[i]);
    notifyListeners();
  }
}
*/
