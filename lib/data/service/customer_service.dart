import 'package:isar/isar.dart';
import 'package:icecream_crud_app/data/models/customer_model.dart';

class CustomerService {
  final Isar _isar;

  CustomerService(this._isar);

  Future<int> addCustomer(CustomerModel customer) async {
    return await _isar.writeTxn(() async {
      // Salvar o cliente
      final customerId = await _isar.customerModels.put(customer);

      // Salvar o link da rota se existir
      if (customer.route.value != null) {
        await customer.route.save();
      }

      return customerId;
    });
  }

  Future<List<CustomerModel>> getAllCustomers() async {
    return await _isar.customerModels.where().findAll();
  }

  Future<CustomerModel?> getCustomerById(int id) async {
    return await _isar.customerModels.get(id);
  }

  Future<bool> deleteCustomer(int id) async {
    return await _isar.writeTxn(() async {
      return await _isar.customerModels.delete(id);
    });
  }
}
