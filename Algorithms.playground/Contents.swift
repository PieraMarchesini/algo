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

func reservedLoop(n: Int) {
    var a = 0
    for i in 0..<n {
        //for (j = N; j > i; j--) {
//        for j in (i+1...n).reversed() {
        for j in stride(from: n, to: i, by: -1) {
            a = a + i + j
        }
    }
}

//Arrays
var exampleArray = [0,4,1,5,3,7,2]
insertionSort(a: exampleArray)
mergeSort(array: exampleArray, start: 0, end: 6)
nextPermutation([1,3,2])

//Primitives
palindrome(12213)
palindromeWithoutString(121)
reverseBits(10)
powerOfTwo(17)
addStrings("101", "1")
addStringsInts("107", "94")

//identify anagrams in a list of words


func minTimeDifference(_ times: [String]) -> Int {
    var timeSeenBuckets: [Bool] = Array(repeating: false, count: 24*60)
    for time in times {
        let components = time.components(separatedBy: ":")
        let totalMinutes = (Int(components[0]) ?? 0) * 60 + (Int(components[1]) ?? 1)
        if timeSeenBuckets[totalMinutes] {
            return 0
        } else {
            timeSeenBuckets[totalMinutes] = true
        }
    }
    var firstTimeSeen: Int?, prevTimeSeen: Int?, minDiff = Int.max
    for i in 0..<1440 {
        if timeSeenBuckets[i] {
            if firstTimeSeen == nil {
                firstTimeSeen = i
                prevTimeSeen = i
            } else {
                minDiff = min(minDiff, min(i-prevTimeSeen!, 1440-i+prevTimeSeen!)) //check clockwise and counterclockwise
                prevTimeSeen = i
            }
        }
    }
    minDiff = min(minDiff, min(prevTimeSeen!-firstTimeSeen!, 1440-prevTimeSeen!+firstTimeSeen!)) //check the extremes
    return minDiff
}
minTimeDifference(["05:31","22:08","00:35"])

//let a = String(123, radix: 4)
let a = Int("123", radix: 4)
func changeBase(_ numAsString: String, _ b1: Int, _ b2: Int) -> String {
    if b1 == 10 {
        return String((Int(numAsString) ?? 0), radix: b2, uppercase: true)
    }
    return ""
}

func rotateMatrix(_ matrix: inout [[Int]]) { //square matrix
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

func repeatedAndMissingNumber(_ array: [Int]) -> [Int] {
    if array.count == 0 || array.count == 1 { return [] }
    let distinctNumbers = Set(array)
    let sumDistinctive = distinctNumbers.reduce(0, +)
    let arithmeticProgression = (array.count * array.count + array.count)/2
    let repeatedNumber = array.reduce(0, +) - sumDistinctive
    let missingNumber = arithmeticProgression - sumDistinctive
    return [repeatedNumber, missingNumber]
}
repeatedAndMissingNumber([1,2,3,3,5])

//func repeatedNumber(_ A: [Int]) -> [Int] {
//if A.count == 0 {return [] }
//if A.count == 1 { return [] }
//    let input = A
//    var standardSum = 0, inputSum = 0
//    var standardSquares = 0, inputSquares = 0
//    for i in 1...input.count {
//        standardSum += i
//        standardSquares += i * i
//        inputSum += input[i-1]
//        inputSquares += input[i-1] * input[i-1]
//    }
//    let aMinusB = standardSum - inputSum
//    let aSquaredMinusBSquared = standardSquares - inputSquares
//    let B = (aSquaredMinusBSquared/aMinusB - aMinusB)/2
//    let A = B + aMinusB
//    return [B, A]
//}

func binarySearch(_ array: [Int], searchElem: Int) -> Int { //sorted array
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
binarySearch([1,2,3,4], searchElem: 5)

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

func countElementOccurrences(_ array: [Int], searchElem: Int) -> Int {
    let firstIndex = occurrenceBinarySearch(array, searchElem: searchElem, searchFirst: true)
    let lastIndex = occurrenceBinarySearch(array, searchElem: searchElem, searchFirst: false)
    return lastIndex - firstIndex + 1
}

countElementOccurrences([1,1,3,3,5,5,5,9,9], searchElem: 5)

func repeatedNumber(_ array: [Int]) -> Int {
var distincts: Set<Int> = []
    for i in 0..<array.count {
        let ans = distincts.insert(array[i])
        if ans.inserted == false {
            return array[i]
        }
    }
    return 0
    }
