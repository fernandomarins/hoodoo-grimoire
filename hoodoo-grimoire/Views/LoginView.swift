//
//  LoginView.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 23/12/23.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Propertiers
    @State private var email = ""
    @State private var password = ""
    @State private var isRootViewPresented = false
    @State private var isRegisterViewPresented = false
    
    var viewModel = LoginViewModel()
    
    // MARK: - View
    var body: some View {
        VStack() {
            Text("Gimório Hoodoo")
                .font(.largeTitle).foregroundColor(Color.white)
                .padding([.top, .bottom], 40)
                .shadow(radius: 10.0, x: 20, y: 10)
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
            }
            .padding([.leading, .trailing], 27.5)
            
            Button(action: {
                viewModel.login(email: email, password: password) { proceed in
                    if proceed {
                        isRootViewPresented.toggle()
                    }
                }
            }) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.darkPurple)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }
            .padding(.top, 50)
            .fullScreenCover(isPresented: $isRootViewPresented) {
                RootView()
            }
            
            Spacer()
            HStack(spacing: 0) {
                Text("Don't have an account? ")
                    .foregroundColor(.white)
                Button(action: {
                    isRegisterViewPresented.toggle()
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                }
                .fullScreenCover(isPresented: $isRegisterViewPresented) {
                    RegisterView()
                }
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.darkPurple, .mediumPurple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    LoginView()
}
