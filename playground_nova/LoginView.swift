//
//  lLoginView.swift
//  playground_nova
//
//  Created by Richard Menning on 17.12.21.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("E-Mail")
                TextField("E-Mail", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            VStack(alignment: .leading) {
                Text("Passwort")
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button("Einloggen") {
                print("Einloggen…")
            }
            .padding()
            
        }
        .textFieldStyle (RoundedBorderTextFieldStyle())
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
