//
//  SettingsViewController.swift
//  OTPGenerator
//
//  Created by Marcin Zbijowski on 29/09/15.
//  Copyright © 2015 CodeWise sp. z o.o. Sp. k. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var keyTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.keyTextField.text = NSUserDefaults.standardUserDefaults().stringForKey(DEFAULTS_SECRET_KEY)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelTapped(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func doneTapped(sender: UIBarButtonItem) {
        NSUserDefaults.standardUserDefaults().setObject(self.keyTextField.text, forKey: DEFAULTS_SECRET_KEY)
        NSUserDefaults.standardUserDefaults().synchronize()
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
