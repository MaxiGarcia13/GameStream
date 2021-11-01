//
//  ContentView.swift
//  GameStream
//
//  Created by Maxi Garcia on 30/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color("Dark-blue").ignoresSafeArea()
            
            VStack {
                
                Image("04_swiftui-apps-ios-logo-name").resizable().aspectRatio( contentMode: .fit).frame(width:250)
                
                SignInOrSignUpView()
                
            }.padding()
        }
    }
}

struct SignInOrSignUpView: View {
    
    @State var isSignInView = true
    
    var body: some View {
        if isSignInView == true {
            SignInView().padding(.top)
        } else {
            SignUpView().padding(.top)
        }
        
        
        if isSignInView == true {
            Button(action: {
                isSignInView = false
            }, label: {
                Text("I don't have an account, ")
                Text("Sign up")
                    .bold().foregroundColor(Color("dark-cian"))
            })
                .foregroundColor( Color("ligth-gray"))
                .frame(maxWidth: .infinity)
                .font(.body)
        } else {
            Button(action: {
                isSignInView = true
            }, label: {
                Text("I have an account, ")
                Text("Sign in").bold().foregroundColor(Color("dark-cian"))
            })
                .foregroundColor(Color("ligth-gray"))
                .frame(maxWidth: .infinity)
                .font(.body)
        }
        
        
    }
}

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ScrollView {
            
            CTextField(
                label: "📧 E-mail:",
                value: $email,
                placeHolder: "example@example.com",
                type: .email
                
            )
            
            CTextField(
                label: "🔑 Password:",
                value: $password,
                placeHolder: "********",
                type: .securePassword
            )
            
            
            Text("Are you forget your password?").foregroundColor(Color("dark-cian")).frame(maxWidth: .infinity, alignment: .trailing).padding(.bottom).font(.footnote)
            
            CButton(label: "Sign in", action: signIn)
            
            Text("Or").foregroundColor(Color("ligth-gray")).padding()
            
            HStack {
                CButton(label: "Github", action: signIn, type: .secondary).padding(.trailing)
                
                CButton(label: "Twitter", action: signIn, type: .secondary).padding(.leading)
            }
        }
    }
}

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @State var repassword = ""
    
    var body: some View {
        ScrollView {
            
            Text("Choose your image").foregroundColor(Color("ligth-gray"))
            Text("You can chage the image later").foregroundColor(.gray).font(.footnote)
                .padding(.bottom)
            
            Button (action: takePhoto, label: {
                ZStack {
                    Image("fotografia")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    Image("camera")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                }
            }).padding(.bottom)
            
            
            
            CTextField(
                label: "📧 E-mail:",
                value: $email,
                placeHolder: "example@example.com",
                type: .email
                
            )
            
            CTextField(
                label: "🔑 Password:",
                value: $password,
                placeHolder: "********",
                type: .securePassword
            )
            
            CTextField(
                label: "🧐 Re enter Password:",
                value: $repassword,
                placeHolder: "********",
                type: .securePassword
            )
            
            CButton(label: "Sign up", action: signIn).padding(.top)
            
            Text("Or").foregroundColor(Color("ligth-gray")).padding()
            
            HStack {
                CButton(label: "Github", action: signIn, type: .secondary).padding(.trailing)
                
                CButton(label: "Twitter", action: signIn, type: .secondary).padding(.leading)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func signIn() {
    print("Hola")
}

func takePhoto () {
    
}
