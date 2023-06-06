import XCTest
import NIOCore
@testable import PostgresNIO

class PasswordTests: XCTestCase {
    
    func testEncodePassword() {
        let encoder = PSQLFrontendMessageEncoder()
        var byteBuffer = ByteBuffer()
        // md522d085ed8dc3377968dc1c1a40519a2a = "abc123" with salt 1, 2, 3, 4
        let message = PostgresFrontendMessage.password(.init(value: "md522d085ed8dc3377968dc1c1a40519a2a"))
        encoder.encode(data: message, out: &byteBuffer)
        
        let expectedLength = 41 // 1 (id) + 4 (length) + 35 (string) + 1 (null termination)
        
        XCTAssertEqual(byteBuffer.readableBytes, expectedLength)
        XCTAssertEqual(byteBuffer.readInteger(as: UInt8.self), PostgresFrontendMessage.ID.password.rawValue)
        XCTAssertEqual(byteBuffer.readInteger(as: Int32.self), Int32(expectedLength - 1)) // length
        XCTAssertEqual(byteBuffer.readNullTerminatedString(), "md522d085ed8dc3377968dc1c1a40519a2a")
    }
}
