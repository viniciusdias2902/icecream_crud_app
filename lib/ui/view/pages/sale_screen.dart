import 'package:flutter/material.dart';
import 'package:icecream_crud_app/ui/view/widgets/data_list_view.dart';
import 'package:icecream_crud_app/ui/viewmodel/sale_view_model.dart';
import 'package:provider/provider.dart';
import 'package:icecream_crud_app/data/models/sale_model.dart';
import 'package:icecream_crud_app/data/models/product_model.dart';
import 'package:icecream_crud_app/data/models/customer_model.dart';
import 'package:icecream_crud_app/data/models/route_model.dart';
import 'package:intl/intl.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadAllData();
    });
  }

  void _loadAllData() {
    final viewModel = context.read<SalesViewModel>();
    viewModel.loadSales();
    viewModel.loadProducts();
    viewModel.loadCustomers();
    viewModel.loadRoutes();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SalesViewModel>();

    return DataListView<SaleModel>(
      title: 'Vendas',
      items: viewModel.sales,
      getTitle: (item) {
        final productName =
            item.product.value?.productName ?? 'Produto não encontrado';
        final customerName =
            item.customer.value?.customerName ?? 'Cliente não encontrado';
        return '$productName - $customerName';
      },
      getSubtitle: (item) {
        final formattedDate = DateFormat('dd/MM/yyyy').format(item.saleDate);
        final totalValue = item.totalValueInCents / 100;
        return 'Qtd: ${item.quantitySold} - R\$ ${totalValue.toStringAsFixed(2)} - $formattedDate';
      },
      onAddPressed: () {
        _loadAllData();
        Future.delayed(const Duration(milliseconds: 100), () {
          final vm = context.read<SalesViewModel>();
          if (vm.products.isEmpty ||
              vm.customers.isEmpty ||
              vm.routes.isEmpty) {
            String message = 'É necessário cadastrar ';
            List<String> missing = [];

            if (vm.products.isEmpty) missing.add('produtos');
            if (vm.customers.isEmpty) missing.add('clientes');
            if (vm.routes.isEmpty) missing.add('rotas');

            message += missing.join(', ') + ' antes de criar vendas.';

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                duration: const Duration(seconds: 3),
              ),
            );
            return;
          }
          _showAddSaleDialog(context);
        });
      },
      onDeletePressed: (index) async {
        final sale = viewModel.sales[index];
        await viewModel.deleteSale(sale.id);
      },
    );
  }

  void _showAddSaleDialog(BuildContext context) {
    final viewModel = context.read<SalesViewModel>();

    ProductModel? selectedProduct;
    CustomerModel? selectedCustomer;
    RouteModel? selectedRoute;
    final TextEditingController quantityController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Adicionar Venda'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<ProductModel>(
                      decoration: const InputDecoration(labelText: 'Produto'),
                      value: selectedProduct,
                      items: viewModel.products.map((product) {
                        return DropdownMenuItem(
                          value: product,
                          child: Text(product.productName),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedProduct = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<CustomerModel>(
                      decoration: const InputDecoration(labelText: 'Cliente'),
                      value: selectedCustomer,
                      items: viewModel.customers.map((customer) {
                        return DropdownMenuItem(
                          value: customer,
                          child: Text(customer.customerName),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCustomer = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<RouteModel>(
                      decoration: const InputDecoration(labelText: 'Rota'),
                      value: selectedRoute,
                      items: viewModel.routes.map((route) {
                        return DropdownMenuItem(
                          value: route,
                          child: Text(route.routeName),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRoute = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: quantityController,
                      decoration: const InputDecoration(
                        labelText: 'Quantidade',
                        hintText: 'Digite a quantidade vendida',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 16),
                    if (selectedProduct != null &&
                        quantityController.text.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Valor Total:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                              ),
                            ),
                            Text(
                              'R\$ ${((selectedProduct!.unitValueInCents * (int.tryParse(quantityController.text) ?? 0)) / 100).toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () async {
                    final quantity = int.tryParse(quantityController.text) ?? 0;

                    if (selectedProduct != null &&
                        selectedCustomer != null &&
                        selectedRoute != null &&
                        quantity > 0) {
                      Navigator.pop(context);

                      await viewModel.addSale(
                        product: selectedProduct!,
                        customer: selectedCustomer!,
                        route: selectedRoute!,
                        quantity: quantity,
                      );

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Venda adicionada com sucesso!'),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.tertiary,
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Por favor, preencha todos os campos corretamente.',
                          ),
                          backgroundColor: Colors.orange,
                        ),
                      );
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
