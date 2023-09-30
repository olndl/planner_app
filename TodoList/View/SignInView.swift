import SwiftUI

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
            VStack{
                // Header
                VStack{
                    HeaderView(title: "My Planner", subtitle: "Get Things Done", backgroundColor: Color.teal, cornerRadius: 0, angle: -15)
                }
                // SignIn form
                Form{
                    TextField("Email", text: $email).textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    CustomButtonView(title: "Sign In", backgroundColor: .blue, action: {
                        //sign in
                    })
            
                }
                .cornerRadius(12)
                .frame(width: UIScreen.main.bounds.width - 20, height: 300)
                .offset(y: -100)
                // create account
                VStack{
                    Text("New around here?")

                    NavigationLink("Create an account", destination: SignUpView())

                }.padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
