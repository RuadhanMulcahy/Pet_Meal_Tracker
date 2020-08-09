class DateTimeHandler {

  // Get Current Date
  String getDate() {

    var dateTime = DateTime.now().toString();
  
    List<String> dateTimeSplit = dateTime.split(new RegExp("-*:* *"));
    
    return dateTimeSplit.sublist(0, 8).join();
  }

  // Get Current Time
  String getTime() {

    var dateTime = DateTime.now().toString();
  
    List<String> dateTimeSplit = dateTime.split(new RegExp("-*:* *"));
    
    return dateTimeSplit.sublist(8,10).join() + ":" + dateTimeSplit.sublist(10,12).join();
  }
}