//
//  DefaultRouter.swift
//  IMDb client VIPER
//
//  Created by Антон Голубейков on 01.10.2022.
//

import UIKit

class DefaultRouter: NSObject, Router, Closable, Dismissable {
    private let rootTransition: Transition
    weak var root: UIViewController?

    init(rootTransition: Transition) {
        self.rootTransition = rootTransition
    }

    // MARK: - Routable
    func route(to viewController: UIViewController, as transition: Transition, completion: (() -> Void)?) {
        guard let root = root else { return }
        transition.open(viewController, from: root, completion: completion)
    }

    func route(to viewController: UIViewController, as transition: Transition) {
        route(to: viewController, as: transition, completion: nil)
    }

    // MARK: - Closable
    func close(completion: (() -> Void)?) {
        guard let root = root else { return }
        // Removes the `root` with the same transition that it was opened.
        rootTransition.close(root, completion: completion)
    }

    func close() {
        close(completion: nil)
    }

    // MARK: - Dismissable
    func dismiss(completion: (() -> Void)?) {
        // работает для модальных контроллеров
        root?.dismiss(animated: true, completion: completion)
    }

    func dismiss() {
        dismiss(completion: nil)
    }
}

