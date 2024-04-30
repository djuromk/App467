//
//  Rev1.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct Rev1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("bgg")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Image("ROB1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 15) {
                
                HStack {
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("primary"))
                        .frame(width: 100, height: 7)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 100, height: 7)
                }
                
                Text("Explore your taxi business data")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Rev2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("primary")))
                })
                
            }
            .padding()
        }
    }
}

#Preview {
    Rev1()
}
