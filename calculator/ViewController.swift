//
//  ViewController.swift
//  calculator
//
//  Created by Bayram Yeleç on 10.10.2024.
//

import UIKit

class ViewController: UIViewController {

    var girilenSayi = 0
    var oncekiSayi = 0
    var islemIsActive = false
    var operation = 0
    
    @IBOutlet weak var sonucLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnClickSayi(_ sender: UIButton) {
        
        if islemIsActive == true {
            sonucLbl.text = String(sender.tag-1)
            girilenSayi = Int(Double(sonucLbl.text!)!)
            islemIsActive = false
        }
        else {
            sonucLbl.text = sonucLbl.text! + String(sender.tag-1)
            girilenSayi = Int(Double(sonucLbl.text!)!)
        }
        
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        if sonucLbl.text != "" && sender.tag != 11 && sender.tag != 13 && sender.tag != 18 {
            
            oncekiSayi = girilenSayi
            
            if sender.tag == 14 {
                sonucLbl.text = "÷"
            }
            else if sender.tag == 15 {
                sonucLbl.text = "x"
            }
            else if sender.tag == 16 {
                sonucLbl.text = "-"
            }
            else if sender.tag == 17 {
                sonucLbl.text = "+"
            }
            
            operation = sender.tag
            islemIsActive = true
        }
        
        else if sender.tag == 18 {
            
            if operation == 14 {
                if girilenSayi != 0 {
                    sonucLbl.text = String(oncekiSayi / girilenSayi)
                } else {
                    sonucLbl.text = "Hata"
                }
            }
            else if operation == 15 {
                sonucLbl.text = String(oncekiSayi * girilenSayi)
            }
            else if operation == 16 {
                sonucLbl.text = String(oncekiSayi - girilenSayi)
            }
            else if operation == 17 {
                sonucLbl.text = String(oncekiSayi + girilenSayi)
            }
            
            girilenSayi = 0
            oncekiSayi = 0
            operation = 0
            islemIsActive = false
        }
        
        else if sender.tag == 11 {
            sonucLbl.text = ""
            oncekiSayi = 0
            girilenSayi = 0
            operation = 0
        }
        
        else if sender.tag == 13 {
            if sonucLbl.text != "" {
                sonucLbl.text?.removeLast()
            }
        }
    }

    
    
    
}

