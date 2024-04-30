//
//  AddDriver.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct AddDriver: View {

    @StateObject var viewModel: GarageViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(width: 50, height: 6)
                
                ZStack {
                    
                    Text("Add driver")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            back.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .padding(4)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("primary")))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.vertical)
                .padding(.bottom, 20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                        VStack(alignment: .leading, spacing: 14) {
                            
                            Text("Driver")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Expample")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.driverName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.driverName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)

                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.names.append(viewModel.driverName)
                    
                    viewModel.driverName = ""

                    withAnimation(.spring()) {
                        
                        back.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                })
                .opacity(viewModel.driverName.isEmpty ? 0.5 : 1)
                .disabled(viewModel.driverName.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddDriver(viewModel: GarageViewModel())
}
