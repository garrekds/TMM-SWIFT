import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(TMM_SwiftTests.allTests),
    ]
}
#endif
