//
//  GarageView.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct GarageView: View {
    
    @StateObject var viewModel = GarageViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 10) {
                    
                    HStack {
                        
                        Image(systemName: "car.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .padding(8)
                            .background(Circle().fill(Color("primary")))
                            .padding(3)
                            .background(Circle().fill(Color("primary2")))
                        
                        Text("Garage")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Spacer()
                        
                        Menu(content: {
                            
                            ForEach(viewModel.addingType, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentAdding = index
                                    
                                    if index == "Car" {
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isAddCar = true
                                        }
                                        
                                    } else if index == "Driver" {
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isAddDriver = true
                                        }
                                    }
                                    
                                }, label: {
                                    
                                    Text(index)
                                    
                                })
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .padding(8)
                                .padding(.horizontal, 7)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                                .padding(3)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary2")))
                        })
                    }
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTC = true
                            }
                            
                        }, label: {
                            
                            VStack(alignment:. leading) {
                                
                                HStack {
                                    
                                    Image(systemName: "car")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(3)
                                        .background(RoundedRectangle(cornerRadius: 4).fill(Color("primary")))
                                    
                                    Text("Total cars")
                                        .foregroundColor(.black.opacity(0.7))
                                        .font(.system(size: 12, weight: .medium))
                                    
                                }
                                
                                Spacer()
                                
                                Text("\(viewModel.TC)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(color: .black.opacity(0.15), radius: 10))
                            .padding(1)
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTD = true
                            }
                            
                        }, label: {
                            
                            VStack(alignment:. leading) {
                                
                                HStack {
                                    
                                    Image(systemName: "person.2")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(3)
                                        .background(RoundedRectangle(cornerRadius: 4).fill(Color("primary")))
                                    
                                    Text("Total drivers")
                                        .foregroundColor(.black.opacity(0.7))
                                        .font(.system(size: 12, weight: .medium))
                                    
                                }
                                
                                Spacer()
                                
                                Text("\(viewModel.TD)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(color: .black.opacity(0.15), radius: 10))
                            .padding(1)
                        })
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("primary").opacity(0.1)))
                
                HStack {
                    
                    Text("Your cars")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Spacer()
                    
                }
                .padding(.vertical)
                
                if viewModel.cars.isEmpty {
                    
                    VStack(spacing: 15) {
                        
                        Text("Empty")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                        
                        Text("You don’t have any cars yet")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.cars, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selectedCar = index
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 15) {
                                        
                                        Text(index.carPlate ?? "")
                                            .foregroundColor(Color("primary2"))
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Text(index.carMarkModel ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading, spacing: 15) {
                                        
                                        Text("Status")
                                            .foregroundColor(Color.gray.opacity(0.7))
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Text(index.carStatus ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .semibold))
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                            })
                        }
                    }
                }
            }
            }
            .padding()
            .sheet(isPresented: $viewModel.isDetail, content: {
                
                CarDetail(viewModel: viewModel)
            })
            .overlay(
                
                ZStack {
                    
                    Color.black.opacity(viewModel.isTC ? 0.5 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTC = false
                            }
                        }
                    
                    VStack {
                        
                        HStack {
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isTC = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                        }
                        
                        Text("Total cars")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                            .padding()

                        ZStack(alignment: .leading, content: {
                            
                            Text("Total cars")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addTC.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addTC)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .semibold))

                        })
                        .padding(7)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 2).fill(.white))
                        
                        HStack {
                            
                            Button(action: {
      
                                withAnimation(.spring()) {
                                    
                                    viewModel.isTC = false
                                    
                                }
                                
                            }, label: {
                                
                                Text("Cancel")
                                    .foregroundColor(.red)
                                    .font(.system(size: 18, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                
                            })
                            
                            Button(action: {
                                
                                viewModel.TC = viewModel.addTC
                                
                                viewModel.addTC = ""
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isTC = false
                                }
                                
                            }, label: {
                                
                                Text("Save")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 18, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                
                            })
                        }
                    }
                    .frame(width: 300)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.7)))
                    .padding()
                    .offset(y: viewModel.isTC ? 0 : UIScreen.main.bounds.height)
                }
            )
            .overlay(
                
                ZStack {
                    
                    Color.black.opacity(viewModel.isTD ? 0.5 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTD = false
                            }
                        }
                    
                    VStack {
                        
                        HStack {
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isTD = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                        }
                        
                        Text("Total drivers")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                            .padding()

                        ZStack(alignment: .leading, content: {
                            
                            Text("Total drivers")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addTD.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addTD)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .semibold))

                        })
                        .padding(7)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 2).fill(.white))
                        
                        HStack {
                            
                            Button(action: {
      
                                withAnimation(.spring()) {
                                    
                                    viewModel.isTD = false
                                    
                                }
                                
                            }, label: {
                                
                                Text("Cancel")
                                    .foregroundColor(.red)
                                    .font(.system(size: 18, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                
                            })
                            
                            Button(action: {
                                
                                viewModel.TD = viewModel.addTD
                                
                                viewModel.addTD = ""
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isTD = false
                                }
                                
                            }, label: {
                                
                                Text("Save")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 18, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                
                            })
                        }
                    }
                    .frame(width: 300)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.7)))
                    .padding()
                    .offset(y: viewModel.isTD ? 0 : UIScreen.main.bounds.height)
                }
            )
            .sheet(isPresented: $viewModel.isAddCar, content: {
                
                AddCar(viewModel: viewModel)
            })
            .sheet(isPresented: $viewModel.isAddDriver, content: {
                
                AddDriver(viewModel: viewModel)
            })
        }
    }
}

#Preview {
    GarageView()
}
