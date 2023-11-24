import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct RandomizedReplicaPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        RandomizedReplicaMacro.self
    ]
}
