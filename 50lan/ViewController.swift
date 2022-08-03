//
//  ViewController.swift
//  50lan
//
//  Created by 林辰澤 on 2022/8/2.
//

import UIKit

class ViewController: UIViewController {
    let products = ["養樂多綠茶","冰淇淋紅茶","鮮柚綠","四季春","紅茶拿鐵","葡萄柚多多","紅茶瑪奇朵","阿華田","旺來紅"]
    
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
        
        orderTextView.layer.borderWidth = 2
        orderTextView.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        reset()
        orderTextView.text = ""
    }
    
    func reset(){
        nameTextField.text = ""
        iceSegmentedControl.selectedSegmentIndex = 0
        sugarSegmentedControl.selectedSegmentIndex = 0
        bubbleSwitch.isOn = false
        coconutSwitch.isOn = false
        numberSlider.value = 1
        numberLabel.text = "\(Int(numberSlider.value))杯"
    }

    @IBAction func random(_ sender: Any) {
        reset()
        let randNum = Int.random(in: 0...8)
        nameTextField.text = products[randNum]
        view.endEditing(true) //收起鍵盤
    }
    
    @IBAction func cupNumber(_ sender: Any) {
        numberLabel.text = "\(Int(numberSlider.value))杯"
        view.endEditing(true) //收起鍵盤
    }
    
    @IBAction func add(_ sender: Any) {
        if nameTextField.text == "" {
            print("empty")
        }else{
            var productText = ""
            productText = nameTextField.text! + " "
            + iceSegmentedControl.titleForSegment(at: iceSegmentedControl.selectedSegmentIndex)!
            + " " + sugarSegmentedControl.titleForSegment(at: sugarSegmentedControl.selectedSegmentIndex)!
            
            if bubbleSwitch.isOn && coconutSwitch.isOn {
                orderTextView.text +=
                productText + " 加珍珠, 加椰果 \(Int(numberSlider.value)) 杯\n"
            }else if bubbleSwitch.isOn {
                orderTextView.text +=
                productText + " 加珍珠 \(Int(numberSlider.value)) 杯\n"
            }else if coconutSwitch.isOn {
                orderTextView.text +=
                productText + " 加椰果 \(Int(numberSlider.value)) 杯\n"
            }else {
                orderTextView.text +=
                productText + " \(Int(numberSlider.value)) 杯\n"
            }

            reset()
            view.endEditing(true) //收起鍵盤
        }
        
//        else if bubbleSwitch.isOn {
//            orderTextView.text = nameTextField.text + " "
//            + iceSegmentedControl.titleForSegment(at: iceSegmentedControl.selectedSegmentIndex)!
//            + " " + sugarSegmentedControl.titleForSegment(at: sugarSegmentedControl.selectedSegmentIndex)!
//            + " " +  "加珍珠 " + "\(Int(numberSlider.value))" + " 杯"
//            + "\n\(String(describing: orderTextView.text!))"
//        }
//        else if coconutSwitch.isOn {
//            orderTextView.text = nameTextField.text + " "
//            + iceSegmentedControl.titleForSegment(at: iceSegmentedControl.selectedSegmentIndex)!
//            + " " + sugarSegmentedControl.titleForSegment(at: sugarSegmentedControl.selectedSegmentIndex)!
//            + " " +  "加椰果 " + "\(Int(numberSlider.value))" + " 杯"
//            + "\n\(String(describing: orderTextView.text!))"
//        }
//        else {
//            orderTextView.text = nameTextField.text + " "
//            + iceSegmentedControl.titleForSegment(at: iceSegmentedControl.selectedSegmentIndex)!
//            + " " + sugarSegmentedControl.titleForSegment(at: sugarSegmentedControl.selectedSegmentIndex)!
//            + " " +  " " + "\(Int(numberSlider.value))" + " 杯"
//            + "\n\(String(describing: orderTextView.text!))"
//        }

    }
    
    
    @IBAction func clear(_ sender: Any) {
        reset()
        orderTextView.text = ""
        view.endEditing(true) //收起鍵盤
    }
    
    @IBAction func submit(_ sender: Any) {
        var dateText = ""
        // 設置日期時間格式
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateText = formatter.string(
            from: orderDatePicker.date)
        
        let alert = UIAlertController(title: "訂購完成", message: "您好，我們已經收到您的訂單，您可以於" + dateText + "取餐，謝謝", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.nameTextField.text = ""
            self.orderTextView.text = ""
            self.iceSegmentedControl.selectedSegmentIndex = 0
            self.sugarSegmentedControl.selectedSegmentIndex = 0
            self.bubbleSwitch.isOn = false
            self.coconutSwitch.isOn = false
            self.numberSlider.value = 1
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapGesture(_ sender: Any) {
        view.endEditing(true) //收起鍵盤
        
    }
    
    
}

