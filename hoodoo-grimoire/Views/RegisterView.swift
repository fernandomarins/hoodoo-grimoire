//
//  RegisterView.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 23/12/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    @State private var email = ""
    @State private var password = ""
    @State private var checkPassword = ""
    @State private var alertMessage = ""
    @State private var isLoading: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var passwordsMatch: Bool { password == checkPassword }
    
    var body: some View {
        NavigationView {
            VStack() {
                Image("logo.png")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                
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
                    isLoading.toggle()
                    viewModel.registerUser(email: email, password: password) { registered, errorMesssage in
                        if registered {
                            dismiss()
                            isLoading.toggle()
                        } else {
                            isLoading.toggle()
                            alertMessage = errorMesssage ?? String()
                        }
                    }
                }) {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(2.0, anchor: .center)
                    } else {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.darkPurple)
                            .cornerRadius(15.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                    }
                }
                .padding(.top, 27.5)
                .disabled(!passwordsMatch)
                
                HStack(alignment: .center) {
                    Text(alertMessage)
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 200)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 25)
                
                Spacer()
                
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.darkPurple, .mediumPurple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .accentColor(.white)
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
