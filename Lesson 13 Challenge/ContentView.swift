//
//  ContentView.swift
//  Lesson 13 Challenge
//
//  Created by Marcello Lima on 06/09/21.
//

import SwiftUI

struct ContentView: View {
    @State private var credit = 1000
    @State private var image1 = "apple"
    @State private var image2 = "apple"
    @State private var image3 = "apple"
    private let  possibleImages: [String] = ["apple", "cherry", "star"]

    var body: some View {
        ZStack {
            Image("background").resizable().ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    Text("SwiftUI Slots!")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding()
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                }
                Spacer()
                ZStack {
                    Text("").padding(.horizontal, 70.0)
                        .frame(height: 30.0)
                        .background(Color.yellow)
                        .opacity(0.5)
                        .cornerRadius(40)
                    Text("Credits: " + String(credit)).font(.headline).fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.black)
                        .padding(.all, 10.0)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                HStack {
                    Spacer()
                    Image(image1)
                        .resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                        .opacity(0.8)
                        .cornerRadius(15)
                    Spacer()
                    Image(image2)
                        .resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                        .opacity(0.8)
                        .cornerRadius(15)
                    Spacer()
                    Image(image3)
                        .resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                        .opacity(0.8)
                        .cornerRadius(15)
                    Spacer()
                }.padding().cornerRadius(10)
                Spacer()
                HStack {
                    Button(action: {
                        spin()
                    }, label: {
                        Text("Spin").font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/).fontWeight(.semibold)
                    })
                }.padding(.horizontal, 40.0)
                .frame(height: 40.0)
                .foregroundColor(Color.white)
                .background(Color.red)
                .cornerRadius(40)
                Spacer()
            }
            
        }.edgesIgnoringSafeArea(.all)
        
    }
        

    func spin() {
        image1 = possibleImages.randomElement()!
        image2 = possibleImages.randomElement()!
        image3 = possibleImages[Int.random(in: 0...2)]
        
        if image1 == image2 && image2 == image3 {
            credit += 1000
        }
        else if image1 == image2 || image2 == image3 || image1 == image3 {
            credit -= 10
        }
        else {
            credit -= 50
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
