private func warn(
    _ old: Any.Type, mustBeConvertedTo new: Any.Type,
    file: StaticString = #file, line: UInt = #line
) {
    assertionFailure("""
    Integer conversion unsafe.
    Postgres does not support storing \(old) natively.

    To bypass this assertion, compile in release mode.

        swift build -c release

    Unsigned integers were previously allowed by PostgresNIO
    but may cause overflow. To avoid overflow errors, update
    your code to use \(new) instead.

    See https://github.com/vapor/postgres-nio/pull/120

    """, file: file, line: line)
}

extension PostgresData {
    @available(*, deprecated, renamed: "init(int:)")
    public init(uint value: UInt) {
        warn(UInt.self, mustBeConvertedTo: Int.self)
        self.init(int: .init(bitPattern: value))
    }

    @available(*, deprecated, renamed: "init(uint8:)")
    public init(int8 value: Int8) {
        warn(Int8.self, mustBeConvertedTo: UInt8.self)
        self.init(uint8: .init(bitPattern: value))
    }

    @available(*, deprecated, renamed: "init(int16:)")
    public init(uint16 value: UInt16) {
        warn(UInt16.self, mustBeConvertedTo: Int16.self)
        self.init(int16: .init(bitPattern: value))
    }

    @available(*, deprecated, renamed: "init(int32:)")
    public init(uint32 value: UInt32) {
        warn(UInt32.self, mustBeConvertedTo: Int32.self)
        self.init(int32: .init(bitPattern: value))
    }

    @available(*, deprecated, renamed: "init(int64:)")
    public init(uint64 value: UInt64) {
        warn(UInt64.self, mustBeConvertedTo: Int64.self)
        self.init(int64: .init(bitPattern: value))
    }

    @available(*, deprecated, renamed: "int")
    public var uint: UInt? {
        warn(UInt.self, mustBeConvertedTo: Int.self)
        return self.int.flatMap { .init(bitPattern: $0) }
    }

    @available(*, deprecated, renamed: "uint8")
    public var int8: Int8? {
        warn(Int8.self, mustBeConvertedTo: UInt8.self)
        return self.uint8.flatMap { .init(bitPattern: $0) }
    }

    @available(*, deprecated, renamed: "int16")
    public var uint16: UInt16? {
        warn(UInt16.self, mustBeConvertedTo: Int16.self)
        return self.int16.flatMap { .init(bitPattern: $0) }
    }

    @available(*, deprecated, renamed: "int32")
    public var uint32: UInt32? {
        warn(UInt32.self, mustBeConvertedTo: Int32.self)
        return self.int32.flatMap { .init(bitPattern: $0) }
    }

    @available(*, deprecated, renamed: "int64")
    public var uint64: UInt64? {
        warn(UInt64.self, mustBeConvertedTo: Int64.self)
        return self.int64.flatMap { .init(bitPattern: $0) }
    }
}

@available(*, deprecated, message: "Use 'Int' instead.")
extension UInt: PostgresDataConvertible {
    public static var postgresDataType: PostgresDataType { .int8 }

    public init?(postgresData: PostgresData) {
        guard let uint = postgresData.uint else {
            return nil
        }
        self = uint
    }

    public var postgresData: PostgresData? {
        .init(uint: self)
    }
}

@available(*, deprecated, message: "Use 'UInt8' instead.")
extension Int8: PostgresDataConvertible {
    public static var postgresDataType: PostgresDataType { .char }

    public init?(postgresData: PostgresData) {
        guard let int8 = postgresData.int8 else {
            return nil
        }
        self = int8
    }

    public var postgresData: PostgresData? {
        .init(int8: self)
    }
}

@available(*, deprecated, message: "Use 'Int16' instead.")
extension UInt16: PostgresDataConvertible {
    public static var postgresDataType: PostgresDataType { .int2 }

    public init?(postgresData: PostgresData) {
        guard let uint16 = postgresData.uint16 else {
            return nil
        }
        self = uint16
    }

    public var postgresData: PostgresData? {
        .init(uint16:  self)
    }
}

@available(*, deprecated, message: "Use 'Int32' instead.")
extension UInt32: PostgresDataConvertible {
    public static var postgresDataType: PostgresDataType { .int4 }

    public init?(postgresData: PostgresData) {
        guard let uint32 = postgresData.uint32 else {
            return nil
        }
        self = uint32
    }

    public var postgresData: PostgresData? {
        .init(uint32: self)
    }
}

@available(*, deprecated, message: "Use 'Int64' instead.")
extension UInt64: PostgresDataConvertible {
    public static var postgresDataType: PostgresDataType { .int8 }

    public init?(postgresData: PostgresData) {
        guard let uint64 = postgresData.uint64 else {
            return nil
        }
        self = uint64
    }

    public var postgresData: PostgresData? {
        .init(uint64: self)
    }
}
