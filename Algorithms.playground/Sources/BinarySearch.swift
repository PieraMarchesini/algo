import Foundation

public func binarySearch(_ array: [Int], searchElem: Int) -> Int { //sorted array
    var low = 0, high = array.count-1
    while low < high {
        let mid: Int = (low+high)/2
        if array[mid] == searchElem {
            return mid
        }
        if array[mid] < searchElem {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return -1
}

func occurrenceBinarySearch(_ array: [Int], searchElem: Int, searchFirst: Bool) -> Int {
    var low = 0, high = array.count-1, result = -1
    while low <= high {
        let mid: Int = (low+high)/2
        if array[mid] == searchElem {
            result = mid
            if searchFirst {
                high = mid-1 //go on searching towards left (lower indices)
            } else {
                low = mid + 1
            }
        } else if array[mid] < searchElem {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return result
}

public func countElementOccurrences(_ array: [Int], searchElem: Int) -> Int {
    let firstIndex = occurrenceBinarySearch(array, searchElem: searchElem, searchFirst: true)
    if firstIndex == -1 { return 0 }
    let lastIndex = occurrenceBinarySearch(array, searchElem: searchElem, searchFirst: false)
    return lastIndex - firstIndex + 1
}
