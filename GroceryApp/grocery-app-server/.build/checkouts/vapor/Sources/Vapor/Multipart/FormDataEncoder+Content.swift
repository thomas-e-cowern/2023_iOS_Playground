import MultipartKit
import NIOHTTP1
import NIOCore

extension FormDataEncoder: ContentEncoder {
    public func encode<E>(_ encodable: E, to body: inout ByteBuffer, headers: inout HTTPHeaders) throws
        where E: Encodable
    {
        try self.encode(encodable, to: &body, headers: &headers, userInfo: [:])
    }

    public func encode<E>(_ encodable: E, to body: inout ByteBuffer, headers: inout HTTPHeaders, userInfo: [CodingUserInfoKey: Any]) throws
        where E: Encodable
    {
        let boundary = "----vaporBoundary\(randomBoundaryData())"
        headers.contentType = HTTPMediaType(type: "multipart", subType: "form-data", parameters: ["boundary": boundary])
        if !userInfo.isEmpty {
            var actualEncoder = self  // Changing a coder's userInfo is a thread-unsafe mutation, operate on a copy
            actualEncoder.userInfo.merge(userInfo) { $1 }
            return try actualEncoder.encode(encodable, boundary: boundary, into: &body)
        } else {
            return try self.encode(encodable, boundary: boundary, into: &body)
        }
    }
}

// MARK: Private

private let chars = "abcdefghijklmnopqrstuvwxyz0123456789"

private func randomBoundaryData() -> String {
    var string = ""
    for _ in 0..<16 {
        string.append(chars.randomElement()!)
    }
    return string
}
