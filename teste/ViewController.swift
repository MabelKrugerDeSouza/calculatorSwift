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
    
    var numero1: Double = 0.0
    var numero2: Double = 0.0
    var operacao: String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        limparTela()
    }
    
    func limparTela(){
        numero1 = 0
        numero2 = 0
        operacao = ""
        
        lblHistorico.text = " "
        lblMostraResultado.text = " "
    }
    
    func atualizaHistorico( _texto : String){
        guard let txtDigitado = lblHistorico.text else{
            return lblHistorico.text = "Não Informado"
        }
        lblHistorico.text = txtDigitado + _texto
    }
    
    @IBAction func btnAcClique(_ sender: UIButton) {
        limparTela()
    }
    
   
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

