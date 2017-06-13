//
//  HogeView.swift
//  databinding
//
//  Created by oogatta on 2017/06/12.
//  Copyright © 2017 oogatta. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class OogattaView: UIBindingView {
    let viewModel = OogattaViewModel()

    override func tags() -> [Int: Binding] {
        return [
            1: LabelBinding(viewModel.name),
            2: LabelBinding(viewModel.address),
            3: ButtonBinding(viewModel.actionName),
        ]
    }
}

