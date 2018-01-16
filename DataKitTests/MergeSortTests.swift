import XCTest
import Foundation
@testable import DataKit

class MergeSortTests: XCTestCase {

    func testBasicIntArray() {
        let testArray = [5, 2, 4, 6, 1, 3]
        XCTAssertEqual(testArray.mergeSorted(), [1, 2, 3, 4, 5, 6])
    }

    func testLargeIntArray() {
        var testArray = [Int]()
        for _ in 0...1000 {
            testArray.append(Int(arc4random()))
        }
        XCTAssertEqual(testArray.mergeSorted(), testArray.sorted())
    }

    func testPerformanceExample() {
        var testArray = [Int]()
        for _ in 0...1000 {
            testArray.append(Int(arc4random()))
        }

        self.measure {
            let _ = testArray.mergeSorted()
        }
    }

}

