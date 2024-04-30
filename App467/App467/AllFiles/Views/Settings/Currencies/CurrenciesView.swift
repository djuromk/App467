//
//  CurrenciesView.swift
//  App467
//
//  Created by IGOR on 18/04/2024.
//

import SwiftUI

struct CurrenciesView: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Currencies")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Button(action: {
                        
                        back.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    })
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 15) {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currentCurrency = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isGraphic = true
                                }
                                
                            }, label: {
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text(index)
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing) {
                                            
                                            Text("\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                                                .foregroundColor(.black)
                                                .font(.system(size: 18, weight: .semibold))
                                            
                                            HStack {
                                                
                                                Text("+\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))$")
                                                    .foregroundColor(.green)
                                                    .font(.system(size: 11, weight: .regular))
                                                
                                                Text("(\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))%)")
                                                    .foregroundColor(.green)
                                                    .font(.system(size: 11, weight: .regular))
                                            }
                                        }
                                    }
                                   
                                    Rectangle()
                                        .fill(.gray.opacity(0.6))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 1)
                                    
                                }
                            })
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                }
                
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isGraphic, content: {
            
            GraphicView(viewModel: viewModel)
        })
    }
}

#Preview {
    CurrenciesView(viewModel: HomeViewModel())
}
