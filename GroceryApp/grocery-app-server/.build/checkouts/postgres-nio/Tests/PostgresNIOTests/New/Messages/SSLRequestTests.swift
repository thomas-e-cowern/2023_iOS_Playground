import XCTest
import NIOCore
@testable import PostgresNIO

class SSLRequestTests: XCTestCase {
    
    func testSSLRequest() {
        let encoder = PSQLFrontendMessageEncoder()
        var byteBuffer = ByteBuffer()
        let request = PostgresFrontendMessage.SSLRequest()
        let message = PostgresFrontendMessage.sslRequest(request)
        encoder.encode(data: message, out: &byteBuffer)
        
        let byteBufferLength = Int32(byteBuffer.readableBytes)
        XCTAssertEqual(byteBufferLength, byteBuffer.readInteger())
        XCTAssertEqual(request.code, byteBuffer.readInteger())
        
        XCTAssertEqual(byteBuffer.readableBytes, 0)
    }
    
}
