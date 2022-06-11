//
//  AlertsPresenting.swift
//  Pokemon
//
//  Created by ahmed abdalla on 11/06/2022.
//

import UIKit

protocol AlertsPresenting: UIViewController {
}

extension AlertsPresenting {
    func showAlert(title: String?, message: String?) {

        assert((title ?? message) != nil, "Title OR message must be passed in")

        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(ac, animated: true)
    }
   
    func addTextField(title: String?, actionTitle: String?,placeholder : String? ,completion: @escaping (_ text : String) -> Void){
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
    
        let action = UIAlertAction(title: actionTitle, style: .default) {(action) in
            completion(alert.textFields?.first?.text ?? "")
        }
        
        alert.addTextField { alertTextfield in
            alertTextfield.placeholder = placeholder
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}


