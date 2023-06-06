/// The format the postgres types are encoded in on the wire.
///
/// Currently there a two wire formats supported:
///  - text
///  - binary
public enum PostgresFormat: Int16, Sendable {
    case text = 0
    case binary = 1
}

extension PostgresFormat: CustomStringConvertible {
    public var description: String {
        switch self {
        case .text: return "text"
        case .binary: return "binary"
        }
    }
}

// TODO: The Codable conformance does not make any sense. Let's remove this with next major break.
extension PostgresFormat: Codable {}

// TODO: Renamed during 1.x. Remove this with next major break.
@available(*, deprecated, renamed: "PostgresFormat")
public typealias PostgresFormatCode = PostgresFormat

/// The data type's raw object ID.
/// Use `select * from pg_type where oid = <idhere>;` to lookup more information.
public struct PostgresDataType: RawRepresentable, Sendable, Hashable, CustomStringConvertible {
    /// `0`
    public static let null = PostgresDataType(0)
    /// `16`
    public static let bool = PostgresDataType(16)
    /// `17`
    public static let bytea = PostgresDataType(17)
    /// `18`
    public static let char = PostgresDataType(18)
    /// `19`
    public static let name = PostgresDataType(19)
    /// `20`
    public static let int8 = PostgresDataType(20)
    /// `21`
    public static let int2 = PostgresDataType(21)
    /// `23`
    public static let int4 = PostgresDataType(23)
    /// `24`
    public static let regproc = PostgresDataType(24)
    /// `25`
    public static let text = PostgresDataType(25)
    /// `26`
    public static let oid = PostgresDataType(26)
    /// `114`
    public static let json = PostgresDataType(114)
    /// `194` pg_node_tree
    public static let pgNodeTree = PostgresDataType(194)
    /// `600`
    public static let point = PostgresDataType(600)
    /// `700`
    public static let float4 = PostgresDataType(700)
    /// `701`
    public static let float8 = PostgresDataType(701)
    /// `790`
    public static let money = PostgresDataType(790)
    /// `1000` _bool
    public static let boolArray = PostgresDataType(1000)
    /// `1001` _bytea
    public static let byteaArray = PostgresDataType(1001)
    /// `1002` _char
    public static let charArray = PostgresDataType(1002)
    /// `1003` _name
    public static let nameArray = PostgresDataType(1003)
    /// `1005` _int2
    public static let int2Array = PostgresDataType(1005)
    /// `1007` _int4
    public static let int4Array = PostgresDataType(1007)
    /// `1009` _text
    public static let textArray = PostgresDataType(1009)
    /// `1015` _varchar
    public static let varcharArray = PostgresDataType(1015)
    /// `1016` _int8
    public static let int8Array = PostgresDataType(1016)
    /// `1017` _point
    public static let pointArray = PostgresDataType(1017)
    /// `1021` _float4
    public static let float4Array = PostgresDataType(1021)
    /// `1022` _float8
    public static let float8Array = PostgresDataType(1022)
    /// `1034` _aclitem
    public static let aclitemArray = PostgresDataType(1034)
    /// `1042`
    public static let bpchar = PostgresDataType(1042)
    /// `1043`
    public static let varchar = PostgresDataType(1043)
    /// `1082`
    public static let date = PostgresDataType(1082)
    /// `1083`
    public static let time = PostgresDataType(1083)
    /// `1114`
    public static let timestamp = PostgresDataType(1114)
    /// `1115` _timestamp
    public static let timestampArray = PostgresDataType(1115)
    /// `1184`
    public static let timestamptz = PostgresDataType(1184)
    /// `1266`
    public static let timetz = PostgresDataType(1266)
    /// `1700`
    public static let numeric = PostgresDataType(1700)
    /// `2278`
    public static let void = PostgresDataType(2278)
    /// `2950`
    public static let uuid = PostgresDataType(2950)
    /// `2951` _uuid
    public static let uuidArray = PostgresDataType(2951)
    /// `3802`
    public static let jsonb = PostgresDataType(3802)
    /// `3807` _jsonb
    public static let jsonbArray = PostgresDataType(3807)
    /// `3904`
    public static let int4Range = PostgresDataType(3904)
    /// `3905` _int4range
    public static let int4RangeArray = PostgresDataType(3905)
    /// `3926`
    public static let int8Range = PostgresDataType(3926)
    /// `3927` _int8range
    public static let int8RangeArray = PostgresDataType(3927)

    /// The raw data type code recognized by PostgreSQL.
    public var rawValue: UInt32

    /// Returns `true` if the type's raw value is greater than `2^14`.
    /// This _appears_ to be true for all user-defined types, but I don't
    /// have any documentation to back this up.
    public var isUserDefined: Bool {
        self.rawValue >= 1 << 14
    }

