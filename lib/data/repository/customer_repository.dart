import 'package:icecream_crud_app/data/models/customer_model.dart';
import 'package:icecream_crud_app/data/repository/base_repository.dart';
import 'package:icecream_crud_app/data/service/customer_service.dart';
import 'package:isar/isar.dart';

class CustomerRepository extends BaseRepository<CustomerModel> {
  final CustomerService _customerService;

  CustomerRepository(Isar isar, this._customerService) : super(isar);

  @override
  IsarCollection<CustomerModel> get collection => isar.customerModels;

  @override
  Future<int> add(CustomerModel customer) =>
      _customerService.addCustomer(customer);

  @override
  Future<List<CustomerModel>> getAll() => _customerService.getAllCustomers();

  @override
  Future<CustomerModel?> getById(int id) =>
      _customerService.getCustomerById(id);

  @override
  Future<bool> delete(int id) => _customerService.deleteCustomer(id);
}
