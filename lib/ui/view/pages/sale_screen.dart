import 'package:flutter/material.dart';
import 'package:icecream_crud_app/ui/view/widgets/data_list_view.dart';
import 'package:icecream_crud_app/ui/viewmodel/sale_view_model.dart';
import 'package:provider/provider.dart';
import 'package:icecream_crud_app/data/models/sale_model.dart';
import 'package:icecream_crud_app/data/models/product_model.dart';
import 'package:icecream_crud_app/data/models/customer_model.dart';
import 'package:icecream_crud_app/data/models/route_model.dart';
import 'package:intl/intl.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  void initState() {
    super.initState();
    // Carregar vendas assim que a tela for exibida pela primeira vez
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SalesViewModel>().loadSales();
    });
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
        // Verificar se há dados necessários antes de mostrar o diálogo
        if (viewModel.products.isEmpty ||
            viewModel.customers.isEmpty ||
            viewModel.routes.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'É necessário cadastrar produtos, clientes e rotas antes de criar vendas.',
              ),
            ),
          );
          return;
        }
        // Mostrar o diálogo para adicionar venda
        _showAddSaleDialog(context);
      },
      onDeletePressed: (index) async {
        final sale = viewModel.sales[index];
        // Aguardar a exclusão da venda
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
                    // Dropdown de Produtos
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

                    // Dropdown de Clientes
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

                    // Dropdown de Rotas
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

                    // Campo de Quantidade
                    TextField(
                      controller: quantityController,
                      decoration: const InputDecoration(
                        labelText: 'Quantidade',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),

                    // Mostrar valor total se produto e quantidade estiverem preenchidos
                    if (selectedProduct != null &&
                        quantityController.text.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Valor Total: R\$ ${((selectedProduct!.unitValueInCents * (int.tryParse(quantityController.text) ?? 0)) / 100).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                          ),
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
                  onPressed: () {
                    final quantity = int.tryParse(quantityController.text) ?? 0;

                    if (selectedProduct != null &&
                        selectedCustomer != null &&
                        selectedRoute != null &&
                        quantity > 0) {
                      viewModel.addSale(
                        product: selectedProduct!,
                        customer: selectedCustomer!,
                        route: selectedRoute!,
                        quantity: quantity,
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Por favor, preencha todos os campos corretamente.',
                          ),
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
