import SwiftSyntax
import SwiftSyntaxMacros

public enum RandomizedReplicaMacro: MemberMacro {
    public static func expansion<D: DeclGroupSyntax>(
        of node: AttributeSyntax,
        providingMembersOf declaration: D,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        [
            """
            public static func replica() -> Self {
                fatalError()
            }
            """
        ]
    }
    
}
