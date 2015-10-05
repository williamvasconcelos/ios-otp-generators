//
//  AppDelegate.swift
//  OTPGenerator
//
//  Created by Marcin Zbijowski on 25/09/15.
//  Copyright © 2015 CodeWise sp. z o.o. Sp. k. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        NSUserDefaults.standardUserDefaults().registerDefaults([DEFAULTS_SECRET_KEY: "12345678901234567890"])

        return true
    }

}

