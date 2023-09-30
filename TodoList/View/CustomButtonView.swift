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
                    .foregroundColor(Color.white)
                    .bold()
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
