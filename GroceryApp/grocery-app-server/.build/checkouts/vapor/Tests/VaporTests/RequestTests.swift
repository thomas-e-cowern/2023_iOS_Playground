import XCTVapor
import XCTest
import Vapor
import NIOCore

final class RequestTests: XCTestCase {
    
    func testCustomHostAddress() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        
        app.get("vapor", "is", "fun") {
            return $0.remoteAddress?.hostname ?? "n/a"
        }
        
        let ipV4Hostname = "127.0.0.1"
        try app.testable(method: .running(hostname: ipV4Hostname, port: 8080)).test(.GET, "vapor/is/fun") { res in
            XCTAssertEqual(res.body.string, ipV4Hostname)
        }
    }
    
    func testRequestIdsAreUnique() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        
        let request1 = Request(application: app, on: app.eventLoopGroup.next())
        let request2 = Request(application: app, on: app.eventLoopGroup.next())
        
        XCTAssertNotEqual(request1.id, request2.id)
    }

    func testRequestPeerAddressForwarded() throws {
        let app = Application(.testing)
        defer { app.shutdown() }

        app.get("remote") { req -> String in
            req.headers.add(name: .forwarded, value: "for=192.0.2.60; proto=http; by=203.0.113.43")
            guard let peerAddress = req.peerAddress else {
                return "n/a"
            }
            return peerAddress.description
        }

        try app.testable(method: .running).test(.GET, "remote") { res in
            XCTAssertEqual(res.body.string, "[IPv4]192.0.2.60:80")
        }
    }

    func testRequestPeerAddressXForwardedFor() throws {
        let app = Application(.testing)
        defer { app.shutdown() }

        app.get("remote") { req -> String in
            req.headers.add(name: .xForwardedFor, value: "5.6.7.8")
            guard let peerAddress = req.peerAddress else {
                return "n/a"
            }
            return peerAddress.description
        }

        try app.testable(method: .running).test(.GET, "remote") { res in
            XCTAssertEqual(res.body.string, "[IPv4]5.6.7.8:80")
        }
    }

    func testRequestPeerAddressRemoteAddres() throws {
        let app = Application(.testing)
        defer { app.shutdown() }

        app.get("remote") { req -> String in
            guard let peerAddress = req.peerAddress else {
                return "n/a"
            }
            return peerAddress.description
        }

        let ipV4Hostname = "127.0.0.1"
        try app.testable(method: .running(hostname: ipV4Hostname, port: 8080)).test(.GET, "remote") { res in
            XCTAssertContains(res.body.string, "[IPv4]\(ipV4Hostname)")
        }
    }

    func testRequestPeerAddressMultipleHeadersOrder() throws {
        let app = Application(.testing)
        defer { app.shutdown() }

        app.get("remote") { req -> String in
            req.headers.add(name: .xForwardedFor, value: "5.6.7.8")
            req.headers.add(name: .forwarded, value: "for=192.0.2.60; proto=http; by=203.0.113.43")
            guard let peerAddress = req.peerAddress else {
                return "n/a"
            }
            return peerAddress.description
        }

        let ipV4Hostname = "127.0.0.1"
        try app.testable(method: .running(hostname: ipV4Hostname, port: 8080)).test(.GET, "remote") { res in
            XCTAssertEqual(res.body.string, "[IPv4]192.0.2.60:80")
        }
    }


    func testRequestRemoteAddress() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        
        app.get("remote") {
            $0.remoteAddress?.description ?? "n/a"
        }
        
        try app.testable(method: .running).test(.GET, "remote") { res in
            XCTAssertContains(res.body.string, "IP")
        }
    }

    func testURI() throws {
        do {
            var uri = URI(string: "http://vapor.codes/foo?bar=baz#qux")
            XCTAssertEqual(uri.scheme, "http")
            XCTAssertEqual(uri.host, "vapor.codes")
            XCTAssertEqual(uri.path, "/foo")
            XCTAssertEqual(uri.query, "bar=baz")
            XCTAssertEqual(uri.fragment, "qux")
            uri.query = "bar=baz&test=1"
            XCTAssertEqual(uri.string, "http://vapor.codes/foo?bar=baz&test=1#qux")
            uri.query = nil
            XCTAssertEqual(uri.string, "http://vapor.codes/foo#qux")
        }
        do {
            let uri = URI(string: "/foo/bar/baz")
            XCTAssertEqual(uri.path, "/foo/bar/baz")
        }
        do {
            let uri = URI(string: "ws://echo.websocket.org/")
            XCTAssertEqual(uri.scheme, "ws")
            XCTAssertEqual(uri.host, "echo.websocket.org")
            XCTAssertEqual(uri.path, "/")
        }
        do {
            let uri = URI(string: "http://foo")
            XCTAssertEqual(uri.scheme, "http")
            XCTAssertEqual(uri.host, "foo")
            XCTAssertEqual(uri.path, "")
        }
        do {
            let uri = URI(string: "foo")
            XCTAssertEqual(uri.scheme, "foo")
            XCTAssertEqual(uri.host, nil)
            XCTAssertEqual(uri.path, "")
        }
        do {
            let uri: URI = "/foo/bar/baz"
            XCTAssertEqual(uri.path, "/foo/bar/baz")
        }
        do {
            let foo = "foo"
            let uri: URI = "/\(foo)/bar/baz"
            XCTAssertEqual(uri.path, "/foo/bar/baz")
        }
        do {
            let uri = URI(scheme: "foo", host: "host", port: 1, path: "test", query: "query", fragment: "fragment")
            XCTAssertEqual(uri.string, "foo://host:1/test?query#fragment")
        }
        do {
            let bar = "bar"
            let uri = URI(scheme: "foo\(bar)", host: "host", port: 1, path: "test", query: "query", fragment: "fragment")
            XCTAssertEqual(uri.string, "foobar://host:1/test?query#fragment")
        }
        do {
            let uri = URI(scheme: "foo", host: "host", port: 1, path: "/test", query: "query", fragment: "fragment")
            XCTAssertEqual(uri.string, "foo://host:1/test?query#fragment")
        }
        do {
            let scheme = "foo"
            let uri = URI(scheme: scheme, host: "host", port: 1, path: "test", query: "query", fragment: "fragment")
            XCTAssertEqual(uri.string, "foo://host:1/test?query#fragment")
        }
        do {
            let scheme: String? = "foo"
            let uri = URI(scheme: scheme, host: "host", port: 1, path: "test", query: "query", fragment: "fragment")
            XCTAssertEqual(uri.string, "foo://host:1/test?query#fragment")
        }
        do {
            let uri = URI(scheme: .http, host: "host", port: 1, path: "test", query: "query", fragment: "fragment")
            XCTAssertEqual(uri.string, "http://host:1/test?query#fragment")
        }
        do {
            let uri = URI(scheme: nil, host: "host", port: 1, path: "test", query: "query", fragment: "fragment")
            XCTAssertEqual(uri.string, "host:1/test?query#fragment")
        }
        do {
            let uri = URI(scheme: URI.Scheme(), host: "host", port: 1, path: "test", query: "query", fragment: "fragment")
            XCTAssertEqual(uri.string, "host:1/test?query#fragment")
        }
        do {
            let uri = URI(host: "host", port: 1, path: "test", query: "query", fragment: "fragment")
            XCTAssertEqual(uri.string, "host:1/test?query#fragment")
        }
        do {
            let uri = URI(scheme: .httpUnixDomainSocket, host: "/path", path: "test", query: "query", fragment: "fragment")
            XCTAssertEqual(uri.string, "http+unix://%2Fpath/test?query#fragment")
        }
        do {
            let uri = URI(scheme: .httpUnixDomainSocket, host: "/path", path: "test", fragment: "fragment")
            XCTAssertEqual(uri.string, "http+unix://%2Fpath/test#fragment")
        }
        do {
            let uri = URI(scheme: .httpUnixDomainSocket, host: "/path", path: "test")
            XCTAssertEqual(uri.string, "http+unix://%2Fpath/test")
        }
        do {
            let uri = URI()
            XCTAssertEqual(uri.string, "/")
        }
    }
    
    func testRedirect() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        
        app.http.client.configuration.redirectConfiguration = .disallow

        app.get("redirect_normal") {
            $0.redirect(to: "foo", redirectType: .normal)
        }
        app.get("redirect_permanent") {
            $0.redirect(to: "foo", redirectType: .permanent)
        }
        app.post("redirect_temporary") {
            $0.redirect(to: "foo", redirectType: .temporary)
        }
        app.post("redirect_permanentPost") {
            $0.redirect(to: "foo", redirectType: .permanentPost)
        }
        
        try app.server.start(address: .hostname("localhost", port: 8080))
        defer { app.server.shutdown() }
        
        XCTAssertEqual(
            try app.client.get("http://localhost:8080/redirect_normal").wait().status,
            .seeOther
        )
        XCTAssertEqual(
            try app.client.get("http://localhost:8080/redirect_permanent").wait().status,
            .movedPermanently
        )
        XCTAssertEqual(
            try app.client.post("http://localhost:8080/redirect_temporary").wait().status,
            .temporaryRedirect
        )
        XCTAssertEqual(
            try app.client.post("http://localhost:8080/redirect_permanentPost").wait().status,
            .permanentRedirect
        )
    }
    
    func testRedirect_old() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        
        app.http.client.configuration.redirectConfiguration = .disallow

        // DO NOT fix these warnings.
        // This is intentional to make sure the deprecated functions still work.
        app.get("redirect_normal") {
            $0.redirect(to: "foo", type: .normal)
        }
        app.get("redirect_permanent") {
            $0.redirect(to: "foo", type: .permanent)
        }
        app.post("redirect_temporary") {
            $0.redirect(to: "foo", type: .temporary)
        }
        
        try app.server.start(address: .hostname("localhost", port: 8080))
        defer { app.server.shutdown() }
        
        XCTAssertEqual(
            try app.client.get("http://localhost:8080/redirect_normal").wait().status,
            .seeOther
        )
        XCTAssertEqual(
            try app.client.get("http://localhost:8080/redirect_permanent").wait().status,
            .movedPermanently
        )
        XCTAssertEqual(
            try app.client.post("http://localhost:8080/redirect_temporary").wait().status,
            .temporaryRedirect
        )
    }
    
    func testCollectedBodyDrain() throws {
        let app = Application()
        defer { app.shutdown() }

        let request = Request(
            application: app,
            collectedBody: .init(string: ""),
            on: EmbeddedEventLoop()
        )
        
        let handleBufferExpectation = XCTestExpectation()
        let endDrainExpectation = XCTestExpectation()
        
        request.body.drain { part in
            switch part {
            case .buffer:
                return request.eventLoop.makeFutureWithTask {
                    handleBufferExpectation.fulfill()
                }
            case .error:
                XCTAssertTrue(false)
                return request.eventLoop.makeSucceededVoidFuture()
            case .end:
                endDrainExpectation.fulfill()
                return request.eventLoop.makeSucceededVoidFuture()
            }
        }
        
        self.wait(for: [handleBufferExpectation, endDrainExpectation], timeout: 1.0, enforceOrder: true)
    }
}
