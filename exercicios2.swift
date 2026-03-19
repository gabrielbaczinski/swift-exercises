import Foundation

// MARK: - Extensions
extension String {
    func formatarParaNumeroSerie(tamanhoTotal: Int = 8) -> String {
        let zerosFaltando = tamanhoTotal - self.count
        if zerosFaltando > 0 {
            let zeros = String(repeating: "0", count: zerosFaltando)
            return zeros + self
        }
        return self
    }
}

// MARK: - Classes Base
class DispositivoEletronico {
    
    let marca: String
    var modelo: String
    
    var preco: Double {
        willSet {
            print("⚠️ [SISTEMA] O preço de \(marca) \(modelo) vai mudar de R$\(preco) para R$\(newValue).")
        }
        didSet {
            print("✅ [SISTEMA] O preço de \(marca) \(modelo) foi atualizado de R$\(oldValue) para R$\(preco).")
        }
    }
    
    private(set) var numeroSerie: String
    var ligado: Bool = false 
    
    var precoComDesconto: Double {
        return preco * 0.90 
    }
    
    init(marca: String, modelo: String, preco: Double) {
        self.marca = marca
        self.modelo = modelo
        self.preco = preco
        
        let numeroAleatorio = String(Int.random(in: 1...9999))
        self.numeroSerie = "SN" + numeroAleatorio.formatarParaNumeroSerie(tamanhoTotal: 6)
    }
    
    convenience init(marca: String, modelo: String) {
        self.init(marca: marca, modelo: modelo, preco: 99.99)
    }
    
    func ligar() {
        if !ligado {
            ligado = true
            print("🔌 \(marca) \(modelo) ligou.")
        } else {
            print("🔌 \(marca) \(modelo) já estava ligado.")
        }
    }
    
    func desligar() {
        if ligado {
            ligado = false
            print("💤 \(marca) \(modelo) desligou.")
        } else {
            print("💤 \(marca) \(modelo) já está desligado.")
        }
    }
    
    func exibirDetalhes() {
        let status = ligado ? "ON" : "OFF"
        print("📱 [\(status)] \(marca) \(modelo) | Série: \(numeroSerie) | Preço: R$\(preco)")
    }
    
    func aplicarDesconto(percentual: Double) {
        let desconto = preco * (percentual / 100)
        self.preco -= desconto 
    }
    
    deinit {
        print("💀 Limpando a memória: O dispositivo \(marca) \(modelo) foi desalocado.")
    }
}

// MARK: - Subclasses
final class Smartphone: DispositivoEletronico {
    var tamanhoTela: Double
    var temCamera: Bool 
    
    init(marca: String, modelo: String, preco: Double, tamanhoTela: Double, temCamera: Bool) {
        self.tamanhoTela = tamanhoTela
        self.temCamera = temCamera
        super.init(marca: marca, modelo: modelo, preco: preco)
    }
    
    override func exibirDetalhes() {
        super.exibirDetalhes() 
        let infoCamera = temCamera ? "Tem câmera" : "Não tem câmera"
        print("   ↳ Tela: \(tamanhoTela)\" | \(infoCamera)")
    }
    
    func tirarFoto() {
        if ligado && temCamera {
            print("📸 Click! Foto tirada com o \(modelo).")
        } else if !ligado {
            print("🚫 Celular desligado.")
        } else {
            print("🚫 O \(modelo) não tem câmera.")
        }
    }
}

class Notebook: DispositivoEletronico {
    var tamanhoTela: Double 
    var capacidadeArmazenamento: Int
    
    init(marca: String, modelo: String, preco: Double, tamanhoTela: Double, armazenamento: Int) {
        self.tamanhoTela = tamanhoTela
        self.capacidadeArmazenamento = armazenamento
        super.init(marca: marca, modelo: modelo, preco: preco)
    }
    
    override func exibirDetalhes() {
        super.exibirDetalhes()
        print("   ↳ Tela: \(tamanhoTela)\" | SSD: \(capacidadeArmazenamento)GB") 
    }
}

// MARK: - Protocolos
protocol Atualizavel {
    func atualizarSoftware()
}

extension Notebook: Atualizavel {
    func atualizarSoftware() {
        print("🔄 Fazendo o download dos pacotes... O \(marca) \(modelo) foi atualizado com sucesso!") 
    }
}

// MARK: - Structs
struct Acessorio {
    var tipo: String
    var cor: String
    var preco: Double
}

// MARK: - Execução / Testes
print("--- 🛒 INICIANDO O SISTEMA DA LOJA ---\n")

let celular1 = Smartphone(marca: "Apple", modelo: "iPhone 15", preco: 7000.0, tamanhoTela: 6.1, temCamera: true)
let note1 = Notebook(marca: "Dell", modelo: "XPS 13", preco: 8500.0, tamanhoTela: 13.4, armazenamento: 512)
let celular2 = Smartphone(marca: "Nokia", modelo: "Tijolão 1100", preco: 150.0, tamanhoTela: 1.5, temCamera: false)

let capaSilicone = Acessorio(tipo: "Capa", cor: "Azul", preco: 50.0)

let estoque: [DispositivoEletronico] = [celular1, note1, celular2]

for dispositivo in estoque {
    print("\n-------------------------")
    dispositivo.ligar()
    dispositivo.exibirDetalhes() 
    
    if let smart = dispositivo as? Smartphone {
        smart.tirarFoto()
    }
    
    if let note = dispositivo as? Notebook {
        note.atualizarSoftware()
    }
}

print("\n-------------------------")
print("--- 💸 HORA DA PROMOÇÃO ---")
celular1.aplicarDesconto(percentual: 10)
print("Preço final: R$\(celular1.precoComDesconto)")

print("\n--- 🧹 FIM DO PROGRAMA ---")