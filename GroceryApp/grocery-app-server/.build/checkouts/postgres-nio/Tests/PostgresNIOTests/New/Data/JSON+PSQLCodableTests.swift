import XCTest
import NIOCore
@testable import PostgresNIO

class JSON_PSQLCodableTests: XCTestCase {

    struct Hello: Equatable, Codable, PostgresCodable {
        let hello: String

        init(name: String) {
            self.hello = name
        }
    }

    func testRoundTrip() {
        var buffer = ByteBuffer()
        let hello = Hello(name: "world")
        XCTAssertNoThrow(try hello.encode(into: &buffer, context: .default))
        XCTAssertEqual(Hello.psqlType, .jsonb)

        // verify jsonb prefix byte
        XCTAssertEqual(buffer.getInteger(at: buffer.readerIndex, as: UInt8.self), 1)

        var result: Hello?
        XCTAssertNoThrow(result = try Hello(from: &buffer, type: .jsonb, format: .binary, context: .default))
        XCTAssertEqual(result, hello)
    }

    func testDecodeFromJSON() {
        var buffer = ByteBuffer()
        buffer.writeString(#"{"hello":"world"}"#)

        var result: Hello?
        XCTAssertNoThrow(result = try Hello(from: &buffer, type: .json, format: .binary, context: .default))
        XCTAssertEqual(result, Hello(name: "world"))
    }

    func testDecodeFromJSONAsText() {
        let combinations : [(PostgresFormat, PostgresDataType)] = [
            (.text, .json), (.text, .jsonb),
        ]
        var buffer = ByteBuffer()
        buffer.writeString(#"{"hello":"world"}"#)

        for (format, dataType) in combinations {
            var loopBuffer = buffer
            var result: Hello?
            XCTAssertNoThrow(result = try Hello(from: &loopBuffer, type: dataType, format: format, context: .default))
            XCTAssertEqual(result, Hello(name: "world"))
        }
    }

    func testDecodeFromJSONBWithoutVersionPrefixByte() {
        var buffer = ByteBuffer()
        buffer.writeString(#"{"hello":"world"}"#)

        XCTAssertThrowsError(try Hello(from: &buffer, type: .jsonb, format: .binary, context: .default)) {
            XCTAssertEqual($0 as? PostgresDecodingError.Code, .failure)
        }
    }

    func testDecodeFromJSONBWithWrongDataType() {
        var buffer = ByteBuffer()
        buffer.writeString(#"{"hello":"world"}"#)

        XCTAssertThrowsError(try Hello(from: &buffer, type: .text, format: .binary, context: .default)) {
            XCTAssertEqual($0 as? PostgresDecodingError.Code, .typeMismatch)
        }
    }

    func testCustomEncoderIsUsed() {
        class TestEncoder: PostgresJSONEncoder {
            var encodeHits = 0

            func encode<T>(_ value: T, into buffer: inout ByteBuffer) throws where T : Encodable {
                self.encodeHits += 1
            }

            func encode<T>(_ value: T) throws -> Data where T : Encodable {
                preconditionFailure()
            }
        }

        let hello = Hello(name: "world")
        let encoder = TestEncoder()
        var buffer = ByteBuffer()
        XCTAssertNoThrow(try hello.encode(into: &buffer, context: .init(jsonEncoder: encoder)))
        XCTAssertEqual(encoder.encodeHits, 1)
    }
}
