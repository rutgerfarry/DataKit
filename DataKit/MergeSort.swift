import Foundation

private func merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0

    var orderedArray = [T]()

    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        if leftArray[leftIndex] < rightArray[rightIndex] {
            orderedArray.append(leftArray[leftIndex])
            leftIndex += 1
        } else {
            orderedArray.append(rightArray[rightIndex])
            rightIndex += 1
        }
    }

    while leftIndex < leftArray.count {
        orderedArray.append(leftArray[leftIndex])
        leftIndex += 1
    }

    while rightIndex < rightArray.count {
        orderedArray.append(rightArray[rightIndex])
        rightIndex += 1
    }

    return orderedArray
}

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    let midpoint = array.count / 2
    let leftArray = mergeSort(Array(array[0..<midpoint]))
    let rightArray = mergeSort(Array(array[midpoint..<array.count]))
    return merge(leftArray, rightArray)
}

extension Array where Element: Comparable {
    func mergeSorted() -> [Element] {
        return mergeSort(self)
    }
}
