//
//  EmptyTransition.swift
//  IMDb client VIPER
//
//  Created by Антон Голубейков on 01.10.2022.
//

import UIKit

final class EmptyTransition: Transition {
    // MARK: - Transition
    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?) {}
    func close(_ viewController: UIViewController, completion: (() -> Void)?) {}
}

