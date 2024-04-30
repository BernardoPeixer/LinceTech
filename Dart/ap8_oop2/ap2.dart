  // Classe abstrata
abstract class Animal {
  // Função comer
  void comer() {
    print("O animal está comendo");
  }
  // Função beber
  void beber() {
    print("O animal está bebendo");
  }
}

  // Classe concreta herdando abstrata
class Cachorro extends Animal {
  // Função latir
  void latir() {
    print("O cachorro está latindo");
  }
}

void main() {
  // Criando cachorro
  Cachorro cachorro = Cachorro();
  // Executando funções
  cachorro.beber();
  cachorro.comer();
  cachorro.latir();
}