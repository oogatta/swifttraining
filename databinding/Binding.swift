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
    var bindee: Bindee
    var observable: Variable<String>
    var events: [RxEvent] = []

    init(_ bindee: Bindee,  _ observable: Variable<String>) {
        self.bindee = bindee
        self.observable = observable
    }

    func observer<T: UIView>() -> UIBindingObserver<T, String?> {
        return UIBindingObserver(UIElement: bindee as! T) { _, _ in }
    }
}

protocol Bindee {}
extension UIView: Bindee {}

class LabelBinding: Binding {
    override init(_ bindee: Bindee, _ observable: Variable<String>) {
        super.init(bindee, observable)
    }

    init(_ bindee: Bindee, text observableGetter: () -> Variable<String>) {
        super.init(bindee, observableGetter())
    }

    override func observer<T: UILabel>() -> UIBindingObserver<T, String?> {
        return (bindee as! T).rx.text
    }
}

class ButtonBinding: Binding {
    override init(_ bindee: Bindee, _ observable: Variable<String>) {
        super.init(bindee, observable)
    }

    init(_ bindee: Bindee, title observableGetter: () -> Variable<String>, click clickHandler: @escaping () -> Void) {
        super.init(bindee, observableGetter())

        events = [RxEvent(event: (bindee as! UIButton).rx.tap, handler: clickHandler)]
    }

    override func observer<T: UIButton>() -> UIBindingObserver<T, String?> {
        return (bindee as! T).rx.title()
    }
}

class RxEvent {
    let event: ControlEvent<Void>
    let handler: () -> Void

    init(event: ControlEvent<Void>, handler: @escaping () -> Void) {
        self.event = event
        self.handler = handler
    }
}
