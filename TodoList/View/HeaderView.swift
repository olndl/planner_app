import SwiftUI


struct HeaderView: View {
    let title: String
    let subtitle: String
    let backgroundColor: Color
    let cornerRadius: Double
    let angle: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .rotationEffect(Angle(degrees: angle))
                .foregroundColor(backgroundColor)
            VStack{
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.system(size: 50))
                    .bold()
                Text(subtitle)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }.padding(.top, 130)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -200)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", backgroundColor: .blue, cornerRadius: 0, angle: -15)
    }
}
