//
//  CarDetail.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct CarDetail: View {

    @StateObject var viewModel: GarageViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedCar?.carMarkModel ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            back.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Back")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                
                                
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = true
                            }
                            
                        }, label: {

                                Image(systemName: "trash.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: 16, weight: .medium))

                            })
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(viewModel.selectedCar?.carMarkModel ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("\(viewModel.selectedCar?.carPlate ?? "") | \(viewModel.selectedCar?.carStatus ?? "")")
                            .foregroundColor(.black.opacity(0.7))
                            .font(.system(size: 15, weight: .regular))
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 12) {
                                
                                Text("Driver Assigned")
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text(viewModel.selectedCar?.carDriver ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            }
                            
                            Spacer()

                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("primary")))

                        Text("Car overview")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                            .padding(.vertical)
                        
                        VStack(alignment: .leading, spacing: 14) {
                            
                            Text("Mileage")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            Text(viewModel.selectedCar?.carMileage ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Last Service Date")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            Text(viewModel.selectedCar?.carLastService ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Next Service Due")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            Text(viewModel.selectedCar?.carNextService ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))

                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
                .ignoresSafeArea()
            }
            .overlay(
                
                ZStack {
                    
                    Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                        }
                    
                    VStack {
                        
                        HStack {
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDelete = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                        }
                        
                        Text("Delete")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                            .padding()
                        
                        Text("Are you sure you want to delete?")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteCar(withCarPlate: viewModel.selectedCar?.carPlate ?? "", completion: {
                                
                                viewModel.fetchCars()
                            })
              
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                viewModel.isDetail = false
                                
                            }
                                    
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        .padding(.top, 25)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.black))
                    .padding()
                    .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
                }
            )
        }
    }
}

#Preview {
    CarDetail(viewModel: GarageViewModel())
}
