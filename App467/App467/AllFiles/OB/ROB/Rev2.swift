//
//  Rev2.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct Rev2: View {
    
    @AppStorage("status") var status: Bool = true
    
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
                
                Image("ROB2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 15) {
                
                HStack {

                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 100, height: 7)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("primary"))
                        .frame(width: 100, height: 7)
                    
                }
                
                Text("Keep your cars and drivers in one safe space")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    Rev2()
}
