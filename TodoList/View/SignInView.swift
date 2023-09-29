import SwiftUI

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
            VStack{
                // Header
                HeaderView()
                // SignIn form
                Form{
                    TextField("Email", text: $email).textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Button{
                        
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue)
                            Text("Sign In")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                }
                // create account
                VStack{
                    Text("New around here?")
                    
                    NavigationLink("Crerate an account", destination: SignUpView())
                    
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
