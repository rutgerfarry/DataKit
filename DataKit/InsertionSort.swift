import Foundation

extension Array where Element: Comparable {
    
    func insertionSorted() -> [Element] {
        var array = self
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

}
