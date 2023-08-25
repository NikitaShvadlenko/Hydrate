//
//  CalendarCell.swift
//  Hydrate
//
//  Created by Nikita Shvad on 25.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .cyan
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}
