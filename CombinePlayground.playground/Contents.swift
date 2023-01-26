import UIKit
import Combine

let numbers = (1...20).publisher

numbers.filter { $0 % 3 == 0 }.sink { print($0) }

let words = "apple apple fruit apple apple mango watermelon apple".components(separatedBy: " ").publisher

words.sink {
    print($0)
}

words.removeDuplicates().sink {
    print("Duplicates removed:", $0)
}
