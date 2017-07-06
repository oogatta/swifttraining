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

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!

    override func bindings() -> [Binding] {
        return [
            LabelBinding(nameLabel, viewModel.name),
            LabelBinding(addressLabel, viewModel.address),
            ButtonBinding(actionButton, viewModel.actionName)
        ]
    }
}

