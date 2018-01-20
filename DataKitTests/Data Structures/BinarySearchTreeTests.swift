import XCTest
@testable import DataKit

class BinarySearchTreeTests: XCTestCase {

    // MARK: Search

    func testSearchSmallTree() {
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

    func testSearchPath() {
        let tree = BinarySearchTree(4)
        tree.insert(2)
        tree.insert(3)
        tree.insert(1)
        tree.insert(6)
        tree.insert(5)
        tree.insert(7)

        XCTAssertEqual(tree.searchPath(1)!.map { $0.value }, [4, 2, 1])
        XCTAssertEqual(tree.searchPath(4)!.map { $0.value }, [4])
        XCTAssertEqual(tree.searchPath(6)!.map { $0.value }, [4, 6])
        XCTAssertEqual(tree.searchPath(5)!.map { $0.value }, [4, 6, 5])

        XCTAssertNil(tree.searchPath(0))
        XCTAssertNil(tree.searchPath(8))
    }

    // MARK: Minimum & Maximum

    func testMinMax1Element() {
        let value = Int(arc4random_uniform(200))
        let tree = BinarySearchTree(value)
        XCTAssertEqual(tree.minimum.value, value)
        XCTAssertEqual(tree.maximum.value, value)
    }

    func testMinMaxUniformValues() {
        for _ in 0...10 {
            let value = Int(arc4random())
            let tree = BinarySearchTree(value)
            for _ in 0...arc4random_uniform(1000) {
                tree.insert(value)
            }
            XCTAssertEqual(tree.minimum.value, value)
            XCTAssertEqual(tree.maximum.value, value)
        }
    }

    func testMinMaxIncreasingTreeSize() {
        for i in 0...16 {
            let treeSize = 2 << i
            let values = (0..<treeSize).map { _ in Int(arc4random()) }
            let tree = BinarySearchTree(values.last!)
            for value in values {
                tree.insert(value)
            }
            XCTAssertEqual(tree.minimum.value, values.min())
            XCTAssertEqual(tree.maximum.value, values.max())
        }
    }

    func testMinMaxHeI() {
        // Actually, I>HE
        let tree = BinarySearchTree("HE")
        tree.insert("i")
        XCTAssertEqual(tree.minimum.value, "HE")
        XCTAssertEqual(tree.maximum.value, "i")
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
