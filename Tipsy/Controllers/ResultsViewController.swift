//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Abraham Mella on 09/09/22.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalAmountPerPerson: String?
    var selectedPeople: String = "0"
    var tipSelected: String = "0"
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalAmountPerPerson
        settingsLabel.text = "Split between \(String(describing: selectedPeople)) people, with \(String(describing: tipSelected)) tip"
    }
    
}
