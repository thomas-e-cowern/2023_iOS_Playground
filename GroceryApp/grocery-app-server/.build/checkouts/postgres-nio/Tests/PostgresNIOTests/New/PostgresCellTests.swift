@testable import PostgresNIO
import XCTest
import NIOCore

final class PostgresCellTests: XCTestCase {
    func testDecodingANonOptionalString() {
        let cell = PostgresCell(
            bytes: ByteBuffer(string: "Hello world"),
            dataType: .text,
            format: .binary,
            columnName: "hello",
            columnIndex: 1
        )

        var result: String?
        XCTAssertNoThrow(result = try cell.decode(String.self, context: .default))
        XCTAssertEqual(result, "Hello world")
    }

    func testDecodingAnOptionalString() {
        let cell = PostgresCell(
            bytes: nil,
            dataType: .text,
            format: .binary,
            columnName: "hello",
            columnIndex: 1
        )

        var result: String? = "test"
        XCTAssertNoThrow(result = try cell.decode(String?.self, context: .default))
        XCTAssertNil(result)
    }

    func testDecodingFailure() {
        let cell = PostgresCell(
            bytes: ByteBuffer(string: "Hello world"),
            dataType: .text,
            format: .binary,
            columnName: "hello",
            columnIndex: 1
        )

        XCTAssertThrowsError(try cell.decode(Int?.self, context: .default)) {
            guard let error = $0 as? PostgresDecodingError else {
                return XCTFail("Unexpected error")
            }

            XCTAssertEqual(error.file, #fileID)
            XCTAssertEqual(error.line, #line - 6)
            XCTAssertEqual(error.code, .typeMismatch)
            XCTAssertEqual(error.columnName, "hello")
            XCTAssertEqual(error.columnIndex, 1)
            XCTAssert(error.targetType == Int?.self)
            XCTAssertEqual(error.postgresType, .text)
            XCTAssertEqual(error.postgresFormat, .binary)
        }
    }
}
