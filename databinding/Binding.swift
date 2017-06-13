//
//  Binding.swift
//  databinding
//
//  Created by oogatta on 2017/06/13.
//  Copyright © 2017 oogatta. All rights reserved.
//

import RxSwift
import RxCocoa

class Binding {
    let observable: Variable<String>

    init(_ observable: Variable<String>) {
        self.observable = observable
    }

    func observer<T>(_ view: T) -> UIBindingObserver<T, String?> {
        return UIBindingObserver(UIElement: view) { _, _ in }
    }
}

class LabelBinding: Binding {
    override func observer<T: UILabel>(_ view: T) -> UIBindingObserver<T, String?> {
        return view.rx.text
    }
}

class ButtonBinding: Binding {
    override func observer<T: UIButton>(_ view: T) -> UIBindingObserver<T, String?> {
        return view.rx.title()
    }
}

