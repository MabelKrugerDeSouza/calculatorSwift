//
//  ViewController.swift
//  teste
//
//  Created by Mabel Kruger de Souza on 09/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    // Label
    @IBOutlet weak var lblMostraResultado: UILabel!
    
    //Botões Funcionabilidade
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnMaisEMenos: UIButton!
    @IBOutlet weak var btnPorcen: UIButton!
    @IBOutlet weak var btnDivisao: UIButton!
    @IBOutlet weak var btnMultiplicacao: UIButton!
    @IBOutlet weak var btnSub: UIButton!
    @IBOutlet weak var btnSoma: UIButton!
    @IBOutlet weak var btnIgual: UIButton!
    @IBOutlet weak var btnVirgula: UIButton!
    
    //Botões numeros
    @IBOutlet weak var btnZero: UIButton!
    @IBOutlet weak var btnUm: UIButton!
    @IBOutlet weak var btnDois: UIButton!
    @IBOutlet weak var btnTres: UIButton!
    @IBOutlet weak var btnQuatro: UIButton!
    @IBOutlet weak var bntCinco: UIButton!
    @IBOutlet weak var btnSeis: UIButton!
    @IBOutlet weak var btnSete: UIButton!
    @IBOutlet weak var btnOito: UIButton!
    @IBOutlet weak var btnNove: UIButton!
    
    var numero1 = ""
    var numero2 = ""
    var operacao: String = ""
    var calculou: Bool = false
   
    //MARK - FUNCÕES
    override func viewDidLoad() {
        super.viewDidLoad()
        limparTela()
    }
    
    func limparTela(){
        numero1 = ""
        numero2 = ""
        operacao = ""
        lblMostraResultado.text = " "
    }
    
    func atualizaHistorico( _texto : String){
        if  operacao == ""{
            numero1 = numero1  + _texto
            lblMostraResultado.text = numero1
        }else{
            numero2 = numero2 + _texto
            lblMostraResultado.text = numero2
        }
    }
    
    func formatoDoResultado (_result: Double) -> String{
        if _result.truncatingRemainder(dividingBy: 1) == 0{
            return String(format: "%.0f", _result)// se o resultado depois da virgula for zero, nao precisa nada
        }else{
            return String(format: "%.2f", _result) // aqui se nao tiver o zero ele pega os dois primeiros numeros depois da virgula.
        }
    }
    
    //MARK - botoes operacoes
    @IBAction func btnAcClique(_ sender: UIButton) {
        limparTela()
    }
    @IBAction func btnMaisEMenosClic(_ sender: UIButton) {
        if  operacao == ""{
            numero1 = String(format: "%.0f", Double(numero1)! * (-1))
            lblMostraResultado.text = numero1
        }else{
            numero2 = String(format: "%.0f", Double(numero2)! * (-1))
            lblMostraResultado.text = numero2
        }
    }
    @IBAction func btnPorcenClic(_ sender: UIButton) {
        if operacao == ""{
            operacao = "%"
        }
    }
    @IBAction func btnDivisaoClic(_ sender: UIButton) {
        if operacao == ""{
            operacao = "/"
        }
    }
    @IBAction func btnMultiClic(_ sender: UIButton) {
        if operacao == ""{
            operacao = "*"
        }
    }
    @IBAction func btnSubClic(_ sender: UIButton) {
        if operacao == ""{
            operacao = "-"
        }
    }
    @IBAction func btnSomaClic(_ sender: UIButton) {
        if operacao == ""{
            operacao = "+"
        }
    }
    @IBAction func btnVirgula(_ sender: UIButton) {
    }
    
    @IBAction func btnIgualClic(_ sender: UIButton) {
            let calculo = numero1 + operacao + numero2
            let verSeAPorcentagemEstaFuncionando = calculo.replacingOccurrences(of: "%", with: "*0.01")
            let expressao = NSExpression(format: verSeAPorcentagemEstaFuncionando)
            let resultado = expressao.expressionValue(with: nil, context: nil) as! Double
            let formatoDoResultado = formatoDoResultado(_result: resultado)
            
            lblMostraResultado.text  = formatoDoResultado
            numero1 = formatoDoResultado
            numero2 = ""
            operacao = ""
    }
    
    //MARK - botoes dos numeros
    @IBAction func btnBotoes(_ sender: UIButton) {
        atualizaHistorico(_texto: String(sender.tag))
    }
}

