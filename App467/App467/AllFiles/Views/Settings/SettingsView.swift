//
//  SettingsView.swift
//  App467
//
//  Created by IGOR on 18/04/2024.
//

import SwiftUI
import CoreData
import StoreKit

struct SettingsView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    @State var isReset: Bool = false
    
    @AppStorage("balance") var balance: String = ""
    @AppStorage("change") var change: String = ""
    @AppStorage("dir") var dir = ""
    @AppStorage("TR") var TR: String = ""
    @AppStorage("TE") var TE: String = ""
    @AppStorage("NP") var NP: String = ""
    @AppStorage("names") var names: [String] = []
    @AppStorage("TC") var TC: String = ""
    @AppStorage("TD") var TD: String = ""

    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 10) {
                    
                    HStack {
                        
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .padding(8)
                            .background(Circle().fill(Color("primary")))
                            .padding(3)
                            .background(Circle().fill(Color("primary2")))
                        
                        Text("Settings")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isCurrencies = true
                            }
                            
                        }, label: {
                            
                           Image(systemName: "dollarsign")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .padding(8)
                                .padding(.horizontal, 7)
                                .background(Circle().fill(Color("primary")))
                                .padding(3)
                                .background(Circle().fill(Color("primary2")))
                        })
                    }
                    .padding(.bottom, 30)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            isReset = true
                        }
                        
                    }, label: {
                        
                        Text("Reset progress")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("primary")))
                    })
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("primary").opacity(0.1)))
                
                VStack(alignment: .leading, spacing: 20) {

                    Button(action: {}, label: {
                        
                        Text("Usage Policy")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    })
                    
                    Rectangle()
                        .fill(.gray.opacity(0.6))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                    
                    Button(action: {}, label: {
                        
                        Text("Rate App")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                
                Spacer()
            }
            .padding()
            .overlay(
                
                ZStack {
                    
                    Color.black.opacity(isReset ? 0.5 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                        }
                    
                    VStack {
                        
                        HStack {
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    isReset = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                        }
                        
                        Text("Reset progress")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                            .padding()
                        
                        Text("Are you sure you want to reset progress?")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteAllData()
                            
                            TR = ""
                            TE = ""
                            TC = ""
                            TD = ""
                            NP = ""
                            names.removeAll()
                            balance = ""
                            change = ""
              
                            withAnimation(.spring()) {
                                
                                isReset = false
                                
                            }
                                    
                        }, label: {
                            
                            Text("Reset")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        .padding(.top, 25)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Text("Close")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.black))
                    .padding()
                    .offset(y: isReset ? 0 : UIScreen.main.bounds.height)
                }
            )
            .sheet(isPresented: $viewModel.isCurrencies, content: {
                
                CurrenciesView(viewModel: viewModel)
            })
        }
    }
}

#Preview {
    SettingsView()
}
