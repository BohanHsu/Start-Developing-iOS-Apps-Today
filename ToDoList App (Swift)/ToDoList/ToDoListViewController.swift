//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Monte's Pro 13" on 3/22/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var toDoItems = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitialData()
    }
    
    func loadInitialData() {
        var item1 = ToDoItem()
        item1.itemName = "Update resume"
        toDoItems.addObject(item1)
        
        var item2 = ToDoItem()
        item2.itemName = "Watch Tesla Model 3 unveiling event"
        toDoItems.addObject(item2)
        
        var item3 = ToDoItem()
        item3.itemName = "Apply for summer internships"
        toDoItems.addObject(item3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToList (segue: UIStoryboardSegue) {
        var source = segue.sourceViewController as! AddToDoItemViewController
        var item: ToDoItem = source.toDoItem
        
        toDoItems.addObject(item)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoItems.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath)
        let toDoItem = toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        cell.textLabel?.text = toDoItem.itemName as? String
        
        if ((toDoItem.completed) != nil) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None;
        }
        
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let tappedItem = toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        if tappedItem.completed == true {
            tappedItem.completed = false
        } else {
            tappedItem.completed = true
        }
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
