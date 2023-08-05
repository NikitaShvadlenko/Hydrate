import UIKit
import SnapKit

struct HorizontalCellConstraintStrategy: SelectionCellConstraintStrategy {
    func setupView(selectionBox: UIView, mainContentView: UIView) {

        selectionBox.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }

        mainContentView.snp.makeConstraints { make in
            make.bottom.equalTo(selectionBox.snp.top).offset(-8)
            make.leading.trailing.top.equalToSuperview()
        }
    }
}
