//
//  UOB.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct UOB: View {
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
                
                Image("UOB")
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
                
                Text("Buy and take profit")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    REOB()
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
    UOB()
}
