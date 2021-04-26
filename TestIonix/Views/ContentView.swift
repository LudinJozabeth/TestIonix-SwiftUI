//
//  ContentView.swift
//  TestIonix
//
//  Created by Ludin Jozabeth on 22-04-21.
//

import SwiftUI
import FASwiftUI

struct ContentView: View {
    
    @State var showAlert = false
    @State var customerID = ""
    @State private var isVisibleRut  = false
    @State var name = ""
    @State var email = ""
    @State var phone = ""
    
    @State private var isVisible  = false
    
    var body: some View {
        ZStack{
            Image("fondo")
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            VStack(alignment: .center) {
                Text("Bienvenid@\n \(name)").fontWeight(.semibold).foregroundColor(.black).font(.headline).multilineTextAlignment(.center)
                Spacer()
                
                VStack{
                    HStack {
                        Button(action: {
                            showAlert = true
                            print("Pagar tapped!")
                            (customerID.count != 0) ?
                                print("customerID \(customerID)") : nil
                        }) {
                            HStack {
                                VStack {
                                    FAText(iconName: "fa-dollar-sign", size: 25)
                                    Text("Pagar")
                                        .fontWeight(.light)
                                        .font(.footnote)
                                }
                            }.frame(width: 65)
                        }.padding()
                        .background(Color(.white))
                        .opacity(0.6)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .alert(isPresented: $isVisibleRut, content: {
                            callToUsersViewModel()
                            return Alert(title: Text("\(name)"), message: Text("\(email) \(phone)"), dismissButton: .default(Text("Aceptar")))
                        })
                        if showAlert {
                            AlertControlView(textString: $customerID,
                                             showAlert: $showAlert,
                                             showAlertRut: $isVisibleRut,
                                             name: $name,
                                             email: $email,
                                             phone: $phone,
                                             title: "Hola",
                                             message: "Ingrese su RUT")
                            
                        }
                        
                        Button(action: {
                            isVisible = true
                            print("Billetera tapped!")    
                        }) {
                            HStack {
                                VStack {
                                    FAText(iconName: "fa-wallet", size: 25)
                                    Text("Billetera")
                                        .fontWeight(.light)
                                        .font(.footnote)
                                }
                            }.frame(width: 65)
                        }.padding()
                        .background(Color(.white))
                        .opacity(0.6)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .alert(isPresented: $isVisible, content: {
                            callToUsersViewModel()
                            return Alert(title: Text(""), message: Text(""), dismissButton: .default(Text("Aceptar")))
                        })
                        Button(action: {}) {
                            HStack {
                                VStack {
                                    FAText(iconName: "fa-map-marked-alt", size: 25)
                                    Text("Estaciones")
                                        .fontWeight(.light)
                                        .font(.footnote)
                                }
                            }.frame(width: 95)
                        }.padding(.vertical)
                        .background(Color(.white))
                        .opacity(0.6)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                    }
                    
                    HStack {
                        Button(action: {}) {
                            HStack {
                                VStack {
                                    FAText(iconName: "fa-tag", size: 25)
                                    Text("Beneficios")
                                        .fontWeight(.light)
                                        .font(.footnote)
                                }
                            }.frame(width: 65)
                        }.padding()
                        .background(Color(.white))
                        .opacity(0.6)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        Button(action: {}) {
                            HStack {
                                VStack {
                                    FAText(iconName: "fa-envelope", size: 25)
                                    Text("Mensajes")
                                        .fontWeight(.light)
                                        .font(.footnote)
                                }
                            }.frame(width: 65)
                        }.padding()
                        .background(Color(.white))
                        .opacity(0.6)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        Button(action: {}) {
                            HStack {
                                VStack {
                                    FAText(iconName: "fa-cog", size: 25)
                                    Text("Configuración")
                                        .fontWeight(.light)
                                        .font(.footnote)
                                }
                            }.frame(width: 95)
                        }.padding(.vertical)
                        .background(Color(.white))
                        .opacity(0.6)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                    }
                }
                
            }.padding(.vertical, 30.0)
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func callToUsersViewModel(){
    respViewModel =  UserViewModel()
    respViewModel.callFuncToGetUsersData( completion: { (data) in
        print("HERE",data)
    })
}



