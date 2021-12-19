import Foundation
import UIKit

public protocol Component {
    var string: String { get }
    var attributes: Attributes { get }
    var attributedString: NSAttributedString { get }
}

public extension Component {
    private func build(_ string: String, attributes: Attributes) -> Component {
        Text(string, attributes: attributes)
    }
    
    var attributedString: NSAttributedString {
        NSAttributedString(string: string, attributes: attributes)
    }
    
    func attribute(_ newAttribute: NSAttributedString.Key, value: Any) -> Component {
        attributes([newAttribute: value])
    }
    
    func attributes(_ newAttributes: Attributes) -> Component {
        var attributes = self.attributes
        for attribute in newAttributes {
            attributes[attribute.key] = attribute.value
        }
        return build(string, attributes: attributes)
    }
}

public struct Text: Component {
    public init(_ string: String, attributes: Attributes = [:]) {
        self.string = string
        self.attributes = attributes
    }
    
    public let string: String
    public let attributes: Attributes
}

public typealias Font = UIFont
public typealias Color = UIColor

public extension Component {
    func backgroundColor(_ color: Color) -> Component {
        attributes([.backgroundColor: color])
    }
    
    func baselineOffset(_ baselineOffset: CGFloat) -> Component {
        attributes([.baselineOffset: baselineOffset])
    }
    
    func font(_ font: Font) -> Component {
        attributes([.font: font])
    }
    
    func foregroundColor(_ color: Color) -> Component {
        attributes([.foregroundColor: color])
    }
    
    func regex(substring: String, color: Color)  -> Component {
        attributes([:])
    }
}
