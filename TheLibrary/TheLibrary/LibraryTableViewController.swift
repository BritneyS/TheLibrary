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

class LibraryTableViewController: UITableViewController {
    
    
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
        // #warning Incomplete implementation, return the number of rows
        return bookItems.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
