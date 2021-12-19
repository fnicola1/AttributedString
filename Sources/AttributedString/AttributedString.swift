import Foundation

public typealias Attributes = [NSAttributedString.Key: Any]

@resultBuilder
public struct AttributedStringBuilder {
    public static func buildBlock(_ components: Component...) -> NSAttributedString {
        return components.reduce(into: NSMutableAttributedString(string: "")) {
            $0.append($1.attributedString)
        }
    }
}

public class AttributedString: NSAttributedString { }

public extension AttributedString {
    public convenience init(@AttributedStringBuilder _ builder: () -> NSAttributedString) {
        self.init(attributedString: builder())
    }
}
