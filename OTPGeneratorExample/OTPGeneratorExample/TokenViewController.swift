//
//  TokenViewController.swift
//  OTPGenerator
//
//  Created by Marcin Zbijowski on 29/09/15.
//  Copyright © 2015 CodeWise sp. z o.o. Sp. k. All rights reserved.
//

import UIKit
import OTPGenerator

class TokenViewController: UIViewController {

    var generatorType: OTPGeneratorType?
    private var generator: OTPGenerator?
    private var generatorTimer: NSTimer?
    private var labelTimer: NSTimer?
    private var timeCounter = 0

    @IBOutlet weak var tokenLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initGenerator()
        self.refreshTokenLabel()
        if generatorType == .TOTP {
            self.refreshTimerLabel()
        }
    }

    @IBAction func refreshTapped(sender: UIBarButtonItem) {
        self.refreshTokenLabel()
    }

    private func initGenerator() {
        guard
            let generatorType = self.generatorType,
            let secret = NSUserDefaults.standardUserDefaults().stringForKey(DEFAULTS_SECRET_KEY)
        else {
            self.tokenLabel.text = NSLocalizedString("Incorrect setup", comment: "Incorrect setup")
            return
        }

        self.generator = GeneratorFactory.generatorWithSecretKey(secret, type: generatorType, secretIsBase32: false)

        if generatorType == .TOTP {
            self.generatorTimer = NSTimer.scheduledTimerWithTimeInterval((self.generator as! TOTPGenerator).period, target: self, selector: "refreshTokenLabel", userInfo: nil, repeats: true)
            self.labelTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "refreshTimerLabel", userInfo: nil, repeats: true)
        }
    }

    func refreshTokenLabel() {
        if generatorType == .HOTP {
            self.tokenLabel.text = (self.generator as! HOTPGenerator).generateOTP()
            let counter = GeneratorFactory.increaseCounter()
            self.timerLabel.text = NSLocalizedString("Token count: ", comment: "") + "\(counter)"
        } else {
            self.tokenLabel.text = (self.generator as! TOTPGenerator).generateOTP()
        }
    }

    func refreshTimerLabel() {
        if self.timeCounter == 0 {
            self.refreshTokenLabel()
            self.timeCounter = Int((self.generator as! TOTPGenerator).period)
            self.timerLabel.text = NSLocalizedString("Next in... ", comment: "") + "\(self.timeCounter)s"
        } else {
            self.timeCounter--
            self.timerLabel.text = NSLocalizedString("Next in... ", comment: "") + "\(self.timeCounter)s"
        }
    }
}
