//
//  AddItemTableViewController.swift
//  TheLibrary
//
//  Created by Britney Smith on 9/5/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

// required methods for AddItemVewController in protocol
protocol AddItemTableViewContollerDelegate: class {
    
    func addItemTableViewControllerDidCancel(_ controller: AddItemTableViewController)
    
    func addItemTableViewController(_ controller: AddItemTableViewController, didFinishAdding item: Book) //passes Book
}

class AddItemTableViewController: UITableViewController {

    @IBOutlet weak var addAuthorTextField: UITextField!
    
    @IBOutlet weak var addTitleTextField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemTableViewContollerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

    func areWeDone() {
        if addTitleTextField.text == "" && addAuthorTextField.text == "" {
            alertHandler(alertNumber: 1)
        } else if addAuthorTextField.text == "" {
            alertHandler(alertNumber: 2)
        } else if addTitleTextField.text == "" {
           alertHandler(alertNumber: 3)
        }
    }
    
    func alertHandler(alertNumber:Int) {
        switch alertNumber {
        case 1:
            let alert1 = UIAlertController(title: "Missing Info!", message: "Missing author and title!", preferredStyle: .alert)
            alert1.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert1, animated: true)
        case 2:
            let alert2 = UIAlertController(title: "Missing Info!", message: "Missing author!", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert2, animated: true)
        case 3:
            let alert3 = UIAlertController(title: "Missing Info!", message: "Missing title!", preferredStyle: .alert)
            alert3.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert3, animated: true)
        default:
            return
        }
    }
    
    @IBAction func cancel() {
        delegate?.addItemTableViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        areWeDone()
        var book = Book()
        
        if addTitleTextField.text != "" && addAuthorTextField.text != "" {

            book.author = addAuthorTextField.text!
            book.title = addTitleTextField.text!
            
            delegate?.addItemTableViewController(self, didFinishAdding: book)
        }
        
    }

}
