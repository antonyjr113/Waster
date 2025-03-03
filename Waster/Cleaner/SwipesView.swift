//
//  SwipesView.swift
//  Waster
//
//  Created by Don Wolfton on 24.02.25.
//

import SwiftUI

struct SwipesView: View {

    var body: some View {

        HStack {
            VStack {
                Text("35% Sorted")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 105, height: 10)
                        .cornerRadius(5)
                    Rectangle()
                        .fill(.green)
                        .frame(width: 31.5, height: 10)
                        .cornerRadius(5)
                }
            }
            .padding(.leading, 20)
            Spacer()
            ZStack(alignment: .center) {
                Rectangle()
                    .fill(.gray)
                    .cornerRadius(6)
                    .frame(width: 155, height: 40)
                    .padding(.trailing, 16)
                Image(systemName: "trash")
                    .foregroundStyle(.red)
                    .frame(width: 30, height: 30)
                    .padding(.leading, -80)
                VStack(alignment: .leading) {
                    Text("Archived:")
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .padding(.top, 3)
                    Text("Files: : MB")
                        .padding(.bottom, 3)
                }
            }
        }
        .padding(.top, 20)
        HStack {
            Text("2024")
                .fontWeight(.semibold)
                .font(.system(size: 20))
                .padding(.leading, 20)
            Spacer()
            ZStack(alignment: .center) {
                Circle()
                    .foregroundStyle(.gray)
                    .frame(width: 40)
                Image(systemName: "text.aligncenter")
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                    .foregroundStyle(.blue)
            }
            .padding(.trailing, 16)
        }
        .padding(.top, 20)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<7) {_ in
                    Image("first")
                        .resizable()
                        .cornerRadius(15)
                        .frame(width: 140, height: 190)
                        //.border(.blue)
                }
            }
            .padding(.leading, 20)
        }
        .padding(.top, 10)
        Spacer()
        VStack {
            Text("Tools")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding(.leading, -175)
            HStack(spacing: 25) {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 100, height: 60)
                        .cornerRadius(5)
                    VStack {
                        Image(systemName: "arrow.left.arrow.right")
                            .frame(width: 20, height: 20)
                            .cornerRadius(15)
                            .fontWeight(.semibold)
                            .padding(.trailing, 30)
                            .foregroundStyle(.blue)
                        Text("Random")
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                            .padding(.leading, 10)
                    }
                }
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 100, height: 60)
                        .cornerRadius(5)
                    VStack {
                        Image(systemName: "clock")
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.blue)
                            .cornerRadius(15)
                            .fontWeight(.semibold)
                            .padding(.trailing, 30)
                        Text("Recents")
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                            .padding(.leading, 10)
                    }
                }
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 100, height: 60)
                        .cornerRadius(5)
                    VStack {
                        Image(systemName: "viewfinder")
                            .frame(width: 20, height: 20)
                            .cornerRadius(15)
                            .fontWeight(.semibold)
                            .padding(.trailing, 30)
                            .foregroundStyle(.blue)
                        Text("Random")
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                            .padding(.leading, 10)
                    }
                }
            }
        }
        .padding(.top, 20)
        VStack {
            Text("AI Sorted")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding(.top, 20)
                .padding(.leading, -175)
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(0..<7) {_ in
                        VStack {
                            Image("second")
                                .resizable()
                                .frame(width: 100, height: 100)
                            //.border(.black)
                                .cornerRadius(10)
                                .padding(.top, 40)
                            Text("AI")
                                .fontWeight(.semibold)
                        }
                    }
                }
                .padding(.leading, 20)
                .padding(.top, -40)
            }
        }
        TabView {
//                .tabItem {
//                    Label("Menu", systemImage: "list.dash")
//                }
        }
    }
}

#Preview {
    SwipesView()
}
