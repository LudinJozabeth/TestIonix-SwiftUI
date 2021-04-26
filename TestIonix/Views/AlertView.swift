//
//  AlertView.swift
//  TestIonix
//
//  Created by Ludin Jozabeth on 25-04-21.
//

import SwiftUI

struct AlertView: UIViewControllerRepresentable {
    
    @State private var isVisible  = false
    @Binding var showAlert: Bool
    
    var title: String
    var message: String
    
    
    func makeUIViewController(context: UIVerRepresentableContext<AlertView>) -> UIViewController {
        return UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<AlertView>) {
        print("--->>> ",self.showAlert)
        guard context.coordinator.alert == nil else { return }
        let alert2 = UIAlertController(title: title , message: message, preferredStyle: .alert)
        context.coordinator.alert = alert2
        alert2.addAction(UIAlertAction(title: NSLocalizedString("Aceptar", comment: ""), style: .default) { _ in
            isVisible = true
            alert2.dismiss(animated: true) {
                self.showAlert = false
            }
        })
        
        DispatchQueue.main.async {
            uiViewController.present(alert2, animated: true, completion: {
                self.showAlert = false
                context.coordinator.alert = nil
            })
            
        }
    }
    
    func makeCoordinator() -> AlertView.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var alert: UIAlertController?
        var control: AlertView
        
        init(_ control: AlertView) {
            self.control = control
        }
        
    }
}
