import UIKit
import Combine

// Operators part 1

// Collect
["A", "B", "C", "D"].publisher.collect().sink {
    print($0)
}

// Map
let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[123, 45, 67, 987].publisher.map {
    formatter.string(from: NSNumber(integerLiteral: $0))
}.sink {
    print($0 as Any)
}
