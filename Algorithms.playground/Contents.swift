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

// MARK: - Arrays
var exampleArray = [0,4,1,5,3,7,2]
insertionSort(a: exampleArray)
mergeSort(exampleArray)
nextPermutation([1,3,2])
repeatedAndMissingNumber([1,2,3,3,5])

// MARK: - Primitives
palindrome(12213)
palindromeWithoutString(121)
reverseBits(10)
powerOfTwo(17)
addStringsInts("107", "94")
minTimeDifference(["05:31","22:08","00:35"])

// MARK: - Binary Search
binarySearch([1,2,3,4], searchElem: 5)
countElementOccurrences([1,1,3,3,5,5,5,9,9], searchElem: 5)

//identify anagrams in a list of words

Int("123", radix: 4)

//O(log base n) S(n)
//Convert a positive number n to its digit representation in base b
func toDigits(num: String, base: Int) -> String {
    var result = [Int](), n = Int(num) ?? 0
    while n > 0 {
        result.append(n % base)
        n /= base
    }
    return result.reversed().map { String($0) }.joined()
}
toDigits(num: "123", base: 4)

//O(n) S(1)
//Compute the number given by digits in base b
func fromDigits(num: String, base: Int) -> String {
    var result = 0
    for n in num {
        result = base * result + (Int(String(n)) ?? 0)
    }
    return String(result)
}
fromDigits(num: "1323", base: 4)

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
