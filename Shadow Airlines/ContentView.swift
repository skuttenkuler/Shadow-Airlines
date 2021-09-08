//
//  ContentView.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/5/21.
//

import SwiftUI
import UIKit
import ExternalAccessory

struct HomeView: View {
    var body: some View {
        //add navView
        NavigationView {
            VStack{
                
            HomeContent()

            }.background(LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .top, endPoint: .bottom).frame(width: UIScreen.main.bounds.width, height:1000))
    
        }.accentColor( .white) 
    }
}

struct HomeContent: View {
    //view block
    
    var body: some View {
        Text("Shadow Airlines")
            .font(.system(size: 60))
            .bold()
            .italic()
            .offset(y: -25)
            .foregroundColor(Color.white)
            .shadow(color: .black, radius: 4, x: 10, y: 10)
        Spacer()
        Image("cards").resizable()
        NavigationLink(destination:BookTicketView(), label: {
            Text("Begin")
                .font(.system(size:60))
                .frame(width: 200, height: 100)
                .foregroundColor(Color.white)
                .background(Color(red: 203 / 255,green: 33 / 255 ,blue: 39 / 255))
                .cornerRadius(20)
                .shadow(color: .black, radius: 2, x: 10, y: 10)
                
            }).accentColor( .white)
}
}
