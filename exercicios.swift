// -----------------------------
// Exercício 1 — Variáveis e Constantes
// -----------------------------

let nome = "Lucas"
var idade = 25

print("Nome:", nome)
print("Idade:", idade)

idade = 26

print("Nova idade:", idade)

// -----------------------------
// Exercício 2 — Número Par ou Ímpar
// -----------------------------

let numero = 7

if numero % 2 == 0 {
    print("O número é par")
} else {
    print("O número é ímpar")
}

// -----------------------------
// Exercício 3 — Números pares de 1 a 10
// -----------------------------

for i in 1...10 {
    if i % 2 == 0 {
        print(i)
    }
}

// -----------------------------
// Exercício 4 — Função de Soma
// -----------------------------

func soma(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let resultado = soma(5, 3)

print("Resultado da soma:", resultado)

// -----------------------------
// Exercício 5 — Array de nomes
// -----------------------------

let nomes = ["Ana", "Carlos", "João", "Marina", "Pedro"]

for nome in nomes {
    print(nome)
}

// -----------------------------
// Exercício 6 — Dicionário de países e capitais
// -----------------------------

var capitais = [
    "Brasil": "Brasília",
    "Argentina": "Buenos Aires",
    "França": "Paris",
    "Japão": "Tóquio"
]

if let capital = capitais["Brasil"] {
    print("Capital do Brasil:", capital)
}

// -----------------------------
// Exercício 7 — If let
// -----------------------------

var nomeOpcional: String? = "Mariana"

if let nome = nomeOpcional {
    print("O nome é", nome)
} else {
    print("Nome não definido")
}


// -----------------------------
// Exercício 8 — Switch de notas
// -----------------------------

let nota = "B"

switch nota {

case "A":
    print("Excelente!")

case "B":
    print("Muito bom!")

case "C":
    print("Bom")

case "D":
    print("Precisa melhorar")

case "F":
    print("Reprovado")

default:
    print("Nota inválida")

}

// -----------------------------
// Exercício 9 — Tupla de produto
// -----------------------------

let produto = ("Notebook", 3500.0, 8)

let (nomeProduto, preco, quantidade) = produto

print(nomeProduto)
print(preco)
print(quantidade)

// -----------------------------
// Exercício 10 — Struct Carro
// -----------------------------

struct Carro {

    var marca: String
    var modelo: String
    var ano: Int

}

let carro1 = Carro(marca: "Toyota", modelo: "Corolla", ano: 2020)

print("Marca:", carro1.marca)
print("Modelo:", carro1.modelo)
print("Ano:", carro1.ano)