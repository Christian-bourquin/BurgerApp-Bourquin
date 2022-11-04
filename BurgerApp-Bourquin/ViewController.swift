//
//  ViewController.swift
//  BurgerApp-Bourquin
//
//  Created by CHRISTIAN BOURQUIN on 10/12/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    var burger = ""
    var CookedT = meatCooked.nothing
    var orders : [Shopping] = []
    var tomato = false
    var onion = false
    var lettuce = false
    var preTotal = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        burger = ""
        CookedT = meatCooked.nothing
         tomato = false
         onion = false
        lettuce = false
    }
    @IBAction func BaconBurgerButton(_ sender: Any) {
        burger = "Bacon Burger"
    }
    @IBAction func McDoubleButton(_ sender: Any) {
        burger = "McDouble"
    }
    @IBAction func BigMacButton(_ sender: Any) {
        burger = "Big Mac"
    }
    
    @IBAction func wellDoneButton(_ sender: Any) {
        CookedT = meatCooked.WellDone
    }
    
    @IBAction func MediumButton(_ sender: Any) {
        CookedT = meatCooked.Medium
    }
    @IBAction func MediumRareButton(_ sender: Any) {
        CookedT = meatCooked.MediumRare
    }
    
    @IBAction func LettuceButton(_ sender: Any) {
        lettuce = true
    }
    @IBAction func TomatoButton(_ sender: Any) {
       tomato = true
    }
    @IBAction func OnionButton(_ sender: Any) {
        onion = true
    }
    
    
    @IBAction func addToCartButton(_ sender: Any) {
        let alert = UIAlertController(title: "ERROR!", message: "Please Select a burger", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okAction)
        if CookedT == meatCooked.nothing || burger == "" {
            present(alert, animated: true)
        }
        var order = Shopping.init(name: burger, inType: CookedT, lettuce: lettuce, tomato: tomato, onion: onion)
        orders.append(order)
       // textfieldOutlet.text += "\(client.name): \(client.balance)\n"
        preTotal += order.Calculate()
        burger = ""
        CookedT = meatCooked.nothing
         tomato = false
         onion = false
        lettuce = false
    }

    @IBAction func ViewCartButtons(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toCartSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! SecondViewController
        nvc.finalTotal = preTotal
        nvc.finalList = orders
        
    }
    

}

