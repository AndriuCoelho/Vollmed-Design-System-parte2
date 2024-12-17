//
//  SignInView.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 04/09/23.
//

import SwiftUI
import VollmedUI

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    
    let service = WebService()
    var authManager = AuthenticationManager.shared
    
    func login() async {
        do {
            if let response = try await service.loginPatient(email: email, password: password) {
                authManager.saveToken(token: response.token)
                authManager.savePatientID(id: response.id)
            } else {
                self.showAlert = true
            }
        } catch {
            print("Ocorreu um erro no login: \(error)")
            self.showAlert = true
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)
                .padding(.vertical)
            
            Text("Olá!")
                .titleLBoldStyle()
            
            Text("Preencha para acessar sua conta.")
                .titleMdRegularStyle()
            
            Text("Email")
                .titleMdBoldStyle()
            
            TextField("Insira seu email", text: $email)
                .padding(14)
                .background(.gray.opacity(0.25))
                .cornerRadius(14.0)
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
            
            Text("Senha")
                .titleMdBoldStyle()
            
            SecureField("Insira sua senha", text: $password)
                .padding(14)
                .background(.gray.opacity(0.25))
                .cornerRadius(14.0)
            
            Button {
                Task {
                    await login()
                }
            } label: {
                Text("Entrar")
            }.buttonStyle(ConfirmPrimaryButtonStyle())
            
            NavigationLink {
                SignUpView()
            } label: {
                Text("Ainda não possui uma conta? Cadastre-se.")
                    .bodyRegularStyle()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Ops, algo deu errado!"), message: Text("Houve um erro ao entrar na sua conta. Por favor tente novamente."))
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
