//https://pub.dev/packages/decimal

import 'package:flutter/material.dart';

class SaleProductForm extends StatefulWidget {
  const SaleProductForm({super.key});

  @override
  State<SaleProductForm> createState() => _SaleProductFormState();
}

class _SaleProductFormState extends State<SaleProductForm> {
  bool roundOff = false;
  TextEditingController partyName = TextEditingController();
  TextEditingController partyCont = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController productAmt = TextEditingController();
  TextEditingController productDis = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late AlertDialog dialog;

  void validate() {
    if (_formKey.currentState!.validate()) {
      showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
                titlePadding:
                    const EdgeInsets.only(top: 20, right: 20, left: 20),
                title: const Text('Form details'),
                contentPadding: const EdgeInsets.all(20),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text('Party Name is: ${partyName.text}')),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text('Contact is: ${partyCont.text}')),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                            'Contact is: ${(double.parse(productAmt.text) - double.parse(productDis.text)).toString()}')),
                  ],
                ),
                actions: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('CLOSE'),
                    ),
                  )
                ],
              ));
    }
  }

  String? validation(value) {
    if (value!.isEmpty) {
      return "required";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Please Enter Correct Details'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      child: TextFormField(
                        controller: partyName,
                        decoration: const InputDecoration(
                          hintText: 'Enter Name',
                          labelText: 'Party Name',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD2DBE0), width: 3.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD2DBE0), width: 3.0)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD2DBE0), width: 3.0)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD2DBE0), width: 3.0)),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(6.0)),
                    SizedBox(
                      child: TextFormField(
                        maxLength: 10,
                        validator: (value) {
                          if (value!.isNotEmpty && value.length < 10) {
                            return "Invalid Contact no.";
                          } else {
                            return null;
                          }
                        },
                        controller: partyCont,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Enter Contact No.',
                          labelText: 'Contact No.',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD2DBE0), width: 3.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD2DBE0), width: 3.0)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD2DBE0), width: 3.0)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD2DBE0), width: 3.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      child: TextFormField(
                        // validation
                        validator: validation,
                        controller: productName,
                        decoration: const InputDecoration(
                          hintText: 'Enter Product',
                          labelText: 'Product Name',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD2DBE0), width: 3.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD2DBE0), width: 3.0)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD2DBE0), width: 3.0)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD2DBE0), width: 3.0)),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(6.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            // validation
                            validator: validation,
                            controller: productAmt,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: '0.00',
                              labelText: 'Product Amount',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFD2DBE0), width: 3.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFD2DBE0), width: 3.0)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFD2DBE0), width: 3.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFD2DBE0), width: 3.0)),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
                        Expanded(
                          child: TextFormField(
                            controller: productDis,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: '0.00',
                              labelText: 'Discount',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFD2DBE0), width: 3.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFD2DBE0), width: 3.0)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFD2DBE0), width: 3.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFD2DBE0), width: 3.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          validate();
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text('Calculate Total Amount'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
