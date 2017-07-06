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
    let bindee: Bindee
    let observable: Variable<String>

    init(_ bindee: Bindee,  _ observable: Variable<String>) {
        self.bindee = bindee
        self.observable = observable
    }

    func observer<T: UIView>() -> UIBindingObserver<T, String?> {
        return UIBindingObserver(UIElement: bindee as! T) { _, _ in }
    }
}

protocol Bindee {

}

extension UIView: Bindee {}

class LabelBinding: Binding {
    override func observer<T: UILabel>() -> UIBindingObserver<T, String?> {
        return (bindee as! T).rx.text
    }
}

class ButtonBinding: Binding {
    override func observer<T: UIButton>() -> UIBindingObserver<T, String?> {
        return (bindee as! T).rx.title()
    }
}

