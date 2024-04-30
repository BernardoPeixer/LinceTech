  // Classe abstrata Dormindo
abstract class Dormindo {
  void dormir() {
    print("O animal está dormindo");
  }
}

  // Classe abstrata Comendo
abstract class Comendo {
  void comer() {
    print("O animal está comendo");
  }
}

class Camelo implements Dormindo, Comendo {
  //Sobrescrita dormir
  @override
  void dormir() {
    print("O camelo está dormindo.");
  }

  // Sobrescrita comer
  @override 
  void comer() {
    print("O camelo está comendo.");
  }
}

void main() {
  // Executando funções
  Camelo().comer();
  Camelo().dormir();
}