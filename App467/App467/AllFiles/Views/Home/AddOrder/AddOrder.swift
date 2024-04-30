//
//  AddOrder.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct AddOrder: View {
    
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
                    
                    Text("Add order")
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
                            
                            Text("Order ID")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            ZStack(alignment: .leading, content: {
                                
                                Text("#23456")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orderID.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.orderID)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))

                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Driver")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orderDriver.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.orderDriver)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))

                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Vehicle")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orderVehicle.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.orderVehicle)
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
                            
                            Text("Pick-Up Location")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.pickLocation.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.pickLocation)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))

                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Drop-Off Location")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.dropLocation.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.dropLocation)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .semibold))

                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Time of Pick-Up")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.timePickUp.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.timePickUp)
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
                            
                            Rectangle()
                                .fill(.gray.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Fare")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.system(size: 14, weight: .regular))

                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orderFare.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.orderFare)
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
                    
                    viewModel.names.append(viewModel.orderDriver)
                    
                    viewModel.orderStatus = viewModel.currentStatus
                    
                    viewModel.addOrder()
                    
                    viewModel.orderDriver = ""
                    viewModel.orderID = ""
                    viewModel.orderVehicle = ""
                    viewModel.pickLocation = ""
                    viewModel.dropLocation = ""
                    viewModel.timePickUp = ""
                    viewModel.currentStatus = ""
                    viewModel.orderFare = ""
                    
                    viewModel.fetchOrders()
                    
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
                .opacity(viewModel.currentStatus.isEmpty || viewModel.orderID.isEmpty || viewModel.orderDriver.isEmpty || viewModel.orderVehicle.isEmpty || viewModel.pickLocation.isEmpty || viewModel.dropLocation.isEmpty || viewModel.timePickUp.isEmpty || viewModel.orderFare.isEmpty ? 0.5 : 1)
                .disabled(viewModel.currentStatus.isEmpty || viewModel.orderID.isEmpty || viewModel.orderDriver.isEmpty || viewModel.orderVehicle.isEmpty || viewModel.pickLocation.isEmpty || viewModel.dropLocation.isEmpty || viewModel.timePickUp.isEmpty || viewModel.orderFare.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddOrder(viewModel: HomeViewModel())
}
