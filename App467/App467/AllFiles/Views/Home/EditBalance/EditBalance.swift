//
//  EditBalance.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct EditBalance: View {

    @StateObject var viewModel: HomeViewModel
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
                    
                    Text("Edit Balance")
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
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Balance")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            ZStack(alignment: .leading, content: {
                                
                                Text("Expample")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.addBalance.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.addBalance)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))

                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)

                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                        
                        VStack(alignment: .leading) {
                            
                            Text("Change")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.addChange.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.addChange)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))

                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)

                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                        
                        VStack(alignment: .leading) {
                            
                            Text("Direction")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            Menu(content: {
                                
                                ForEach(viewModel.directions, id: \.self) { index in
                                    
                                Button(action: {
                                    
                                    viewModel.currentDirection = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentDirection.isEmpty {
                                    
                                    HStack {
                                        
                                        Text("Choose")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                    
                                } else {
                                    
                                    HStack {
                                        
                                        Text(viewModel.currentDirection)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 16, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                }
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                    }
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
            
                Button(action: {
                                        
                    viewModel.dir = viewModel.currentDirection
                    viewModel.balance = viewModel.addBalance
                    viewModel.change = viewModel.addChange

                    viewModel.addBalance = ""
                    viewModel.addChange = ""
                    viewModel.currentDirection = ""

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
                .opacity(viewModel.currentDirection.isEmpty || viewModel.addBalance.isEmpty || viewModel.addChange.isEmpty ? 0.5 : 1)
                .disabled(viewModel.currentDirection.isEmpty || viewModel.addBalance.isEmpty || viewModel.addChange.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    EditBalance(viewModel: HomeViewModel())
}
