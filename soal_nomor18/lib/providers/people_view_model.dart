import 'package:flutter/material.dart';
import 'package:soal_nomor18/components/result_state.dart';
import 'package:soal_nomor18/models/people_model.dart';
import 'package:soal_nomor18/services/remote_services.dart';

class PeopleViewModel extends ChangeNotifier {
  final RemoteServices remoteServices;

  PeopleViewModel({required this.remoteServices}) {
    fetchAllPeople();
  }

  late PeopleModel peopleModel;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  PeopleModel get result => peopleModel;

  ResultState get state => _state;

  Future<dynamic> fetchAllPeople() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final people = await remoteServices.fetchPeople();
      if (people.results.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return peopleModel = people;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

// enum PeopleViewState{
//   none,
//   loading,
//   loaded,
//   error,
// }

// class PeopleViewModel with ChangeNotifier{
//   final RemoteServices remoteServices;

//   PeopleViewModel({required this.remoteServices}){
//     fetchPeople();
//   }
  
//   String messages = '';
//   String get message => messages;

//   PeopleViewState states = PeopleViewState.none;
//   PeopleViewState get state => states;

//   late dynamic peopleList;
//   dynamic get list => peopleList;

//   // PeopleModel lists;
//   // PeopleModel get list => lists;

//   Future <dynamic> fetchPeople() async{
//     try {
//       states = PeopleViewState.loading;
//       notifyListeners();
//       final fetchPeople = await remoteServices.fetchPeople();
//       states = PeopleViewState.loaded;
//       notifyListeners();
//       return peopleList = fetchPeople?.results;
//     } catch (e) {
//       states = PeopleViewState.error;
//       notifyListeners();
//       return messages = 'Error: $e';
//     }
//   }
// }