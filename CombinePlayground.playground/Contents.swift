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

numbers.first(where: { $0 % 3 == 0 }).sink { print($0) }
