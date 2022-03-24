import 'package:flutter/material.dart';

class ModalAbsen extends StatefulWidget {
  const ModalAbsen({ Key? key }) : super(key: key);

  @override
  State<ModalAbsen> createState() => _ModalAbsenState();
}

class _ModalAbsenState extends State<ModalAbsen> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
              content: Stack(
                overflow:Overflow.visible,
                children: [
                  Positioned(
                    top: -40.0,
                    right: -40.0,
                    child: InkResponse(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        child: Icon(Icons.close),
                        backgroundColor: Colors.red,
                      ),
                    ) 
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextButton(
                            child: Text("Submit"),
                            onPressed: (){
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                              }
                            },
                          ),
                        )
                      ],
                    )
                  )
                ], 
              ),
            ),
    );
  }
}