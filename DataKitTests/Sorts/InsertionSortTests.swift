import XCTest
import Foundation
@testable import DataKit

class InsertionSortTests: XCTestCase {

    func testBasicIntArray() {
        let testArray = [5, 2, 4, 6, 1, 3]
        XCTAssertEqual(testArray.insertionSorted(), [1, 2, 3, 4, 5, 6])
    }

    func testLargeIntArray() {
        var testArray = [Int]()
        for _ in 0...1000 {
            testArray.append(Int(arc4random()))
        }
        XCTAssertEqual(testArray.insertionSorted(), testArray.sorted())
    }

    func testSwiftAlgorithmClub() {
        checkSortAlgorithm(insertionSort)
    }

    func testPerformanceExample() {
        var testArray = [Int]()
        for _ in 0...1000 {
            testArray.append(Int(arc4random()))
        }

        self.measure {
            _ = testArray.insertionSorted()
        }
    }

}
