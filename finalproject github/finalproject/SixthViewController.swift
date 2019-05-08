//
//  SixthViewController.swift
//  finalproject
//
//  Created by Alexandra Briggs on 4/29/19.
//  Copyright © 2019 Alexandra Briggs. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SixthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var commentItems = [String]()
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    
    @IBOutlet weak var labeltext: UILabel!
    
    @IBAction func goToArticle(_ sender: Any) {
        if let url = URL(string: "https://techcrunch.com/2019/04/29/facebook-accused-of-blocking-wider-efforts-to-study-its-ad-platform/") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func addPost(_ sender: Any) {
        //adds the message, resigns keyboard, removes the text in textView
        ref?.child("Tech").childByAutoId().setValue(textView.text)
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
        // focus the cursor in the TextView
        textView.becomeFirstResponder()
        
        labeltext.text = "\(selection)"
        
        // set firebase reference
        ref=Database.database().reference()
        
        //retrieve posts and listen for changes
        databaseHandle =
            ref?.child("Tech").observe(.childAdded, with: { (snapshot) in
                //code to execute when a child is added
                //take the value from snapshot, add to postData array
                let post = snapshot.value as? String
                self.commentItems.append(post!)
                self.tableView.reloadData()
                
                // Do any additional setup after loading the view.
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
