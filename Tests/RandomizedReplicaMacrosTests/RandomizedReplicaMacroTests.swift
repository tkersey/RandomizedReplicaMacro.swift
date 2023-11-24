import RandomizedReplicaMacros
import MacroTesting
import XCTest

final class RandomizedReplicaMacroTests: XCTestCase {
    override func invokeTest() {
        withMacroTesting(
            isRecording: true,
            macros: [RandomizedReplicaMacro.self]
        ) {
            super.invokeTest()
        }
    }

    func testBasics() {
        assertMacro {
            """
            @RandomizedReplica
            struct Foo {
              let string: String
            }
            """
        } expansion: {
            """
            struct Foo {
              let string: String
            }
            """
        }
    }
}
