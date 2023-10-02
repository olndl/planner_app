//
//  VerificationView.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 02.10.2023.
//


import SwiftUI

struct VerificationView: View {
    
    @ObservedObject var viewModel: LoginViewViewModel
    
    @State var countPin = 6
    @State var currentFocus = 0
    
    @State var pin1 = ""
    @State var pin2 = ""
    @State var pin3 = ""
    @State var pin4 = ""
    @State var pin5 = ""
    @State var pin6 = ""
    
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack {
            
            Text("Verification")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Enter the OTP send to \(Text(viewModel.phoneNumber).fontWeight(.bold).foregroundColor(.black))")
                .font(.callout)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack {
                
                TextField("-", text: $pin1)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(1)
                    .frame(maxWidth: 50, maxHeight: 50, alignment: .center)
                    .multilineTextAlignment(.center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Color.gray.opacity(0.1), lineWidth: 2, antialiased: true)
                    )
                    .keyboardType(.numberPad)
                    .onChange(of: pin1, perform: { value in
                        if value.count > 0 {
                            currentFocus += 1
                        }
                    })
                    .onTapGesture {
                        currentFocus = 0
                    }
                
                TextField("-", text: $pin2)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(1)
                    .frame(maxWidth: 50, maxHeight: 50, alignment: .center)
                    .multilineTextAlignment(.center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Color.gray.opacity(0.1), lineWidth: 2, antialiased: true)
                    )
                    .keyboardType(.numberPad)
                    .onChange(of: pin2, perform: { value in
                        if value.count > 0 {
                            currentFocus += 1
                        }
                    })
                    .onTapGesture {
                        currentFocus = 1
                    }
                
                TextField("-", text: $pin3)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(1)
                    .frame(maxWidth: 50, maxHeight: 50, alignment: .center)
                    .multilineTextAlignment(.center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Color.gray.opacity(0.1), lineWidth: 2, antialiased: true)
                    )
                    .keyboardType(.numberPad)
                    .onChange(of: pin3, perform: { value in
                        if value.count > 0 {
                            currentFocus += 1
                        }
                    })
                    .onTapGesture {
                        currentFocus = 2
                    }
                
               TextField("-", text: $pin4)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(1)
                    .frame(maxWidth: 50, maxHeight: 50, alignment: .center)
                    .multilineTextAlignment(.center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Color.gray.opacity(0.1), lineWidth: 2, antialiased: true)
                    )
                    .keyboardType(.numberPad)
                    .onChange(of: pin4, perform: { value in
                        if value.count > 0 {
                            currentFocus += 1
                        }
                    })
                    .onTapGesture {
                        currentFocus = 3
                    }
                
                TextField("-", text: $pin5)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(1)
                    .frame(maxWidth: 50, maxHeight: 50, alignment: .center)
                    .multilineTextAlignment(.center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Color.gray.opacity(0.1), lineWidth: 2, antialiased: true)
                    )
                    .keyboardType(.numberPad)
                    .onChange(of: pin5, perform: { value in
                        if value.count > 0 {
                            currentFocus += 1
                        }
                    })
                    .onTapGesture {
                        currentFocus = 4
                    }
                
                TextField("-", text: $pin6)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(1)
                    .frame(maxWidth: 50, maxHeight: 50, alignment: .center)
                    .multilineTextAlignment(.center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Color.gray.opacity(0.1), lineWidth: 2, antialiased: true)
                    )
                    .keyboardType(.numberPad)
                    .onChange(of: pin6, perform: { value in
                        if value.count > 0 {
                            currentFocus += 1
                        }
                    })
                    .onTapGesture {
                        currentFocus = 5
                    }
                
            }.padding()
            
            HStack {
                Text("Don't receive the OTP Code?")
                    .font(.callout)
                    .foregroundColor(.gray)
                
                Button(action: {}, label: {
                    Text("Resend OTP")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                })
            }
            
            
            CustomButtonView(title: "Verify", backgroundColor: .pink, action: {
                let code = pin1+pin2+pin3+pin4+pin5+pin6
                viewModel.verifyCode(code: code)
            }).frame(height: 100)
        }
        .frame(maxWidth: UIScreen.main.bounds.width / 1.2)
        .padding()
        .background(Color.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 25)
        )
        .shadow(color: Color.black.opacity(0.2), radius: 25, x: 1, y: 1)
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
