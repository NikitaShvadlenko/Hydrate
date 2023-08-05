import UIKit
import SnapKit

struct VerticalCellConstraintStrategy: SelectionCellConstraintStrategy {
    func setupView(selectionBox: UIView, mainContentView: UIView) {

        selectionBox.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }

        mainContentView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalTo(selectionBox.snp.leading).offset(-8)
        }
    }
}
