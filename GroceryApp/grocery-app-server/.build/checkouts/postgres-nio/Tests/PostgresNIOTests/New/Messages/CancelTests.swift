import XCTest
import NIOCore
@testable import PostgresNIO

class CancelTests: XCTestCase {
    
    func testEncodeCancel() {
        let encoder = PSQLFrontendMessageEncoder()
        var byteBuffer = ByteBuffer()
        let cancel = PostgresFrontendMessage.Cancel(processID: 1234, secretKey: 4567)
        let message = PostgresFrontendMessage.cancel(cancel)
        encoder.encode(data: message, out: &byteBuffer)
        
        XCTAssertEqual(byteBuffer.readableBytes, 16)
        XCTAssertEqual(16, byteBuffer.readInteger(as: Int32.self)) // payload length
        XCTAssertEqual(80877102, byteBuffer.readInteger(as: Int32.self)) // cancel request code
        XCTAssertEqual(cancel.processID, byteBuffer.readInteger(as: Int32.self))
        XCTAssertEqual(cancel.secretKey, byteBuffer.readInteger(as: Int32.self))
        XCTAssertEqual(byteBuffer.readableBytes, 0)
    }
    
}
