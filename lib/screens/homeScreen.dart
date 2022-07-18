
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/Models/ProductionCompaniesModel.dart';
import 'package:movies/blocs/productionCompaniesBloc.dart';
import 'package:movies/comman/strings_en.dart';
import 'otpScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _auth = FirebaseAuth.instance;
  final _bloc = ProductionCompanyBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.productionLoading();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(homeScreen["production"]!),),
      body:  StreamBuilder<List<ProductionCompaniesBloc>>(
          stream: _bloc.outProduction,
          initialData: [],
          builder: (context, snapshot) {
            return snapshot.data!.length>0?
            ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  return getBody(snapshot.data![index]);
                }):Container();

          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          await _auth.signOut();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: Icon(Icons.logout),
      ),
    );
  }
  Widget getBody(ProductionCompaniesBloc productionCompaniesBloc){
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20,),
          ListTile(
            title: Text(productionCompaniesBloc.name.toString()),
          ),
        ],
      )
    );
  }
}

