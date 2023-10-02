//
//  CustomButtonView.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 30.09.2023.
//

import SwiftUI

struct CustomButtonView: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    var body: some View {
        Button{
           action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundColor(backgroundColor)
                Text(title)
                    .bold()
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(Color("Primary"))
                    .cornerRadius(6)
                    .shadow(color: Color("Primary").opacity(0.8), radius: 6, x: 1, y: 1)
            }
        }
        .padding()
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(title: "Title", backgroundColor: .blue) {
            // action
        }
    }
}
