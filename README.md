# iOS OTP Generators

Project contains generators for [one time password](https://en.wikipedia.org/wiki/One-time_password) based on time and on counter. Code is written in [Swift2](https://developer.apple.com/swift/) and depends on CommonCrypto module. At this moment CommonCrypto is not a modular framework and all it's headers has been compiled into this library. Unfortunatelly it's the only way to make it work foe the time being.

### Installation

#### Requirements

`OTPGenerator` is written in Swift 2 so it requires XCode 7.

#### CocoaPods

```
use_frameworks!
pod 'OTPGenerator', '~> 1.0'
```
Then in files where you need to use it just add:
```
import OTPGenerator
```

#### Manually

Drag the project file into XCode and use it as it's shown in example.

### References

* [HOTP RFC](https://tools.ietf.org/html/rfc4226)<br />
* [TOTP RFC](https://tools.ietf.org/html/rfc6238)<br />
* [C Libraries in Swift - long story](http://spin.atomicobject.com/2015/02/23/c-libraries-swift/)<br />
* [Interacting with C APIs in Swift](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/BuildingCocoaApps/InteractingWithCAPIs.html)

