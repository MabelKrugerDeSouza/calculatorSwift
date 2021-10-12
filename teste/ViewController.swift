//
//  ViewController.swift
//  teste
//
//  Created by Mabel Kruger de Souza on 09/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHistorico: UILabel!
    @IBOutlet weak var lblMostraResultado: UILabel!
    
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnMaisEMenos: UIButton!
    @IBOutlet weak var btnPorcen: UIButton!
    @IBOutlet weak var btnDivisao: UIButton!
    @IBOutlet weak var btnMultiplicacao: UIButton!
    @IBOutlet weak var btnSub: UIButton!
    @IBOutlet weak var btnSoma: UIButton!
    @IBOutlet weak var btnIgual: UIButton!
    @IBOutlet weak var btnVirgula: UIButton!
    
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
    
    var operacao: String = ""
    var calculou: Bool = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
        limparTela()
    }
    
    func limparTela(){
        operacao = ""
        lblHistorico.text = " "
        lblMostraResultado.text = " "
    }
    
    func atualizaHistorico( _texto : String){
        if calculou == true{
            operacao = lblMostraResultado.text!
            calculou = false
            lblMostraResultado.text = " "
        }
        operacao = operacao + _texto
        lblHistorico.text = operacao
    }
    
    //Aqui ele vai pegar o resultado que retorno e vai colocar a quantidada depois da virgula
    func formatoDoResultado (_result: Double) -> String{
        if _result.truncatingRemainder(dividingBy: 1) == 0{
            return String(format: "%.0f", _result)// se o resultado depois da virgula for zero, nao precisa nada
        }else{
            return String(format: "%.2f", _result) // aqui se nao tiver o zero ele pega os dois primeiros numeros depois da virgula.
        }
    }
    
    func validEmput() -> Bool{
        var contagem = 0
        var funcCharIndex = [Int]()
        
        for char in operacao{
            if caracteresEspeciais(char: char){
                funcCharIndex.append(contagem)
            }
            contagem += 1
        }
        
        for index in funcCharIndex {
            if index == 0 {
                return false
            }
            if index == operacao.count - 1{
                return false
            }
        }
        return true
    }
    
    func caracteresEspeciais (char: Character) -> Bool{
        if char == "*"{
            return true
        }
        if char == "/"{
            return true
        }
        if char == "+" {
            return true
        }
        if char == "%"{
            return true
        }
        if char == "-"{
            return true
        }
        return false
    }
    
    //Restos dos botoes
    @IBAction func btnAcClique(_ sender: UIButton) {
        limparTela()
    }
    @IBAction func btnMaisEMenosClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "+/-")
    }
    @IBAction func btnPorcenClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "%")
    }
    @IBAction func btnDivisaoClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "/")
    }
    @IBAction func btnMultiClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "*")
    }
    @IBAction func btnSubClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "-")
    }
    @IBAction func btnSomaClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "+")
    }
    @IBAction func btnIgualClic(_ sender: UIButton) {
        if validEmput(){
            let verSeAPorcentagemEstaFuncionando = operacao.replacingOccurrences(of: "%", with: "*0.01")
            let expressao = NSExpression(format: verSeAPorcentagemEstaFuncionando)
            let resultado = expressao.expressionValue(with: nil, context: nil) as! Double
            let formatoDoResultado = formatoDoResultado(_result: resultado)
            
            lblMostraResultado.text  = formatoDoResultado
        }else{
            let alertaInput = UIAlertController(title: "Erro", message: "Calculadora não pode fazer operacao ", preferredStyle: .alert)
            alertaInput.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertaInput, animated: true, completion: nil)
        }
        
        calculou = true
    }
    
    
    
    //Botoes dos numeros
    @IBAction func btnZeroClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "0")
    }
    
    @IBAction func btnUmClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "1")
    }
    @IBAction func btnDoisClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "2")
    }
    @IBAction func btnTresClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "3")
    }
    @IBAction func btnQuatroClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "4")
    }
    @IBAction func btnCincoClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "5")
    }
    @IBAction func btnSeisClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "6")
    }
    @IBAction func btnSeteClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "7")
    }
    @IBAction func btnOitoClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "8")
    }
    @IBAction func btnNoveClic(_ sender: UIButton) {
        atualizaHistorico(_texto: "9")
    }
}

