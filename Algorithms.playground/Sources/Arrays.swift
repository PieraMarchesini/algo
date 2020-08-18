import Foundation

public func insertionSort(a: [Int]) -> [Int] {
    var array = a
    for i in 1..<array.count {
        let value = array[i]
        var j = i - 1
        while j >= 0 && array[j] > value {
            array[j+1] = array[j]
            j -= 1
        }
        array[j+1] = value
    }
    return array
}


public func mergeSort<Element>(_ array: [Element]) -> [Element] where Element: Comparable {
    guard array.count > 1 else { return array }
    let middle = array.count/2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    return merge(left, right)
}

private func merge<Element>(_ left: [Element], _ right: [Element]) -> [Element] where Element: Comparable {
    var leftIndex = 0, rightIndex = 0, result = [Element]()
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    return result
}


func reverseArray(_ array: [Int], start: Int, end: Int) -> [Int] {
    var start = start, end = end, array = array
    while start < end {
        array.swapAt(start, end)
        start += 1
        end -= 1
    }
    return array
}

public func nextPermutation(_ array: [Int]) -> [Int] {
    var k = array.count - 2, array = array
    while k >= 0 && array[k] >= array[k+1] {
        k -= 1
    }
    if k == -1 {
        return array.reversed() // if array is sorted in decrescent order
    }
    for i in (k..<array.count).reversed() {
        if array[i] > array[k] {
            array.swapAt(i, k)
            break
        }
    }
    return reverseArray(array, start: k+1, end: array.count-1)
}

//O(n) S(N)
public func repeatedAndMissingNumber(_ array: [Int]) -> [Int] {
    if array.count == 0 || array.count == 1 { return [] }
    let distinctNumbers = Set(array)
    let sumDistinctive = distinctNumbers.reduce(0, +)
    let arithmeticProgression = (array.count * array.count + array.count)/2
    let repeatedNumber = array.reduce(0, +) - sumDistinctive
    let missingNumber = arithmeticProgression - sumDistinctive
    return [repeatedNumber, missingNumber]
}

// MARK: - Back to back SWE
public func rotateMatrix(_ matrix: inout [[Int]]) { //square matrix
    for layer in 0..<matrix.count/2 {
        let first = layer
        let last = matrix.count-layer-1
        for i in first..<last {
            let offset = i-first
            let top = matrix[first][i] //save top
            matrix[first][i] = matrix[last-offset][first] //left->top
            matrix[last-offset][first] = matrix[last][last-offset] //bottom->left
            matrix[last][last-offset] = matrix[i][last] //right->bottom
            matrix[i][last] = top //top->right
        }
    }
}
