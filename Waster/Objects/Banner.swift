//
//  Banner.swift
//  Waster
//
//  Created by Don Wolfton on 1.12.24.
//

import SwiftUI

struct Banner: View {
    
    var body: some View {
        
        ZStack {
            Color.green
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Feature 1")
                        .padding(.leading, 30)
                    
                    Spacer()
                    
                    Text("Feature 2")
                        .padding(.trailing, 30)
                }
                .padding()
                HStack {
                    Image(systemName: "star.fill")
                        .padding(.leading, 55)
                    
                    Spacer()
                    Image(systemName: "star.fill")
                        .padding(.trailing, 55)
                }
            }
            .padding(.top, -350)
            
            Spacer()
            
            HStack(alignment: .center) {
                Text("Try Pro Version!")
                    .font(.system(size: 34))
            }
        
            Spacer()
            
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                        .padding(.leading, 55)
                    Spacer()
                    Image(systemName: "star.fill")
                        .padding(.trailing, 55)
                }
                .padding()
                HStack {
                    Text("Feature 3")
                        .padding(.leading, 50)
                    Spacer()
                    Text("Feature 4")
                        .padding(.trailing, 50)
                }
            }
            .padding(.top, 500)
            

        }
    }
}

#Preview {
    Banner()
}
