//
//  HeaderView.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 29.09.2023.
//

import SwiftUI


struct HeaderView: View {
    
    let colors: [Color] =
       [.red, .orange, .purple, .green, .yellow, .blue,]

    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.cyan)
                .rotationEffect(Angle(degrees: -10))
            HStack {
                ForEach(colors.indices, id: \.self) {
                    Rectangle()
                        .fill(colors[$0])
                        .frame(width: 100, height: 100)
                        .offset(x: CGFloat($0) * 15.0,
                                y: CGFloat($0) * 15.0)
                }
            }.padding([.bottom, .top], 160)
            VStack{
                Text("My Planner")
                    .foregroundColor(Color.white)
                    .font(.system(size: 50))
                    .bold()
                Text("Get Things Done")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }.padding(.top, 280)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
