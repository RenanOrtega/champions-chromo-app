import 'package:champions_chromo_app/constants/route_constants.dart';
import 'package:champions_chromo_app/domain/entities/customer_entity.dart';
import 'package:champions_chromo_app/domain/entities/pix/pix_entity.dart';
import 'package:champions_chromo_app/presentation/pages/checkout/components/cpf_input_formatter.dart';
import 'package:champions_chromo_app/presentation/pages/checkout/components/payment_method_card.dart';
import 'package:champions_chromo_app/presentation/pages/checkout/components/phone_input_formatter.dart';
import 'package:champions_chromo_app/presentation/pages/checkout/components/step_indicator.dart';
import 'package:champions_chromo_app/presentation/providers/cart/notifiers/cart_notifier.dart';
import 'package:champions_chromo_app/presentation/providers/pix/pix_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';

class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({super.key});

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  final PageController _pageController = PageController();
  final _formKey = GlobalKey<FormState>();

  int _currentStep = 0;
  String _selectedPaymentMethod = 'pix';

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cpfController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep == 0) {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _currentStep = 1;
        });
        _pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );

        _createPixPayment();
      }
    } else if (_currentStep == 1) {
      if (_selectedPaymentMethod == 'pix') {
        _createPixPayment();

        setState(() {
          _currentStep = 2;
        });
        _pageController.animateToPage(
          2,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _showOrderConfirmationDialog();
      }
    } else if (_currentStep == 2) {
      _showOrderConfirmationDialog();
    }
  }

  void _createPixPayment() {
    final cart = ref.read(cartProvider);
    final total =
        cart.items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

    final amountInCents = (total * 100).toInt();

    final customer = Customer(
      name: _nameController.text,
      cellphone: _phoneController.text.replaceAll(RegExp(r'\D'), ''),
      email: _emailController.text,
      taxId: _cpfController.text.replaceAll(RegExp(r'\D'), ''),
    );

    final itemsDescription = cart.items
        .map((item) =>
            '\n${item.quantity}x #${item.stickerNumber} - ${item.albumName}')
        .join(', ');

    final description = 'Compra Champions Chromo: $itemsDescription';

    ref.read(pixProvider.notifier).createPix(
          amountInCents,
          3600,
          description,
          customer,
        );
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });

      _pageController.animateToPage(
        _currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(RouteConstants.cart);
    }
  }

  void _showOrderConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: const Text('Pedido realizado com sucesso!'),
          content: const Text('Obrigado pela compra!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(cartProvider.notifier).clearCart();
                context.go(RouteConstants.schools);
              },
              child: const Text('OK'),
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final total =
        cart.items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade700, Colors.blue.shade500],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: _previousStep,
                          ),
                        ],
                      ),
                      Text(
                        'Checkout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Stack(
                    children: [
                      // Linhas de conexão (posicionadas no meio dos círculos)
                      Positioned(
                        top: 15, // Metade da altura do círculo (30/2)
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 80),
                            Container(
                              width: 60,
                              height: 2,
                              color: _currentStep > 0
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.3),
                            ),
                            SizedBox(width: 80),
                            Container(
                              width: 60,
                              height: 2,
                              color: _currentStep > 1
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.3),
                            ),
                            SizedBox(width: 80),
                          ],
                        ),
                      ),
                      // Indicadores
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StepIndicator(
                            number: 1,
                            title: 'Dados',
                            isActive: _currentStep == 0,
                            isCompleted: _currentStep > 0,
                          ),
                          StepIndicator(
                            number: 2,
                            title: 'Selecione',
                            isActive: _currentStep == 1,
                            isCompleted: _currentStep > 1,
                          ),
                          StepIndicator(
                            number: 3,
                            title: 'Pague',
                            isActive: _currentStep == 2,
                            isCompleted: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // Customer Information Page
                _buildCustomerInfoPage(),
                // Payment Method Page
                _buildPaymentMethodPage(),
                // PIX Payment Page
                _buildPixPaymentPage(),
              ],
            ),
          ),
          if (_currentStep < 2)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'R\$ ${total.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: _nextStep,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          _currentStep == 0
                              ? 'Continuar'
                              : _currentStep == 1
                                  ? 'Continuar'
                                  : 'Finalizar Compra',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget _buildCustomerInfoPage() {
    return SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Informações de Contato',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration(
                  label: 'Nome completo',
                  hint: 'Digite seu nome completo',
                  icon: Icons.person_outline,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu nome';
                  }
                  if (value.split(' ').length < 2) {
                    return 'Por favor, digite nome e sobrenome';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              // Celular
              TextFormField(
                controller: _phoneController,
                decoration: _inputDecoration(
                  label: 'Celular',
                  hint: '(11) 99999-9999',
                  icon: Icons.phone_android,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu celular';
                  }
                  // Remover formatação para verificar o comprimento
                  final digits = value.replaceAll(RegExp(r'\D'), '');
                  if (digits.length < 10 || digits.length > 11) {
                    return 'Celular inválido';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  PhoneInputFormatter(),
                ],
              ),
              const SizedBox(height: 16),
              // Email
              TextFormField(
                controller: _emailController,
                decoration: _inputDecoration(
                  label: 'E-mail',
                  hint: 'seu@email.com',
                  icon: Icons.email_outlined,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu e-mail';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'E-mail inválido';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              // CPF
              TextFormField(
                controller: _cpfController,
                decoration: _inputDecoration(
                  label: 'CPF',
                  hint: '000.000.000-00',
                  icon: Icons.badge_outlined,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu CPF';
                  }
                  // Remover formatação para verificar o comprimento
                  final digits = value.replaceAll(RegExp(r'\D'), '');
                  if (digits.length != 11) {
                    return 'CPF inválido';
                  }
                  // Aqui poderia implementar validação mais complexa do CPF
                  return null;
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CPFInputFormatter(),
                ],
              ),
            ])));
  }

  Widget _buildPaymentMethodPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Método de Pagamento',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          PaymentMethodCard(
            title: 'PIX',
            subtitle: 'Pagamento instantâneo',
            icon: Icons.qr_code,
            isSelected: _selectedPaymentMethod == 'pix',
            onTap: () {
              setState(() {
                _selectedPaymentMethod = 'pix';
              });
            },
          ),
          Opacity(
            opacity: 0.5,
            child: PaymentMethodCard(
              title: 'Cartão de Crédito',
              subtitle: 'Em breve disponível',
              icon: Icons.credit_card,
              isSelected: false,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Pagamento com cartão estará disponível em breve!'),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildPixPaymentPage() {
    final pixState = ref.watch(pixProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pixState.when(
            data: (pixResponse) {
              if (pixResponse.error != null && pixResponse.error!.isNotEmpty) {
                return Center(
                  child: Text(
                    'Erro ao gerar PIX: ${pixResponse.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              final pix = pixResponse.data;

              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'QR Code',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Image.memory(
                          base64DecodeImage(pix),
                          height: 200,
                          width: 200,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Escaneie o QR Code acima com seu aplicativo de pagamento',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Código PIX',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  pix.brCode,
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: pix.brCode));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Código PIX copiado!'),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Copie o código acima e cole no seu aplicativo de pagamento',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stack) => Center(
              child: Text(
                'Erro ao gerar PIX: $error',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Uint8List base64DecodeImage(Pix pix) {
    final base64Data = pix.brCodeBase64
        .replaceAll(RegExp(r'^data:image\/[a-zA-Z]*;base64,'), '');
    return base64Decode(base64Data);
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.blue.shade300, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }
}
