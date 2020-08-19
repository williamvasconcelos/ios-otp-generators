import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ios_otp_generatorsTests.allTests),
    ]
}
#endif
