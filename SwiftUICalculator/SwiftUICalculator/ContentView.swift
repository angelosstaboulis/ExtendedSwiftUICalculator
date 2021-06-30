//
//  ContentView.swift
//  SwiftUICalculator
//
//  Created by Angelos Staboulis on 30/6/21.
//

import SwiftUI

struct ContentView: View {
    @State var readout:String
    var body: some View {
        VStack{
            VStack{
                HStack(alignment: .top){
                    Text("Extended SwiftUI Calculator")
                        .padding(20).foregroundColor(.blue)
                }.padding(-100)
                HStack(alignment: .top){
                    TextField("0.", text: $readout)
                        .multilineTextAlignment(.trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .frame(width: 200.0)
                
            }
            HStack{
                ForEach(7..<10){ number in
                    Button(action: {
                        readout = readout + String(number)
                    }, label: {
                        Text(String(number))
                    })
                }.padding(20)
                Button(action: {
                    readout = readout + "/"
                }, label: {
                    Text(String("/"))
                }).padding(20)
            }.padding(20)
            HStack{
                ForEach(4..<7){ number in
                    Button(action: {
                        readout = readout + String(number)
                    }, label: {
                        Text(String(number))
                    })
                }.padding(20)
                Button(action: {
                    readout = readout + "*"
                }, label: {
                    Text(String("*"))
                }).padding(20)
                
            }.padding(20)
            HStack{
                ForEach(1..<4){ number in
                    Button(action: {
                        readout = readout + String(number)
                    }, label: {
                        Text(String(number))
                    })
                }.padding(20)
                Button(action: {
                    readout = readout + "-"
                }, label: {
                    Text(String("-"))
                }).padding(20)
                
            }.padding(20)
            HStack{
                Button(action: {
                    readout = readout + "0"
                }, label: {
                    Text(String("0"))
                }).padding(20)
                Button(action: {
                    readout = readout + "."
                }, label: {
                    Text(String("."))
                }).padding(20)
                Button(action: {
                    let expression = NSExpression(format: readout, argumentArray: [])
                    let result = expression.expressionValue(with: nil, context: nil)
                    let number = NumberFormatter()
                    readout = number.string(for: result)!
                }, label: {
                    Text(String("="))
                }).padding(20)
                Button(action: {
                    readout = readout + "+"
                }, label: {
                    Text(String("+"))
                }).padding(20)
            }.padding(-20)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(readout: "")
    }
}
