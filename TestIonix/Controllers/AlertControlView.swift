//
//  AlertControlView.swift
//  TestIonix
//
//  Created by Ludin Jozabeth on 24-04-21.
//

import SwiftUI

var respViewModel : UserViewModel!
var user: Item!
var alert2 : UIAlertController!

struct AlertControlView: UIViewControllerRepresentable {
    
    @State private var isVisibleRut  = false
    @Binding var textString: String
    @Binding var showAlert: Bool
    @Binding var showAlertRut: Bool
    @Binding var name: String
    @Binding var email: String
    @Binding var phone: String
    
    var title: String
    var message: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AlertControlView>) -> UIViewController {
        return UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<AlertControlView>) {
        guard context.coordinator.alert == nil else { return }
        
        if self.showAlert {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            context.coordinator.alert = alert
            alert.addTextField { textField in
                textField.placeholder = "Ingrese su RUT"
                textField.text = textString
                textField.delegate = context.coordinator
            }
            
            alert.addAction(UIAlertAction(title: NSLocalizedString("Aceptar", comment: ""), style: .default) { _ in
                isVisibleRut = true
                if let textField = alert.textFields?.first, let text = textField.text {
                    textString = text
                    let encript = CryptDES()
                    let rutEncrypt = encript.methodToCallEncryption(stringToEncrypt: text)
                    print("rutEncrypt", rutEncrypt)
                    UserDefaults.standard.set(rutEncrypt, forKey: "rutEncrypt")
                    
                    let x = RutViewModel()
                    x.callFuncToGetRUTUserData( completion: { (data) in
                        //print("x.findUser", data)
                        user = data
                        name = user.name ?? "--"
                        email = user.detail?.email ?? ""
                        phone = user.detail?.phoneNumber ?? ""
                        showAlertRut = true
                    })
                }
                
                alert.dismiss(animated: true) {
                    self.showAlert = false
                }
            })
            
            DispatchQueue.main.async {
                uiViewController.present(alert, animated: true, completion: {
                    self.showAlert = false
                    context.coordinator.alert = nil
                })
                
            }
        }
    }
    
    func makeCoordinator() -> AlertControlView.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var alert: UIAlertController?
        var control: AlertControlView
        
        init(_ control: AlertControlView) {
            self.control = control
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let text = textField.text as NSString? {
                control.textString = text.replacingCharacters(in: range, with: string)
            } else {
                control.textString = ""
            }
            return true
        }
    }

    
    
}
