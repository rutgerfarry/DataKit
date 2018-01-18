import Foundation

func insertionSort<T: Comparable>(_ inputArray: [T]) -> [T] {
    guard inputArray.count > 0 else { return inputArray }
    var array = inputArray
    for j in 1..<array.count {
        let key = array[j]
        var i = j - 1

        while i >= 0 && array[i] > key {
            array[i + 1] = array[i]
            i -= 1
        }
        array[i + 1] = key
    }

    return array
}

extension Array where Element: Comparable {
    func insertionSorted() -> [Element] {
        return insertionSort(self)
    }
}
