import 'package:flutter/material.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Empresas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Ícone de empresa centralizado
            Center(
              child: Icon(
                Icons.business,
                size: 100,
              ),
            ),
            SizedBox(height: 20),
            // Campo de busca
            TextField(
              decoration: InputDecoration(
                hintText: 'Busque por empresa',
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xFF0073BC).withOpacity(0.28),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                suffixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Retângulo principal
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Empresa',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Remaza'),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          isExpanded
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                        ),
                        onPressed: toggleExpanded,
                      ),
                    ],
                  ),
                  if (isExpanded)
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF0073BC), // Fundo azul que engloba todas as BranchTile
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        children: [
                          BranchTile(branchName: 'Filial 1', cnpj: '00.000.000/0001-00'),
                          BranchTile(branchName: 'Filial 2', cnpj: '00.000.000/0002-00'),
                          BranchTile(branchName: 'Filial 3', cnpj: '00.000.000/0003-00'),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BranchTile extends StatelessWidget {
  final String branchName;
  final String cnpj;

  const BranchTile({required this.branchName, required this.cnpj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white, // Fundo branco
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                branchName,
                style: TextStyle(
                  color: Colors.black, // Texto azul
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                cnpj,
                style: TextStyle(
                  color: Colors.black, // Texto azul
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Color(0xFF0073BC), // Fundo azul
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Icon(Icons.visibility, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
