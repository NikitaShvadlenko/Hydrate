import UIKit

public extension UIColor {
    var codedString: String? {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: true)
            return data.base64EncodedString()
        } catch let error {
            print("Error converting color to coded string: \(error)")
            return nil
        }
    }

    static func color(withCodedString string: String) -> UIColor? {
        guard let data = Data(base64Encoded: string) else {
            return nil
        }
        return try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
    }
}
