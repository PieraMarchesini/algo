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
toDigits(num: "123", base: 16)
fromDigits(num: "7B", base: 16)
changeBase(num: "12", base1: 10, base2: 2)

// MARK: - Binary Search
binarySearch([1,2,3,4], searchElem: 5)
countElementOccurrences([1,1,3,3,5,5,5,9,9], searchElem: 5)

// MARK - Math
squareSum(5)
isPrime(2)
primeNumbersUntil(15)
sieve(15)
findDigitsInDecimal(156)
findDigitsInBinary(125)
allFactorsN(6)
allFactorsN(6)

//identify anagrams in a list of words

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
