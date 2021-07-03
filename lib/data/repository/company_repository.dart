import 'package:barber/data/models/company_model.dart';
import 'package:barber/data/provider/companies_provider.dart';
import 'package:get/get.dart';

class CompanyRepository {
  final CompanyProvider apiClient = Get.find<CompanyProvider>();

  getAll() async{
    List<Company> list = <Company>[];
    var response = await apiClient.getAll();
    if(response != null){
      response.forEach((e){
        print(Company.fromJson(e).toJson());
        list.add(Company.fromJson(e));
      });
    }

    return list;
    
  }
}