import Foundation

public func squareSum(_ num: Int) -> [[Int]] {
    var answer = [[Int]](), a = 1
    while a * a < num {
        let b: Int = Int(sqrt(Double(num - a*a)))
        if a > b { break }
        if (a * a + b * b != num) { continue }
        answer.append([a, b])
        a += 1
    }
    return answer
}

public func isPrime(_ num: Int) -> Int {
    if num < 2 { return 0 }
    if num == 2 || num == 3 {return 1 }
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 { return 0 }
    }
    return 1
}

//O(n * sqrt(n))
public func primeNumbersUntil(_ num: Int) -> [Int] {
    if num < 2 { return [] }
    var primeNumbers = [Int]()
    for i in 2...num {
        if isPrime(i) == 1 {
            primeNumbers.append(i)
        }
    }
    return primeNumbers
}

//O(n*log log n)
public func sieve(_ num: Int) -> [Int] {
    var numbers = Array(repeating: 1, count: num+1)
    numbers[0] = 0
    numbers[1] = 0
    for i in 2...Int(sqrt(Double(num))) {
        if numbers[i] == 1 {
            var j = 2
            while i*j <= num {
                numbers[i*j] = 0
                j += 1
            }
        }
    }
    var answer = [Int]()
    for val in numbers.enumerated() {
        if val.element == 1 { answer.append(val.offset) }
    }
    return answer
}

public func findDigitsInDecimal(_ num: Int) -> String {
    var list = [Int](), n = num
    while n > 0 {
        let remaining = n % 10
        list.append(remaining)
        n /= 10
    }
    return list.reversed().compactMap { String($0) }.joined()
}

public func findDigitsInBinary(_ num: Int) -> String {
    var digits = [Int](), n = num
    while n > 0 {
        let remaining = n % 2
        digits.append(remaining)
        n /= 2
    }
    return digits.reversed().compactMap { String($0) }.joined()
}

public func allFactorsN(_ num: Int) -> [Int] {
    if num == 1 { return [1] }
    if num == 2 { return [1,2] }
    if num == 3 { return [1,3] }
    var factors = [1]
    for i in 2...num/2 {
        if num.isMultiple(of: i) {
            factors.append(i)
        }
    }
    factors.append(num)
    return factors
}

public func allFactorsSqrt(_ num: Int) -> [Int] {
    if num == 1 { return [1] }
    var firstFactors = [1]
    var secondFactors = [num]
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            firstFactors.append(i)
            if i != Int(sqrt(Double(num))) {
                secondFactors.append(num/i)
            }
        }
    }
    return firstFactors+secondFactors.reversed()
}
