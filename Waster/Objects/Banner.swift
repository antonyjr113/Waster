//
//  Banner.swift
//  Waster
//
//  Created by Don Wolfton on 1.12.24.
//

import SwiftUI

struct Banner: View {
    
    @State private var isTrial = false
    
    var body: some View {
        
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            VStack {
                HStack(alignment: .center) {
                    Text("Try Pro Version!")
                        .font(.system(size: 34))
                }

                HStack {
                    Text("Feature 1 - helps you do 1st thing")
                        .padding()
                    
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .padding()
                }
                .padding()
                HStack {
                    Text("Feature 2 - helps you do 2nd thing")
                        .padding(.leading, 30)
                    
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .padding(.trailing, 30)
                }
                HStack {
                    Text("Feature 3 - helps you do 3rd thing")
                        .padding()
                    
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .padding()
                }
                .padding()
                
                HStack {
                    Text("Feature 4 - helps you do 4th thing")
                        .padding(.leading, 30)
                    
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .padding(.trailing, 30)
                }
            }
            .padding(.bottom, 350)
            
            VStack {

                Toggle(isOn: $isTrial) {
                    Text("Trial available")
                        .font(.headline)
                        
                }
                .padding()
                .border(.blue, width: 3)
                
                HStack(alignment: .center) {
                    Text("Week")
                        .font(.headline)
                        .padding()
                    Spacer()
                    Text("7.99$")
                        .font(.headline)
                        .padding()
                }
                .border(.blue, width: 3)
                

                HStack {
                    Text("Year")
                        .font(.headline)
                        .padding()
                    Spacer()
                    Text("39.99$")
                        .font(.headline)
                        .padding(.trailing)
                }
                .border(.blue, width: 3)

            }

            .padding(.top, 300)
            
            Button("Continue"){
                
            }
            .buttonStyle(.borderedProminent)
            .font(Font.title)
            .padding(.top, 650)

        }
    }
}

#Preview {
    Banner()
}
