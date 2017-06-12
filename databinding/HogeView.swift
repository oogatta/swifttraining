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

class HogeView: UIView {
    private let disposeBag = DisposeBag()

    let viewModel = HogeViewModel()

    var tags: [Int: LabelBinding] {
        return [
            1: LabelBinding(viewModel.name),
            2: LabelBinding(viewModel.address),
            //            3: (observable: viewModel.actionName, observer: { view in (view as! UIButton).rx.title() }),
            ]
    }

    override func didAddSubview(_ subview: UIView) {
        if let binding = tags[subview.tag] {
            binding.observable.asObservable().bind(to: binding.observer(subview)).disposed(by: disposeBag)
        }
    }
}

protocol Binding {
    associatedtype Base: AnyObject
    func observer(_ view: UIView) -> UIBindingObserver<Base, String?>
}

class LabelBinding: Binding {
    typealias Base = UILabel
    let observable: Variable<String>

    init(_ observable: Variable<String>) {
        self.observable = observable
    }

    func observer(_ view: UIView) -> UIBindingObserver<UILabel, String?> {
        return (view as! UILabel).rx.text
    }
}
