import SwiftUI


struct HeaderView: View {

    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color.teal)
            VStack{
                Text("My Planner")
                    .foregroundColor(Color.white)
                    .font(.system(size: 50))
                    .bold()
                Text("Get Things Done")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }.padding(.top, 15)
            
        }
        .frame(width: UIScreen.main.bounds.width - 20, height: 250)
        .offset(y: -30)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
