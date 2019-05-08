//
//  SecondViewController.swift
//  finalproject
//
//  Created by Alexandra Briggs on 4/29/19.
//  Copyright © 2019 Alexandra Briggs. All rights reserved.
//

import UIKit
import FirebaseDatabase

var ref:DatabaseReference?
var databaseHandle:DatabaseHandle?

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var labeltext: UILabel!
   
    //var commentItems =  ["Message 1", "Message 2", "Message 3"]
    var commentItems = [String]()
   

    
    @IBAction func goToArticle(_ sender: Any) {
        if let url = URL(string: "https://www.latimes.com/politics/la-na-pol-beto-orourke-climate-change-plan-20190429-story.html") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
    @IBOutlet weak var textView: UITextView!
    
   
    
    @IBAction func addPost(_ sender: Any) {
        //adds the message, resigns keyboard, removes the text in textView
        ref?.child("Politics").childByAutoId().setValue(textView.text)
        textView.resignFirstResponder()
        textView.text = ""
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = commentItems[indexPath.row]
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    tableView.delegate = self
    tableView.dataSource = self
        
    textView.becomeFirstResponder()
    
        labeltext.text = "\(selection)"
        
        ref=Database.database().reference()
        
        databaseHandle = ref?.child("Politics").observe(.childAdded, with: { (snapshot) in
            //code to execute when a child is added
            //take the value from snapshot, add to postData array and reload TableView
            let post = snapshot.value as? String
            self.commentItems.append(post!)
            self.tableView.reloadData()
        })
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
