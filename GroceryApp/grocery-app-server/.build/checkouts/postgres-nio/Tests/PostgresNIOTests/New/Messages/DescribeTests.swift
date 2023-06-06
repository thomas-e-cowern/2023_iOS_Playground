import XCTest
import NIOCore
@testable import PostgresNIO

class DescribeTests: XCTestCase {
    
    func testEncodeDescribePortal() {
        let encoder = PSQLFrontendMessageEncoder()
        var byteBuffer = ByteBuffer()
        let message = PostgresFrontendMessage.describe(.portal("Hello"))
        encoder.encode(data: message, out: &byteBuffer)
        
        XCTAssertEqual(byteBuffer.readableBytes, 12)
        XCTAssertEqual(PostgresFrontendMessage.ID.describe.rawValue, byteBuffer.readInteger(as: UInt8.self))
        XCTAssertEqual(11, byteBuffer.readInteger(as: Int32.self))
        XCTAssertEqual(UInt8(ascii: "P"), byteBuffer.readInteger(as: UInt8.self))
        XCTAssertEqual("Hello", byteBuffer.readNullTerminatedString())
        XCTAssertEqual(byteBuffer.readableBytes, 0)
    }
    
    func testEncodeDescribeUnnamedStatement() {
        let encoder = PSQLFrontendMessageEncoder()
        var byteBuffer = ByteBuffer()
        let message = PostgresFrontendMessage.describe(.preparedStatement(""))
        encoder.encode(data: message, out: &byteBuffer)
        
        XCTAssertEqual(byteBuffer.readableBytes, 7)
        XCTAssertEqual(PostgresFrontendMessage.ID.describe.rawValue, byteBuffer.readInteger(as: UInt8.self))
        XCTAssertEqual(6, byteBuffer.readInteger(as: Int32.self))
        XCTAssertEqual(UInt8(ascii: "S"), byteBuffer.readInteger(as: UInt8.self))
        XCTAssertEqual("", byteBuffer.readNullTerminatedString())
        XCTAssertEqual(byteBuffer.readableBytes, 0)
    }

}
