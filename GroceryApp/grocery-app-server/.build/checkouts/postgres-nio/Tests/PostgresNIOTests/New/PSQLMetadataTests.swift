import NIOCore
import XCTest
@testable import PostgresNIO

class PSQLMetadataTests: XCTestCase {
    func testSelect() {
        XCTAssertEqual(100, PostgresQueryMetadata(string: "SELECT 100")?.rows)
        XCTAssertNotNil(PostgresQueryMetadata(string: "SELECT"))
        XCTAssertNil(PostgresQueryMetadata(string: "SELECT")?.rows)
        XCTAssertNil(PostgresQueryMetadata(string: "SELECT 100 100"))
    }

    func testUpdate() {
        XCTAssertEqual(100, PostgresQueryMetadata(string: "UPDATE 100")?.rows)
        XCTAssertNil(PostgresQueryMetadata(string: "UPDATE"))
        XCTAssertNil(PostgresQueryMetadata(string: "UPDATE 100 100"))
    }
}
