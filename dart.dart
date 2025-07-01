// data: 01-07-2025
import 'dart:convert';

var name = 'Guilherme'; // se não declarar tipo de variavel, o dart tenta adivinhar qual. Se passamos o mouse em cima, vemos escrito dynamic.

final String lastName = 'Davelli'; // final significa que o valor não pode ser alterado após a atribuição inicial

int sum(int n1,int n2){ // mostrar para o dart se é int etc é bom.
  for (var i =0; i>10; i++){
    var i2= 10; //lexical escope. Só vale para o escopo.

}
  return n1+n2; 
}
var opcional = "colocar  n2 entre[] torna opcional e valor dentro dele null";

var parametro_nomeado = " Quando coloca entre chaves dentro({n3 + n4}) vira um parametro nomeado. Quando é assim , nenhum é obrigatório.";

class UserModel {
  final String firstName;
  final String lastName;
  final String fullName; 

  const UserModel(this.firstName,this.lastName): fullName =  '$firstName $lastName';
  UserModel.fromJson(Map json) : this(json['firstName'], json['lastName']); // Valores que viriam da API por exemplo.
  factory UserModel.fromJsonString(String json){
    final map = jsonDecode(json);
    return UserModel.fromJson(map);//  construtores em dart.
}
Future<void> save() async{
  await Future.delayed(Duration(seconds:2));
}// programacao asíncrona. Método save para salvar que vai no BD ou algo assim asincrono. Future seria algo similar ao promisse do JavaScript
}

enum ValidationError{
  requiredField,
  invalidField
}

extension ValidationErrorExtension on ValidationError{
  String get description {
    switch (this){
      case ValidationError.requiredField: return 'Campo Obrigatório';
      case ValidationError.invalidField: return 'Campo inválido';
      default:
      return 'Error Genérico';
    }
  }
}


Future<void> main ()async{
  print(name + ' ' + lastName); 
  var s = sum(2,3);  
  print(s);  // precisa colocar o ;
  print(opcional);
  print(parametro_nomeado);
  var user = UserModel('Guilherme','Davelli');
  print('Nome vindo da classe = ' + ' ' + user.firstName + ' '+ user.lastName);
  print(user.fullName);

  const u1 = UserModel ('Pessoa', 'Sobrenome');
  const u2 = UserModel ('Pessoa', 'Sobrenome'); // const aqui faz alocação na memoria de forma diferente. 
  print (identical(u1,u2));
  var _variavel = 'Essa variavel é privada. Por padrão, todas a variaveis, classe etc são publicas. Quando colocamos _ na frente, ela vira privada.';
  print (_variavel);
  var error = ValidationError.invalidField;
  
  await u1.save();
  print (u1.fullName);
}