//
//  ViewController.swift
//  OTPGenerator
//
//  Created by Marcin Zbijowski on 25/09/15.
//  Copyright © 2015 CodeWise sp. z o.o. Sp. k. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is TokenViewController {
            let destinationVC = segue.destinationViewController as! TokenViewController
            guard let indexPath = self.tableView.indexPathForSelectedRow, let generatorType = OTPGeneratorType(rawValue: indexPath.row) else { return }
            self.navigationItem.title = ""
            destinationVC.generatorType = generatorType
        }
    }

    // MARK: - Table view

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell", forIndexPath: indexPath)
        
        if let gType = OTPGeneratorType(rawValue: indexPath.row) {
            cell.textLabel?.text = gType.title
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}

