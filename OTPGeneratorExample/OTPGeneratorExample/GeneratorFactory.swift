//
// Created by Marcin Zbijowski on 30/09/15.
// Copyright (c) 2015 CodeWise sp. z o.o. Sp. k. All rights reserved.
//

import Foundation
import OTPGenerator

class GeneratorFactory {

    static func generatorWithSecretKey(key: String, type: OTPGeneratorType, secretIsBase32: Bool = true) -> OTPGenerator {
        switch(type) {
            case .HOTP:
                var startCounter: UInt64 = 0
                let settings = NSUserDefaults.standardUserDefaults()

                if let counter = settings.objectForKey(DEFAULTS_COUNTER_KEY) as? NSNumber {
                    startCounter = counter.unsignedLongLongValue
                }
                return HOTPGenerator(secret: key, counter: startCounter, secretIsBase32: secretIsBase32)!

            case .TOTP:
                return TOTPGenerator(secret: key, period: 30, secretIsBase32: secretIsBase32)!
        }
    }

    static func increaseCounter() -> UInt64 {
        var counterToSave: UInt64 = 1
        if let counter = NSUserDefaults.standardUserDefaults().objectForKey(DEFAULTS_COUNTER_KEY) as? NSNumber {
            counterToSave = counter.unsignedLongLongValue + 1
        }

        NSUserDefaults.standardUserDefaults().setObject(NSNumber(unsignedLongLong: counterToSave), forKey: DEFAULTS_COUNTER_KEY)
        NSUserDefaults.standardUserDefaults().synchronize()

        return counterToSave
    }

}
