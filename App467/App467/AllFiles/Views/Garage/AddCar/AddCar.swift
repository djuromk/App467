//
//  AddCar.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct AddCar: View {
    
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
                    
                    Text("Add car")
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
                        
                        
                        Menu(content: {
                            
                            ForEach(viewModel.names, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedDriver = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.selectedDriver.isEmpty {
                                
                                HStack {
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text("Driver Assigned")
                                            .foregroundColor(.gray.opacity(0.7))
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Text("Choose")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black.opacity(0.7))
                                        .font(.system(size: 16, weight: .medium))
                                }
                                
                            } else {
                                
                                HStack {
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text("Driver Assigned")
                                            .foregroundColor(.gray.opacity(0.7))
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Text(viewModel.selectedDriver)
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black.opacity(0.7))
                                        .font(.system(size: 16, weight: .medium))
                                }
                            }
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                        
                        VStack(alignment: .leading) {
                            
                            Text("Mark and Model")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.carMarkModel.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.carMarkModel)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("License Plate")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.carPlate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.carPlate)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Status")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))
                            
                            Menu(content: {
                                
                                ForEach(viewModel.statuss, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currentStatus = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentStatus.isEmpty {
                                    
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
                                        
                                        Text(viewModel.currentStatus)
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
                        
                        VStack(alignment: .leading) {
                            
                            Text("Mileage")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Expample")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.carMileage.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.carMileage)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Last Service Date")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Expample")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.carLastService.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.carLastService)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Next Service Due")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Expample")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.carNextService.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.carNextService)
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
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.carStatus = viewModel.currentStatus
                    
                    viewModel.addCar()
                    
                    
                    viewModel.fetchCars()
                    
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
                
            }
            .padding()
        }
    }
}

#Preview {
    AddCar(viewModel: GarageViewModel())
}
