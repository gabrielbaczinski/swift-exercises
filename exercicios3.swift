// Exercício 1: Enums

enum Resolucao {
    case sd, hd, uhd
}

enum TipoMidia {
    case musica(titulo: String, artista: String, duracao: Int)
    case video(titulo: String, duracao: Int, resolucao: Resolucao)
    case podcast(titulo: String, host: String, episodio: Int)
}

func descreverMidia(midia: TipoMidia) {
    switch midia {
    case .musica(let titulo, let artista, let duracao):
        print("Música: \(titulo) por \(artista) - \(duracao)s")
    case .video(let titulo, let duracao, let resolucao):
        print("Vídeo: \(titulo) - \(duracao)s, Resolução: \(resolucao)")
    case .podcast(let titulo, let host, let episodio):
        print("Podcast: \(titulo) com \(host) - Ep: \(episodio)")
    }
}

// Exercício 2: Closures

func filtrarArray(array: [Int], filtro: (Int) -> Bool) -> [Int] {
    var resultado: [Int] = []
    for numero in array {
        if filtro(numero) {
            resultado.append(numero)
        }
    }
    return resultado
}

let meusNumeros = [1, 2, 3, 4, 5, 6]

let numerosPares = filtrarArray(array: meusNumeros) { numero in
    return numero % 2 == 0
}

class MeuFiltro {
    var valorMinimo = 3
    
    lazy var filtrarComCaptureList: ([Int]) -> [Int] = { [weak self] array in
        guard let self = self else { return [] }
        return filtrarArray(array: array) { $0 > self.valorMinimo }
    }
}

// Exercício 3: Generics

struct ResultadoOperacao<T, E> {
    var sucesso: T?
    var erro: E?
    
    init(sucesso: T) {
        self.sucesso = sucesso
        self.erro = nil
    }
    
    init(erro: E) {
        self.sucesso = nil
        self.erro = erro
    }
}

func converterStrings(strings: [String]) -> [ResultadoOperacao<Int, String>] {
    var resultados: [ResultadoOperacao<Int, String>] = []
    
    for texto in strings {
        if let numeroConvertido = Int(texto) {
            resultados.append(ResultadoOperacao(sucesso: numeroConvertido))
        } else {
            resultados.append(ResultadoOperacao(erro: "Erro ao converter a string: \(texto)"))
        }
    }
    
    return resultados
}

// Exercício 4: Protocolos

protocol Desenhavel {
    var area: Double { get }
    func desenhar()
}

extension Desenhavel {
    func imprimirDescricao() {
        print("Esta é uma forma com área de \(area)")
    }
}

struct Circulo: Desenhavel {
    var raio: Double
    var area: Double {
        return 3.14159 * (raio * raio)
    }
    
    func desenhar() {
        print("Desenhando um círculo com raio \(raio)")
    }
}

struct Retangulo: Desenhavel {
    var base: Double
    var altura: Double
    var area: Double {
        return base * altura
    }
    
    func desenhar() {
        print("Desenhando um retângulo de base \(base) e altura \(altura)")
    }
}

func desenharTudo(formas: [Desenhavel]) {
    for forma in formas {
        forma.desenhar()
    }
}