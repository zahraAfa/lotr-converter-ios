//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Anisa Fatimah Azzahra on 03/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    
    @State var leftTyping = false
    @State var rightTyping = false
    
    @State var leftCurrency : Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    var body: some View {
        ZStack{
//            Background image
            Image("background").resizable().edgesIgnoringSafeArea(.all)
            
            VStack{
//                Prancing pony image
                Image("prancingpony").resizable().scaledToFit().frame(height: 200)
                
//                Currency exchange text
                Text("Currency Exchange").font(.largeTitle).foregroundColor(.white)
                
//                Currency conversion section
                HStack{
//                    Left conversion
                    VStack{
//                        Currency
                        HStack{
//                            Currency Image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue).resizable().scaledToFit().frame(height: 33)
                            
//                            Currency Text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue).font(.headline).foregroundColor(.white)
                        }.onTapGesture{
                            showSelectCurrency.toggle()
                        }.sheet(isPresented: $showSelectCurrency){
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
//                        Text Field
                        TextField("Amount", text: $leftAmount, onEditingChanged: { typing in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        }).padding(10).background(Color(UIColor.systemGray6)).cornerRadius(10)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftTyping ? leftAmount : leftAmountTemp) { newValue in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                            .onChange(of: leftCurrency) { _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                    }
                    
//                    Equal sign
                    Image(systemName: "equal").foregroundColor(.white).font(.largeTitle)
                    
//                    Right conversion section
                    VStack{
//                        Currency
                        HStack{
//                            Currency Text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue).font(.headline).foregroundColor(.white)
                            
//                            Currency Image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue).resizable().scaledToFit().frame(height: 33)
                        }.onTapGesture{
                            showSelectCurrency.toggle()
                        }.sheet(isPresented: $showSelectCurrency){
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
//                        Text Field
                        TextField("Amount", text: $rightAmount, onEditingChanged: { typing in
                            rightTyping = typing
                            rightAmountTemp = rightAmount
                        }).padding(10).background(Color(UIColor.systemGray6)).cornerRadius(10)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTyping ? rightAmount : rightAmountTemp) { newValue in
                                leftAmount = leftCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency) { _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                    }
                }.padding(20).background(.black.opacity(0.5))
                
                Spacer()
                
//                Info button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill").font(.largeTitle).foregroundColor(.white).padding(.trailing)
                            .sheet(isPresented: $showExchangeInfo) {
                                ExchangeInfo()
                            }
                }
                }

                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
