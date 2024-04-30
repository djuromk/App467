//
//  HomeView.swift
//  App467
//
//  Created by IGOR on 17/04/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text("Total balance")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                        Text("$\(viewModel.balance)")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .semibold))
                        
                        if viewModel.dir.isEmpty {
                            
                            Text("Unknown change")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .regular))
                            
                        } else {
                        
                        if viewModel.dir == "Up" {
                            
                            HStack {
                                
                                Text("+\(viewModel.change)")
                                    .foregroundColor(.green)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("for last week")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            
                        } else {
                            
                            HStack {
                                
                                Text("$\(viewModel.change)")
                                    .foregroundColor(.red)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("for last week")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                            }
                        }
                    }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEditBalance = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .padding(9)
                            .background(Circle().fill(.white))
                    })
                    
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .frame(height: 170)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("primary").opacity(0.4)))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isTR = true
                        }
                        
                    }, label: {
                        
                        VStack(alignment:. leading) {
                            
                            HStack {
                                
                                Image(systemName: "arrow.up.right.square")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                    .padding(3)
                                    .background(RoundedRectangle(cornerRadius: 4).fill(Color("primary")))
                                
                                Text("Total Revenue")
                                    .foregroundColor(.black.opacity(0.7))
                                    .font(.system(size: 12, weight: .medium))
                                
                            }
                            
                            Spacer()
                            
                            Text("$\(viewModel.TR)")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                        }
                        .padding()
                        .frame(width: 150, height: 100, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(color: .black.opacity(0.15), radius: 10))
                        .padding(1)
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isTE = true
                        }
                        
                    }, label: {
                        
                        VStack(alignment:. leading) {
                            
                            HStack {
                                
                                Image(systemName: "arrow.down.right.square")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                    .padding(3)
                                    .background(RoundedRectangle(cornerRadius: 4).fill(Color("primary")))
                                
                                Text("Total Expenses")
                                    .foregroundColor(.black.opacity(0.7))
                                    .font(.system(size: 12, weight: .medium))
                                
                            }
                            
                            Spacer()
                            
                            Text("$\(viewModel.TE)")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                        }
                        .padding()
                        .frame(width: 150, height: 100, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(color: .black.opacity(0.15), radius: 10))
                        .padding()
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isNP = true
                        }
                        
                    }, label: {
                        
                        VStack(alignment:. leading) {
                            
                            HStack {
                                
                                Image(systemName: "dollarsign.arrow.circlepath")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                    .padding(3)
                                    .background(RoundedRectangle(cornerRadius: 4).fill(Color("primary")))
                                
                                Text("Net Profit")
                                    .foregroundColor(.black.opacity(0.7))
                                    .font(.system(size: 12, weight: .medium))
                                
                            }
                            
                            Spacer()
                            
                            Text("$\(viewModel.NP)")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                        }
                        .padding()
                        .frame(width: 150, height: 100, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(color: .black.opacity(0.15), radius: 10))
                        .padding(1)
                    })
                }
                }
                .frame(height: 130)
                
                HStack {
                    
                    Text("Active orders")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus.viewfinder")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    })
                    
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.orders, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selectedOrder = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 17) {
                                        
                                        Text(index.orderID ?? "")
                                            .foregroundColor(Color("primary2"))
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Text(index.orderDriver ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Text(index.orderVehicle ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .medium))
                                            .padding(5)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("primary2")))
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading, spacing: 7) {
                                     
                                        Text("Fare")
                                            .foregroundColor(.gray.opacity(0.7))
                                            .font(.system(size: 14, weight: .medium))
                                        
                                        Text("$\(index.orderFare ?? "")")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                            })
                        }
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            OrderDetail(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchOrders()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddOrder(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isEditBalance, content: {
            
            EditBalance(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isTR ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isTR = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTR = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Total revenue")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()

                    ZStack(alignment: .leading, content: {
                        
                        Text("Total revenue")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addTR.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addTR)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))

                    })
                    .padding(7)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 2).fill(.white))
                    
                    HStack {
                        
                        Button(action: {
  
                            withAnimation(.spring()) {
                                
                                viewModel.isTR = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.TR = viewModel.addTR
                            
                            viewModel.addTR = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTR = false
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
                .offset(y: viewModel.isTR ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isTE ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isTE = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTE = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Total expenses")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()

                    ZStack(alignment: .leading, content: {
                        
                        Text("Total expenses")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addTE.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addTE)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))

                    })
                    .padding(7)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 2).fill(.white))
                    
                    HStack {
                        
                        Button(action: {
  
                            withAnimation(.spring()) {
                                
                                viewModel.isTE = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.TE = viewModel.addTE
                            
                            viewModel.addTE = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTE = false
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
                .offset(y: viewModel.isTE ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isNP ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isNP = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isNP = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Net profit")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()

                    ZStack(alignment: .leading, content: {
                        
                        Text("Net profit")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addNP.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addNP)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))

                    })
                    .padding(7)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 2).fill(.white))
                    
                    HStack {
                        
                        Button(action: {
  
                            withAnimation(.spring()) {
                                
                                viewModel.isNP = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.NP = viewModel.addNP
                            
                            viewModel.addNP = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isNP = false
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
                .offset(y: viewModel.isNP ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    HomeView()
}
