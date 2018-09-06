//
//  LibraryTableViewController.swift
//  TheLibrary
//
//  Created by Britney Smith on 9/4/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

/*
 App Homework (due Thursday): The Library
 
 • Build an app that lists the books in a library, including title and
 author (or the records in a collection, including title and artist, or
 anything else you like — as long as there are 2 pieces of related
 data)
 • Your app should utilize Model-View-Controller architecture
 • On the main page, your app should list each item in a table view
 • The user should be able to swipe to delete items
 • Your app should have a button which allows the user to add items
 to the list
 • When your user goes to the Add page, the text field to enter a new
 item should automatically get focus
 */

import UIKit

enum Identity : String {
    case book = "book"
    case add = "addItem"
}

class LibraryTableViewController: UITableViewController, AddItemTableViewContollerDelegate {
    
    
    func addItemTableViewControllerDidCancel(_ controller: AddItemTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemTableViewController(_ controller: AddItemTableViewController, didFinishAdding item: Book) {
        //navigationController?.popViewController(animated: true)
        
        let newRowIndex = bookItems.count
        bookItems.append(item)
        
        //set indexPath to IndexPath of a new row (IndexPath objectpoints to a row in a table), knows how to find new row in the table
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath] // new array of IndexPaths, put in 'indexPath'
        tableView.insertRows(at: indexPaths, with: .automatic) // insert row in indexPaths array, even though there's just one here
        
        navigationController?.popViewController(animated: true)
    }
    
    
   // @IBOutlet weak var cellLabel: UILabel!
    
    var bookItems:[Book] = []
    
    func getBooks() {
        let bookShelf = BookList()
        
        for book in bookShelf.books {
            let newBook = Book(author: book.key, title: book.value)
            bookItems.append(newBook)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getBooks()
        navigationController?.navigationBar.prefersLargeTitles = true //large titles,  checklistviewcontroller lives inside nav controller
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookItems.count
    }

    
    //draws cells on screen
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookData = Identity.book.rawValue
        let cell = tableView.dequeueReusableCell(withIdentifier: bookData, for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "\(bookItems[indexPath.row].author): \(bookItems[indexPath.row].title)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            swipeToDelete(indexPath: indexPath)
        }
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
    }
    
    func swipeToDelete(indexPath: IndexPath) {
        bookItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let addItem = Identity.add.rawValue
        if segue.identifier == addItem { //can add idenfier as enum
            let controller = segue.destination as! AddItemTableViewController //as : casting object (downcasting), can be nil
            controller.delegate = self //self as delegate 
        }
    }
    
    
    

}
