import UIKit

func isPrimeN(n: Int) -> Bool{
    if n == 2 { return false }
    for i in 2..<n {
        if n % i == 0 { return false }
    }
    return true
}

func isPrimeSqrtN(n: Int) -> Bool {
    var i = 2
    while Double(i) < sqrt(Double(n)) {
        if n % i == 0 { return false }
        i+=1;
    }
    return true
}

isPrimeN(n: 997)
isPrimeSqrtN(n: 997)

func test(n: Int) {
    var a = 0
    for i in 0..<n {
        //for (j = N; j > i; j--) {
//        for j in (i+1...n).reversed() {
        for j in stride(from: n, to: i, by: -1) {
            
            a = a + i + j
        }
    }
    print(a)
}
test(n: 12)

func some() {
    var a = [Int]()
    a.append(2)
}

func insertionSort(a: [Int]) -> [Int] {
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

var exampleArray = [0,4,1,5,3,7,2]
insertionSort(a: exampleArray)

func merge(a: [Int], start: Int, mid: Int, end: Int) -> [Int] {
    var array = a
    var tempArray = Array(repeating: 0, count: end - start + 1)
    var i = start
    var j = mid + 1
    var k = 0
    
    while i <= mid && j <= end {
        if array[i] <= array[j] {
            tempArray[k] = array[i]
            k += 1
            i += 1
        } else {
            tempArray[k] = array[j]
            k += 1
            j += 1
        }
    }
    
    while i <= mid {
        tempArray[k] = array[i]
        k+=1
        i+=1
    }
    
    while j <= end {
        tempArray[k] = array[j]
        k += 1
        j += 1
    }
    
    for i in start...end {
        array[i] = tempArray[i-start]
    }
    print(array)
    return array
}

//let arrayA = [1,2,3,4]
//let arrab: [Int] = arrayA.reversed()
//print(arrab)

func mergeSort(array: [Int], start: Int, end: Int) {
    if start < end {
        let mid = Int((start + end) / 2)
        mergeSort(array: array, start: start, end: mid)
        mergeSort(array: array, start: mid+1, end: end)
        merge(a: array, start: start, mid: mid, end: end)
    }
}
//identify anagrams in a list of words
mergeSort(array: exampleArray, start: 0, end: 6)

func reverseArray(_ array: [Int], start: Int, end: Int) -> [Int] {
    var start = start, end = end, array = array
    while start < end {
        array.swapAt(start, end)
        start += 1
        end -= 1
    }
    return array
}

func nextPermutation(_ array: [Int]) -> [Int] {
    var k = array.count - 2, array = array
    while k >= 0 && array[k] >= array[k+1] {
        k -= 1
    }
    if k == -1 {
        return array.reversed()
    }
    for i in (k..<array.count).reversed() {
        if array[i] > array[k] {
            array.swapAt(i, k)
            break
        }
    }
    return reverseArray(array, start: k+1, end: array.count-1)
}

var arrayNextPermutation = [1,1,3]
nextPermutation(arrayNextPermutation)
