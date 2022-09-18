//
//  AlertView.swift
//  IMDb client MVVM
//
//  Created by Антон Голубейков on 17.09.2022.
//

import UIKit

func appendAlertView(for viewController: UIViewController, text: String, completion: @escaping (UIAlertAction) -> Void) {
    let alert = UIAlertController(title: "Ошибка", message: text, preferredStyle: UIAlertController.Style.alert)
    let confirmAction = UIAlertAction(title: "Окей", style: UIAlertAction.Style.default, handler: completion)
    alert.addAction(confirmAction)

    viewController.present(alert, animated: true, completion: nil)
}
