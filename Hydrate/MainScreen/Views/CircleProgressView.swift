import UIKit

class CircleProgressView: UIView {
    private var radius: CGFloat { (bounds.width - lineWidth) / 2 }
    private let baseLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    private var lineWidth: CGFloat = 0

    public var progress: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    init(baseColor: UIColor, progressColor: UIColor, lineWidth: CGFloat) {
        self.lineWidth = lineWidth
        for layer in [baseLayer, progressLayer] {
            layer.fillColor = UIColor.clear.cgColor
            layer.lineWidth = lineWidth
            layer.lineCap = .round
        }
        baseLayer.strokeColor = baseColor.cgColor
        baseLayer.strokeEnd = 1.0

        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.strokeEnd = 1

        super.init(frame: .zero)

        layer.addSublayer(baseLayer)
        layer.addSublayer(progressLayer)
    }

    public func animateCircle(duration: TimeInterval, delay: TimeInterval) {
        progressLayer.removeAnimation(forKey: AnimationKeys.circleAnimation.rawValue)
        progressLayer.strokeEnd = 0
        addAnimation(duration: duration, delay: delay)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        baseLayer.frame = bounds
        progressLayer.frame = bounds

        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let basePath = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: .initialAngle,
            endAngle: .endAngle(progress: 1),
            clockwise: true
        )

        let progressPath = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: .initialAngle,
            endAngle: .endAngle(progress: progress),
            clockwise: true
        )

        baseLayer.path = basePath.cgPath
        progressLayer.path = progressPath.cgPath
    }
}

private extension CircleProgressView {
    func addAnimation(duration: TimeInterval, delay: TimeInterval) {
        let animation = CABasicAnimation(keyPath: AnimationKeys.strokeEnd.rawValue)
        animation.beginTime = CACurrentMediaTime() + delay
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: AnimationKeys.circleAnimation.rawValue)
    }
}

private extension CGFloat {
    static var initialAngle: CGFloat = -(.pi / 2)

    static func endAngle(progress: CGFloat) -> CGFloat {
        .pi * 2 * progress + .initialAngle
    }
}

private enum AnimationKeys: String {
    case strokeEnd
    case circleAnimation
}
