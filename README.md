# iOS OTP Generators

Project contains generators for [one time password](https://en.wikipedia.org/wiki/One-time_password) based on time and on counter. Code is written in [Swift2](https://developer.apple.com/swift/) and depends on CommonCrypto module.

### CommonCrypto - C modules & Swift

Long story short, one has to create `module.map` file with pointing to header files of concrete module and then in `Build Settings` add path to `Swift compiler search paths`. 

![Build Settings](/Screenshots/module_map_in_xcode.png?raw=true)

### References

* [HOTP RFC](https://tools.ietf.org/html/rfc4226)<br />
* [TOTP RFC](https://tools.ietf.org/html/rfc6238)<br />
* [C Libraries in Swift - long story](http://spin.atomicobject.com/2015/02/23/c-libraries-swift/)<br />
* [Interacting with C APIs in Swift](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/BuildingCocoaApps/InteractingWithCAPIs.html)

