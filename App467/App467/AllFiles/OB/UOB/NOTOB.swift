//
//  NOTOB.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct NOTOB: View {
    
    @AppStorage("status") var status: Bool = false
    
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
                
                Image("NOTOB")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 15) {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                            .padding(6)
                            .background(Circle().fill(.gray.opacity(0.8)))
                    })
                }
                
                Text("Don’t miss anything")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Enable Notifications")
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
    NOTOB()
}
