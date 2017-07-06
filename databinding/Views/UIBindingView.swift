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

    func bindings() -> [Binding] {
        return []
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        bindings().forEach { binding in
            binding.observable.asObservable().bind(to: binding.observer()).disposed(by: disposeBag)

            binding.events.forEach { rxEvent in
                rxEvent.event.bind(onNext: rxEvent.handler).disposed(by: disposeBag)
            }
        }
    }
}
