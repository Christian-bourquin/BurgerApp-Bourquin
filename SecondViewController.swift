//
//  SecondViewController.swift
//  BurgerApp-Bourquin
//
//  Created by CHRISTIAN BOURQUIN on 10/16/22.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var PriceLabelOutlet: UILabel!
    
    @IBOutlet weak var FinalOrderOutlet: UITextView!
    
    var finalTotal : Double = 0.0
    var finalList : [Shopping] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        PriceLabelOutlet.text = "price: \(finalTotal)"
        for c in finalList{
            FinalOrderOutlet.text += "you ordered a \(c.name) : \(c.Calculate())\n"
        }
    }
    
    
    
    

}
