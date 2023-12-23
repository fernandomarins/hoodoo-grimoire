//
//  RegisterView.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 23/12/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    // MARK: - Propertiers
    @State private var email = ""
    @State private var password = ""
    @State private var checkPassword = ""
    
    var passwordsMatch: Bool { password == checkPassword }
    
    // MARK: - View
    var body: some View {
        VStack() {
            Text("Registre-se")
                .font(.largeTitle).foregroundColor(Color.white)
                .padding([.top, .bottom], 40)
                .shadow(radius: 10.0, x: 20, y: 10)
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                
                SecureField("Senha", text: $password)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                
                SecureField("Digite a senha novamente", text: $checkPassword)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                
            }
            .padding([.leading, .trailing, .bottom], 27.5)
            
            if !password.isEmpty && !checkPassword.isEmpty {
                PasswordMatchView(passwordsMatch: passwordsMatch)
            }
            
            Button(action: {
                viewModel.registerUser(email: email, password: password)
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.darkPurple)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }
            .padding(.top, 27.5)
            .disabled(!passwordsMatch)
            
            Spacer()

        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.darkPurple, .mediumPurple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    RegisterView()
}
