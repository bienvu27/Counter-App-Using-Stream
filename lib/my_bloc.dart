import 'dart:async';

class MyBloc {
  int counter = 0;
  final StreamController _counterController = StreamController<int>();
  Stream get counterStream => _counterController.stream;

  void increment(){
    counter++ ;
    _counterController.sink.add(counter);
  }

  void decrement(){
    if(counter < 1){
      return;
    }
    counter-- ;
    _counterController.sink.add(counter);
  }

  void dispose(){
    _counterController.close();
  }
}