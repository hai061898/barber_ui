class SchedulesRepository{
   final ScheduleProvide apiClient = Get.find<ScheduleApiClient>();
  
  Future<List<Schedule>> getAll() async{
    List<Schedule> list = <Schedule>[];
    var response = await apiClient.getAll();
    if(response != null){
      response.forEach((e){
        //print(Schedule.fromJson(e).toJson());
        list.add(Schedule.fromJson(e));
      });
    }

    return list;
    
  }
  add(String date, String hourStart, String hourEnd, Employee employee, Service service) async{
    return Schedule.fromJson(await apiClient.add(date, hourStart, hourEnd, employee, service));
  }
}