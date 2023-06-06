import NIOCore

extension PostgresBackendMessage {
    enum TransactionState: PayloadDecodable, RawRepresentable {
        typealias RawValue = UInt8
        
        case idle
        case inTransaction
        case inFailedTransaction
        
        init?(rawValue: UInt8) {
            switch rawValue {
            case UInt8(ascii: "I"):
                self = .idle
            case UInt8(ascii: "T"):
                self = .inTransaction
            case UInt8(ascii: "E"):
                self = .inFailedTransaction
            default:
                return nil
            }
        }

        var rawValue: Self.RawValue {
            switch self {
            case .idle:
                return UInt8(ascii: "I")
            case .inTransaction:
                return UInt8(ascii: "T")
            case .inFailedTransaction:
                return UInt8(ascii: "E")
            }
        }
        
        static func decode(from buffer: inout ByteBuffer) throws -> Self {
            let value = try buffer.throwingReadInteger(as: UInt8.self)
            guard let state = Self.init(rawValue: value) else {
                throw PSQLPartialDecodingError.valueNotRawRepresentable(value: value, asType: TransactionState.self)
            }
            
            return state
        }
    }
}

extension PostgresBackendMessage.TransactionState: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .idle:
            return ".idle"
        case .inTransaction:
            return ".inTransaction"
        case .inFailedTransaction:
            return ".inFailedTransaction"
        }
    }
}
