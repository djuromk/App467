//
//  TabBar.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color.white : Color.gray)
                            .frame(height: 22)
                            .padding()
                            .background(Circle().fill(Color("primary").opacity(selectedTab == index ? 1 : 0)))

                    })
                })
                .padding(.horizontal, 6)
            }
        }
        .padding()
        .padding(.horizontal)
        .background(RoundedRectangle(cornerRadius: 50).fill(.white))
        .padding()
    }
}

enum Tab: String, CaseIterable {
    
    case Home = "Home"
    case Garage = "Garage"
    case Settings = "Settings"
    
}
