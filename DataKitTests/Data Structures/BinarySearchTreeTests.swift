import XCTest
@testable import DataKit

class BinarySearchTreeTests: XCTestCase {

    func testSearch() {
        let array = Array(1...10)
        let middle = array[(array.count / 2) - 1]
        let tree = BinarySearchTree(middle)

        for element in array.shuffled() {
            tree.insert(element)
        }

        XCTAssertEqual(tree.search(middle)?.value, middle)
        for element in array {
            XCTAssertEqual(tree.search(element)?.value, element)
        }

        XCTAssertEqual(tree.search(234)?.value, nil)
        XCTAssertEqual(tree.search(-1)?.value, nil)
    }

    func testContains() {
    }

    func testInsert() {
    }

    func testDelete() {
    }

    func testIsBinarySearchTree() {
    }

}

extension Array {
    func shuffled() -> [Element] {
        var array = self
        for i in 0..<self.count {
            array.swapAt(i, Int(arc4random_uniform(UInt32(count))))
        }
        return array
    }
}
