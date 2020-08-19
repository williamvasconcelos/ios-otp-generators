import XCTest
@testable import ios_otp_generators

final class ios_otp_generatorsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ios_otp_generators().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
