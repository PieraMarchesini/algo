import Foundation

//O(n) S(n)
public func palindrome(_ x: Int) -> Bool {
    if x < 0 { return false }
    if x < 10 { return true }
    let digits = String(x).compactMap { $0.wholeNumberValue }
    if digits == digits.reversed() {
     return true
    }
    return false
}

//O(n) S(1)
public func palindromeWithoutString(_ x: Int) -> Bool {
    if x < 0 { return false }
    if x < 10 { return true }
    var reversedX = 0, remainder = 0, originalX = x
    while originalX > 0 {
        remainder = originalX % 10
        reversedX = reversedX * 10 + remainder
        originalX /= 10
    }
    if x == reversedX {
        return true
    }
    return false
}

//O(n) S(n)
public func reverseBits(_ input: Int) -> Int {
    let binary = String(input, radix: 2).compactMap { $0.wholeNumberValue }
    let reversed = Array(binary.reversed())
    var num = 0, j = reversed.count-1
    for i in 0..<reversed.count {
        if reversed[i] == 1 {
            let dec = Int(pow(Double(2), Double(j)))
            num += dec
        }
        j -= 1
    }
    return num
}

public func powerOfTwo(_ input: Int) -> Bool {
    if input < 1 { return false }
    if input == 1 { return true }
    return input.isMultiple(of: 2)
}

public func addStrings(_ s1: String, _ s2: String) -> String {
    let binary1 = s1.compactMap { $0.wholeNumberValue }
    let binary2 = s2.compactMap { $0.wholeNumberValue }
    var num = 0, j = binary1.count-1, k = binary2.count-1
    for i in 0..<binary1.count {
        if binary1[i] == 1 {
            let dec = Int(pow(Double(2), Double(j)))
            num += dec
        }
        j -= 1
    }
    for i in 0..<binary1.count {
        if binary1[i] == 1 {
            let dec = Int(pow(Double(2), Double(k)))
            num += dec
        }
        k -= 1
    }
    return String(num)
}

public func addStringsInts(_ s1: String, _ s2: String) -> String {
    var res = [Int](), p1 = s1.count-1, p2 = s2.count-1, carry = 0
    while p1 >= 0 || p2 >= 0 {
        let x1 = p1 >= 0 ? Int(s1[s1.index(s1.startIndex, offsetBy: p1)].wholeNumberValue ?? 0) : 0
        let x2 = p2 >= 0 ? Int(s2[s2.index(s2.startIndex, offsetBy: p2)].wholeNumberValue ?? 0) : 0
        let value = (x1 + x2 + carry) % 10
        carry = (x1 + x2 + carry) / 10
        res.append(value)
        p1 -= 1
        p2 -= 1
    }
    if carry != 0 {
        res.append(carry)
    }
    return res.reversed().map { String($0) }.joined()
}

public func minTimeDifference(_ times: [String]) -> Int {
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

//O(log base n) S(n)
//Convert a positive number n to its digit representation in base b
public func toDigits(num: String, base: Int) -> String {
    var result = [String](), n = Int(num) ?? 0
    while n > 0 {
        let singleResult = n % base
        let appendChar: String
        if singleResult > 9 {
            appendChar = String(singleResult, radix: base).uppercased()
        } else {
            appendChar = String(singleResult)
        }
        result.append(appendChar)
        n /= base
    }
    return result.reversed().joined()
}

//O(n) S(1)
//Compute the number given by digits in base b
public func fromDigits(num: String, base: Int) -> String {
    var result = 0
    for n in num {
        var value: Int
        if n.isNumber {
           value = Int(String(n)) ?? 0
        } else {
            value = n.hexDigitValue ?? 0
        }
        result = base * result + value
    }
    return String(result)
}

//Convert the digits representation of a number from base1 to base2 up until base 10
public func changeBase(num: String, base1: Int, base2: Int) -> String {
    return toDigits(num: fromDigits(num: num, base: base1), base: base2)
}
