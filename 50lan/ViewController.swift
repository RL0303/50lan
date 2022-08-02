//
//  ViewController.swift
//  50lan
//
//  Created by 林辰澤 on 2022/8/2.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var iceSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var sugarSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var bubbleSwitch: UISwitch!
    
    @IBOutlet weak var coconutSwitch: UISwitch!
    
    @IBOutlet weak var numberSlider: UISlider!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var orderTextView: UITextView!
    
    @IBOutlet weak var orderDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        orderTextView.layer.borderWidth = 2
//        orderTextView.layer.borderColor = CGColor(red: 188/255, green: 149/255, blue: 92/255, alpha: 1)
    }

    @IBAction func random(_ sender: Any) {
    }
    
    @IBAction func add(_ sender: Any) {
    }
    
    @IBAction func submit(_ sender: Any) {
    }
    
    
    
}