    public init(_ rawValue: UInt32) {
        self.rawValue = rawValue
    }

    public init?(rawValue: UInt32) {
        self.init(rawValue)
    }

    /// Returns the known SQL name, if one exists.
    /// Note: This only supports a limited subset of all PSQL types and is meant for convenience only.
    public var knownSQLName: String? {
        switch self {
        case .bool: return "BOOLEAN"
        case .bytea: return "BYTEA"
        case .char: return "CHAR"
        case .name: return "NAME"
        case .int8: return "BIGINT"
        case .int2: return "SMALLINT"
        case .int4: return "INTEGER"
        case .regproc: return "REGPROC"
        case .text: return "TEXT"
        case .oid: return "OID"
        case .json: return "JSON"
        case .pgNodeTree: return "PGNODETREE"
        case .point: return "POINT"
        case .float4: return "REAL"
        case .float8: return "DOUBLE PRECISION"
        case .money: return "MONEY"
        case .boolArray: return "BOOLEAN[]"
        case .byteaArray: return "BYTEA[]"
        case .charArray: return "CHAR[]"
        case .nameArray: return "NAME[]"
        case .int2Array: return "SMALLINT[]"
        case .int4Array: return "INTEGER[]"
        case .textArray: return "TEXT[]"
        case .varcharArray: return "VARCHAR[]"
        case .int8Array: return "BIGINT[]"
        case .pointArray: return "POINT[]"
        case .float4Array: return "REAL[]"
        case .float8Array: return "DOUBLE PRECISION[]"
        case .aclitemArray: return "ACLITEM[]"
        case .bpchar: return "BPCHAR"
        case .varchar: return "VARCHAR"
        case .date: return "DATE"
        case .time: return "TIME"
        case .timestamp: return "TIMESTAMP"
        case .timestamptz: return "TIMESTAMPTZ"
        case .timestampArray: return "TIMESTAMP[]"
        case .numeric: return "NUMERIC"
        case .void: return "VOID"
        case .uuid: return "UUID"
        case .uuidArray: return "UUID[]"
        case .jsonb: return "JSONB"
        case .jsonbArray: return "JSONB[]"
        case .int4Range: return "INT4RANGE"
        case .int4RangeArray: return "INT4RANGE[]"
        case .int8Range: return "INT8RANGE"
        case .int8RangeArray: return "INT8RANGE[]"
        default: return nil
        }
    }
    
    /// Returns the array type for this type if one is known.
    internal var arrayType: PostgresDataType? {
        switch self {
        case .bool: return .boolArray
        case .bytea: return .byteaArray
        case .char: return .charArray
        case .name: return .nameArray
        case .int2: return .int2Array
        case .int4: return .int4Array
        case .int8: return .int8Array
        case .point: return .pointArray
        case .float4: return .float4Array
        case .float8: return .float8Array
        case .uuid: return .uuidArray
        case .jsonb: return .jsonbArray
        case .text: return .textArray
        case .varchar: return .varcharArray
        case .int4Range: return .int4RangeArray
        case .int8Range: return .int8RangeArray
        default: return nil
        }
    }

    /// Returns the element type for this type if one is known.
    /// Returns nil if this is not an array type.
    internal var elementType: PostgresDataType? {
        switch self {
        case .boolArray: return .bool
        case .byteaArray: return .bytea
        case .charArray: return .char
        case .nameArray: return .name
        case .int2Array: return .int2
        case .int4Array: return .int4
        case .int8Array: return .int8
        case .pointArray: return .point
        case .float4Array: return .float4
        case .float8Array: return .float8
        case .uuidArray: return .uuid
        case .jsonbArray: return .jsonb
        case .textArray: return .text
        case .varcharArray: return .varchar
        case .int4RangeArray: return .int4Range
        case .int8RangeArray: return .int8Range
        default: return nil
        }
    }

    /// Returns the bound type for this type if one is known.
    /// Returns nil if this is not a range type.
    @usableFromInline
    internal var boundType: PostgresDataType? {
        switch self {
        case .int4Range: return .int4
        case .int8Range: return .int8
        default: return nil
        }
    }
    
    /// See `CustomStringConvertible`.
    public var description: String {
        return self.knownSQLName ?? "UNKNOWN \(self.rawValue)"
    }
}

// TODO: The Codable conformance does not make any sense. Let's remove this with next major break.
extension PostgresDataType: Codable {}

// TODO: The ExpressibleByIntegerLiteral conformance does not make any sense and is not used anywhere. Remove with next major break.
extension PostgresDataType: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) {
        self.init(value)
    }
}
