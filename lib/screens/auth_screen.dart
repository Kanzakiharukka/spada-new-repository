import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../services/local_db.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nomeRealController = TextEditingController();
  final _nomeClanController = TextEditingController();
  final _dataNascimentoController = TextEditingController();
  final _whatsappController = TextEditingController();

  File? _imagemSelecionada;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _selecionarImagem() async {
    final picker = ImagePicker();
    final imagem = await picker.pickImage(source: ImageSource.gallery);

    if (imagem != null) {
      setState(() {
        _imagemSelecionada = File(imagem.path);
      });
    }
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorMessage = 'As senhas não coincidem';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final newUser = {
        'email': _emailController.text.trim(),
        'password': _passwordController.text.trim(),
        'name': _nomeRealController.text.trim(),
        'clanName': _nomeClanController.text.trim(),
        'birthDate': _dataNascimentoController.text.trim(),
        'whatsapp': _whatsappController.text.trim(),
        'photoPath': _imagemSelecionada?.path ?? '',
      };

      await LocalDB.insertUser(newUser);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro inesperado: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nomeRealController.dispose();
    _nomeClanController.dispose();
    _dataNascimentoController.dispose();
    _whatsappController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Cadastrar no SPADA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                _buildTextField('Nome Real', _nomeRealController),
                _buildTextField('Nome do Clã', _nomeClanController),
                _buildTextField(
                  'Data de Nascimento (dd/mm/aaaa)',
                  _dataNascimentoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Campo obrigatório';
                    final regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
                    if (!regex.hasMatch(value)) return 'Formato inválido';
                    return null;
                  },
                ),
                _buildTextField(
                  'WhatsApp (somente números, com DDD)',
                  _whatsappController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Campo obrigatório';
                    if (!RegExp(r'^\d{11}$').hasMatch(value)) return 'Número inválido';
                    return null;
                  },
                ),

                const SizedBox(height: 8),
                GestureDetector(
                  onTap: _selecionarImagem,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.image, color: Colors.white),
                        const SizedBox(width: 10),
                        Text(
                          _imagemSelecionada == null
                              ? 'Selecionar Foto'
                              : 'Foto Selecionada!',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                _buildTextField('Email', _emailController, isEmail: true),
                _buildTextField('Senha', _passwordController, isPassword: true),
                _buildTextField('Confirmar Senha', _confirmPasswordController, isPassword: true),

                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),

                const SizedBox(height: 24),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white10,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        ),
                        onPressed: _register,
                        child: const Text('Cadastrar'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool isPassword = false,
    bool isEmail = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white10,
          labelStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(),
        ),
        style: const TextStyle(color: Colors.white),
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Preencha o campo';
              }
              if (isEmail && !value.contains('@')) {
                return 'Digite um email válido';
              }
              if (isPassword && value.length < 6) {
                return 'Senha muito curta';
              }
              return null;
            },
      ),
    );
  }
}
