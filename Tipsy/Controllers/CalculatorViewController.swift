//
//  ViewController.swift
//  Tipsy
//
//  Created by Abraham Mella on 09/09/22.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepperValue: UIStepper!
    var tipSelected: Float = 0.1
    var selectedPeopleToSplit: Double = 2
    var totalAmountPerPerson: String?
    var tipSelectedValue: String?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let buttons = [zeroPctButton, tenPctButton, twentyPctButton]
        guard let selectedIndex = buttons.firstIndex(where: { $0 == sender }) else {
            return
        }
        for (index, button) in buttons.enumerated() {
            button?.isSelected = index == selectedIndex
        }
        
        tipSelected = Float(selectedIndex) / 10.0
        billTextField.endEditing(true)
    
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        selectedPeopleToSplit = sender.value
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let totalBillText = billTextField.text,
              let totalBill = Double(totalBillText) else {
            print("Invalid bill amount")
            return
        }
        
        let tipAmount = totalBill * Double(tipSelected)
        let totalAmount = totalBill + tipAmount
        let amountPerPerson = Float(totalAmount / selectedPeopleToSplit)
        totalAmountPerPerson = String(amountPerPerson)
        
        
        
        self.performSegue(withIdentifier: "goToResultsView", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultsView"{
            let destinationViewController = segue.destination as! ResultsViewController
            destinationViewController.totalAmountPerPerson = totalAmountPerPerson
            destinationViewController.selectedPeople = String(Int(selectedPeopleToSplit))
            destinationViewController.tipSelected = "\(tipSelected)%"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipSelected = 0.1
        billTextField.text = "0"
        stepperValue.value = 2
        
    }
    

}

