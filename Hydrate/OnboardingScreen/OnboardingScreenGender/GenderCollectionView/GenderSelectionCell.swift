import UIKit

class GenderSelectionCell: UICollectionViewCell {

    private lazy var selectionBox: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 10
        return view
    }()

    private lazy var genderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

extension GenderSelectionCell {
    private func setupView() {
        [
            selectionBox,
            genderImageView
        ].forEach(addSubview(_:))

        selectionBox.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(20)
        }

        genderImageView.snp.makeConstraints { make in
            make.bottom.equalTo(selectionBox.snp.top).offset(-8)
            make.leading.trailing.top.equalToSuperview()
        }
    }
}
