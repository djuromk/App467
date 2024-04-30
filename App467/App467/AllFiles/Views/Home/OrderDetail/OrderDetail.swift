//
//  OrderDetail.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct OrderDetail: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedOrder?.orderID ?? "")
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
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text(viewModel.selectedOrder?.orderDriver ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text(viewModel.selectedOrder?.orderVehicle ?? "")
                            .foregroundColor(.black.opacity(0.7))
                            .font(.system(size: 15, weight: .regular))
                        
                        HStack {
                            
                            VStack(alignment:. leading) {
                                
                                HStack {
                                    
                                    Image(systemName: "chart.bar")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(3)
                                        .background(RoundedRectangle(cornerRadius: 4).fill(Color("primary")))
                                    
                                    Text("Status")
                                        .foregroundColor(.black.opacity(0.7))
                                        .font(.system(size: 12, weight: .medium))
                                    
                                }
                                
                                Spacer()
                                
                                Text(viewModel.selectedOrder?.orderStatus ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(color: .black.opacity(0.15), radius: 10))
                            .padding(1)
                            
                            VStack(alignment:. leading) {
                                
                                HStack {
                                    
                                    Image(systemName: "creditcard")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(3)
                                        .background(RoundedRectangle(cornerRadius: 4).fill(Color("primary")))
                                    
                                    Text("Fare")
                                        .foregroundColor(.black.opacity(0.7))
                                        .font(.system(size: 12, weight: .medium))
                                    
                                }
                                
                                Spacer()
                                
                                Text(viewModel.selectedOrder?.orderStatus ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(color: .black.opacity(0.15), radius: 10))
                            .padding(1)
                        }
                        .padding()
                        
                        Text("Overview")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        VStack(alignment: .leading) {
                            
                            Text("Pick-Up Location")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            Text(viewModel.selectedOrder?.pickLocation ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Drop-Off Location")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            Text(viewModel.selectedOrder?.dropLocation ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Time of Pick-Up")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            Text(viewModel.selectedOrder?.timePickUp ?? "")
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
                            
                            CoreDataStack.shared.deleteOrder(withOrderID: viewModel.selectedOrder?.orderID ?? "", completion: {
                                
                                viewModel.fetchOrders()
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
    OrderDetail(viewModel: HomeViewModel())
}
