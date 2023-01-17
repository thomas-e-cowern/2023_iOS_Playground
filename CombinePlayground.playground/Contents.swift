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

// Map with struct
struct Point {
    let x: Int
    let y: Int
}

let publisher = PassthroughSubject<Point, Never>()

publisher.map(\.x, \.y).sink { x, y in
    print("X is \(x) and y is \(y)" )
}

publisher.send(Point(x: 2, y: 10))

// Flatmap
struct School {
    let name: String
    let noOfStudents: CurrentValueSubject<Int, Never> // Publisher that returns a single value
    
    init(name: String, noOfStudents: Int) {
        self.name = name
        self.noOfStudents = CurrentValueSubject(noOfStudents)
    }
}

let citySchool = School(name: "WPB High School", noOfStudents: 121)

let school = CurrentValueSubject<School, Never>(citySchool)

school
    .flatMap {
        $0.noOfStudents
    }
    .sink {
        print($0)
    }

let townSchool = School(name: "WPB Elementary School", noOfStudents: 100)

school.value = townSchool

citySchool.noOfStudents.value += 10

townSchool.noOfStudents.value += 20

// Replace nil
["A", "B", "C", nil, "E"].publisher.replaceNil(with: "*").sink {
    print($0 ?? "")
}

