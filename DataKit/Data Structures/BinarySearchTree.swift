/// Unbalanced Binary Search Tree. Nodes don't have a reference to their parents

import Foundation

//enum BinarySearchTree<T: Comparable> {
//    indirect case node(BinarySearchTree, T, BinarySearchTree)
//    case empty
//
//    var value: T? {
//        switch self {
//        case let .node(_, value, _):
//            return value
//        case .empty:
//            return nil
//        }
//    }
//}

class BinarySearchTree<T: Comparable> {
    let value: T
    private(set) var left: BinarySearchTree?
    private(set) var right: BinarySearchTree?

    init(_ value: T, leftNode: BinarySearchTree? = nil, rightNode: BinarySearchTree? = nil) {
        self.value = value
        self.left = leftNode
        self.right = rightNode
    }
}

extension BinarySearchTree {

    /**
     * Returns the first node matching specified target value. Returns nil if target isn't in tree.
     * O(h) runtime, where "h" is the height of the tree
     */
    func search(_ target: T) -> BinarySearchTree? {
        if value == target {
            return self
        } else if target < value {
            return left?.search(target) ?? nil
        } else {
            return right?.search(target) ?? nil
        }
    }

    /**
     * Returns the in-order search path in for the first node matching specified target value.
     * The last element in the array is the found node. Returns nil if target isn't in the tree.
     * O(h) runtime, where "h" is the height of the tree
     */
    func searchPath(_ target: T, _ path: [BinarySearchTree] = []) -> [BinarySearchTree]? {
        if value == target {
            return path + [self]
        } else if target < value {
            return left?.searchPath(target, path + [self]) ?? nil
        } else {
            return right?.searchPath(target, path + [self]) ?? nil
        }
    }

    /**
     * Returns the minumum element in the tree.
     * O(h) runtime, where "h" is the height of the tree.
     */
    var minimum: BinarySearchTree {
        return left?.minimum ?? self
    }

    /**
     * Returns the maximum element in the tree.
     * O(h) runtime, where "h" is the height of the tree.
     */
    var maximum: BinarySearchTree {
        return right?.maximum ?? self
    }

    /**
     * Inserts a new value into the tree.
     * O(h) runtime, where "h" is the height of the tree.
     */
    func insert(_ newValue: T) {
        if newValue <= value {
            if let left = left {
                left.insert(newValue)
            } else {
                left = BinarySearchTree(newValue)
            }
        } else {
            if let right = right {
                right.insert(newValue)
            } else {
                right = BinarySearchTree(newValue)
            }
        }
    }

    func delete(_ target: T) {
    }

}
