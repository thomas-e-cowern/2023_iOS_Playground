//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftNIO open source project
//
// Copyright (c) 2018-2023 Apple Inc. and the SwiftNIO project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftNIO project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//
//
// LinuxMain.swift
//
import XCTest

///
/// NOTE: This file was generated by generate_linux_tests.rb
///
/// Do NOT edit this file directly as it will be regenerated automatically when needed.
///

#if !compiler(>=5.5)
#if os(Linux) || os(FreeBSD) || os(Android)
   @testable import NIOExtrasTests
   @testable import NIOHTTPCompressionTests
   @testable import NIONFS3Tests
   @testable import NIOSOCKSTests

@available(*, deprecated, message: "not actually deprecated. Just deprecated to allow deprecated tests (which test deprecated functionality) without warnings")
@main
class LinuxMainRunner {
   @available(*, deprecated, message: "not actually deprecated. Just deprecated to allow deprecated tests (which test deprecated functionality) without warnings")
   static func main() {
       XCTMain([
             testCase(ClientGreetingTests.allTests),
             testCase(ClientRequestTests.allTests),
             testCase(ClientStateMachineTests.allTests),
             testCase(DebugInboundEventsHandlerTest.allTests),
             testCase(DebugOutboundEventsHandlerTest.allTests),
             testCase(FixedLengthFrameDecoderTest.allTests),
             testCase(HTTP1ProxyConnectHandlerTests.allTests),
             testCase(HTTPRequestCompressorTest.allTests),
             testCase(HTTPRequestDecompressorTest.allTests),
             testCase(HTTPResponseCompressorTest.allTests),
             testCase(HTTPResponseDecompressorTest.allTests),
             testCase(HelperTests.allTests),
             testCase(JSONRPCFramingContentLengthHeaderDecoderTests.allTests),
             testCase(JSONRPCFramingContentLengthHeaderEncoderTests.allTests),
             testCase(LengthFieldBasedFrameDecoderTest.allTests),
             testCase(LengthFieldPrependerTest.allTests),
             testCase(LineBasedFrameDecoderTest.allTests),
             testCase(MethodSelectionTests.allTests),
             testCase(NFS3FileSystemTests.allTests),
             testCase(NFS3ReplyEncoderTest.allTests),
             testCase(NFS3RoundtripTests.allTests),
             testCase(PCAPRingBufferTest.allTests),
             testCase(QuiescingHelperTest.allTests),
             testCase(RequestResponseHandlerTest.allTests),
             testCase(RequestResponseWithIDHandlerTest.allTests),
             testCase(SOCKSServerHandlerTests.allTests),
             testCase(ServerResponseTests.allTests),
             testCase(ServerStateMachineTests.allTests),
             testCase(SocksClientHandlerTests.allTests),
             testCase(SynchronizedFileSinkTests.allTests),
             testCase(WritePCAPHandlerTest.allTests),
        ])
    }
}
#endif
#else
#error("on Swift 5.5 and newer, --enable-test-discovery is required")
#endif