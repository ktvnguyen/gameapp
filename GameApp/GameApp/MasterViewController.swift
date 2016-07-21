//
//  MasterViewController.swift
//  GameApp
//
//  Created by Khanh Nguyen on 7/12/16.
//  Copyright © 2016 Khanh Nguyen. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [NSDictionary]()

    @IBAction func Filter(sender: AnyObject) {
        
        NSBundle.mainBundle().loadNibNamed("FilterView", owner: self, options: nil)
        var FilterViewArray =  NSBundle.mainBundle().loadNibNamed("FilterView", owner: self, options: nil)
        var FilterView = FilterViewArray[0] as! UIView
        UIApplication.sharedApplication().keyWindow
        var window = UIApplication.sharedApplication().keyWindow
        window?.rootViewController?.view
        var rootview = window?.rootViewController?.view
        rootview?.addSubview(FilterView)
        
        FilterView.frame.origin.x=0
        FilterView.frame.origin.y=self.navigationController!.navigationBar.frame.height+(self.navigationController?.navigationBar.frame.origin.y)!
        
        FilterView.frame.size.height=rootview!.frame.height
        FilterView.frame.size.width=rootview!.frame.width
        
        
        
        
        
        
        
        
        
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        
        var data = NSFileManager.defaultManager().contentsAtPath(NSBundle.mainBundle().pathForResource("data", ofType: "json")!)
        
        do{
            objects = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! [NSDictionary]
            objects = objects.sort({
                return $1["Game"] as! String > $0["Game"] as! String
            })
            print(objects)
        }
        catch
        {
            
        }
        

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
            
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                let object=objects[indexPath.row]
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row]
        
        cell.textLabel!.text = object["Game"] as! String
        return cell
       
        
        
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

