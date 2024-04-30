//
//  LodingView.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct LodingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("bgg")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Image("logoob")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LodingView()
}
