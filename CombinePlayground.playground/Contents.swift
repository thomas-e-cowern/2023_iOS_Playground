import UIKit
import Combine

["A", "B", "C", "D", "E"].publisher.collect(3).sink {
    print($0)
}
