import PostgresNIO
import XCTest
import NIOTestUtils
import NIOCore

class PostgresMessageDecoderTests: XCTestCase {
    @available(*, deprecated, message: "Tests deprecated API")
    func testMessageDecoder() {
        let sample: [UInt8] = [
            0x52, // R - authentication
                0x00, 0x00, 0x00, 0x0C, // length = 12
                0x00, 0x00, 0x00, 0x05, // md5
                0x01, 0x02, 0x03, 0x04, // salt
            0x4B, // B - backend key data
                0x00, 0x00, 0x00, 0x0C, // length = 12
                0x05, 0x05, 0x05, 0x05, // process id
                0x01, 0x01, 0x01, 0x01, // secret key
        ]
        var input = ByteBufferAllocator().buffer(capacity: 0)
        input.writeBytes(sample)

        let output: [PostgresMessage] = [
            PostgresMessage(identifier: .authentication, bytes: [
                0x00, 0x00, 0x00, 0x05,
                0x01, 0x02, 0x03, 0x04,
            ]),
            PostgresMessage(identifier: .backendKeyData, bytes: [
                0x05, 0x05, 0x05, 0x05,
                0x01, 0x01, 0x01, 0x01,
            ])
        ]
        XCTAssertNoThrow(try XCTUnwrap(ByteToMessageDecoderVerifier.verifyDecoder(
            inputOutputPairs: [(input, output)],
            decoderFactory: {
                PostgresMessageDecoder()
            }
        )))
    }
}
