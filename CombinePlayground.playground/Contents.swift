import UIKit
import Combine

// Filter
let numbers = (1...20).publisher

numbers.filter { $0 % 3 == 0 }.sink { print($0) }

// Remove duplicates
let words = "apple apple fruit apple apple mango watermelon apple".components(separatedBy: " ").publisher

words.sink {
    print($0)
}

words.removeDuplicates().sink {
    print("Duplicates removed:", $0)
}

// Compact map
let string = ["a", "1.24", "Y", "6.7", "3.45"].publisher.compactMap{ Float($0) }.sink {
    print($0)
}

// Ignore output
let numbers2 = (1...100).publisher

numbers2.ignoreOutput().sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })

struct NoZeroValuesAllowedError: Error {}
let numbers3 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
numbers3.publisher
    .tryFilter({ anInt in
        guard anInt != 0 else { throw NoZeroValuesAllowedError() }
        return anInt < 20
    })
    .ignoreOutput()
    .sink(receiveCompletion: {print("completion: \($0)")},
          receiveValue: {print("value \($0)")})

// first
let numbers4 = (1...9).publisher

numbers4.first(where: { $0 % 3 == 0 }).sink { print($0) }

numbers4.last(where: { $0 % 2 == 0 }).sink { print($0) }

// Drop first

numbers.dropFirst(8).sink {
    print("DF:",$0)
}

// Drop while
numbers.drop(while: { $0 % 5 != 0  }).sink { print($0) }

// Drop until output from
let taps = PassthroughSubject<Int, Never>()
let isReady = PassthroughSubject<Void, Never>()

taps.drop(untilOutputFrom: isReady).sink { print("T:",$0) }

(1...10).forEach { int in
    taps.send(int)
    
    if int == 3 {
        isReady.send()
    }
}

// Prefix
numbers.prefix(2).sink { print($0) }
numbers.prefix(while: { $0 < 5 }).sink { print($0) }

// Challenge
let numbersChallenge = (1...100).publisher
numbersChallenge.dropFirst(50).prefix(20).filter { $0 % 2 == 0 }.sink { print($0) }
