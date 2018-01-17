import XCTest
import Foundation
@testable import DataKit

class MergeSortTests: XCTestCase {

    func testSmallIntArray() {
        let testArray = [5, 2, 4, 6, 1, 3]
        XCTAssertEqual(testArray.mergeSorted(), [1, 2, 3, 4, 5, 6])
    }

    func testMediumIntArray() {
        var testArray = [Int]()
        for _ in 0...8 {
            testArray.append(Int(arc4random_uniform(20)))
        }
        XCTAssertEqual(testArray.mergeSorted(), testArray.sorted())
    }

    func testLargeIntArray() {
        var testArray = [Int]()
        for _ in 0...1000 {
            testArray.append(Int(arc4random()))
        }
        XCTAssertEqual(testArray.mergeSorted(), testArray.sorted())
    }

    func testSwiftAlgorithmClub() {
        checkSortAlgorithm(mergeSort)
    }

    func testPerformanceExample() {
        var testArray = [Int]()
        for _ in 0...1000 {
            testArray.append(Int(arc4random()))
        }

        self.measure {
            _ = testArray.mergeSorted()
        }
    }

}
