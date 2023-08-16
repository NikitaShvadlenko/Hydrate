import UIKit

public extension UIView {
    func roundCorners(using corners: UIRectCorner, cornerRadii: CGSize) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: cornerRadii)
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}
