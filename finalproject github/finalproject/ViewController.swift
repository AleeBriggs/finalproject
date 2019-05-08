//
//  ViewController.swift
//  finalproject
//
//  Created by Alexandra Briggs on 4/29/19.
//  Copyright © 2019 Alexandra Briggs. All rights reserved.
//

import UIKit
import FirebaseDatabase

var selection = "Politics"

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var picker: UIPickerView!
    let items = ["Politics", "Sports", "Pop Culture", "Science", "Tech"]
   // var selection = "Politics"
    // four functions associated with pickerview
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selection = items[row]
        selectedLabel.text = "Selected: " + selection
    }
    
    @IBOutlet weak var selectedLabel: UILabel!
    
    @IBAction func mySubmit(_ sender: Any) {
        if (selection == "Politics"){
            performSegue(withIdentifier: "PoliticsSegue", sender: self)
        }
        else if (selection == "Sports"){
            performSegue(withIdentifier: "SportsSegue", sender: self)
        }
        else if (selection == "Pop Culture"){
            performSegue(withIdentifier: "PopSegue", sender: self)
        }
        else if (selection == "Science"){
            performSegue(withIdentifier: "ScienceSegue", sender: self)
        }
        else if (selection == "Tech"){
            performSegue(withIdentifier: "TechSegue", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }


}

