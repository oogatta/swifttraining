//
//  UIBindingView.swift
//  databinding
//
//  Created by oogatta on 2017/06/14.
//  Copyright © 2017 oogatta. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UIBindingView: UIView {
    private let disposeBag = DisposeBag()

    func tags() -> [Int: Binding] {
        return [:]
    }

    override func didAddSubview(_ subview: UIView) {
        if let binding = tags()[subview.tag] {
            binding.observable.asObservable().bind(to: binding.observer(subview)).disposed(by: disposeBag)
        }
    }
}
