import UIKit
import Combine

// Collect
["A", "B", "C", "D", "E"].publisher.collect(3).sink {
    print($0)
}

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[123, 45, 67, 1234].publisher.map {
    formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
}.sink {
    print($0)
}
