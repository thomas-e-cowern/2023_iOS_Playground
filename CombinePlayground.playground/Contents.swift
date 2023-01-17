import UIKit
import Combine

// Collect
["A", "B", "C", "D", "E"].publisher.collect(3).sink {
    print($0)
}

// Map and NumberFormatter
let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[123, 45, 67, 1234].publisher.map {
    formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
}.sink {
    print($0)
}

struct Point {
    let x: Int
    let y: Int
}

let publisher = PassthroughSubject<Point, Never>()

publisher.map(\.x, \.y).sink { x, y in
    print("X is \(x) and y is \(y)" )
}

publisher.send(Point(x: 2, y: 10))
