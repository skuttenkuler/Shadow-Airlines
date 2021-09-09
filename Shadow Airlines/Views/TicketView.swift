//
//  TicketView.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/5/21.
//

import SwiftUI


struct TicketView: View {
    
    @Binding var destination: String
    @Binding var departure: Date
    
    var body: some View {
        ZStack{
            VStack{
            Text("Nashville (BNA)")
                .offset(x: 20,y: -170)
                .font(.system(size:25)
                .weight(.heavy))
                .foregroundColor(Color.black)
                .frame(minWidth: 300, idealWidth: 300, maxWidth: 300, minHeight: 100, idealHeight: 100, maxHeight: 100)
                Text(destination)
                    .offset(x: 30,y: -200)
                    .font(.system(size:25)
                    .weight(.heavy))
                    .foregroundColor(Color.black)
                    .frame(minWidth: 350, idealWidth: 300, maxWidth: 350, minHeight: 100, idealHeight: 100, maxHeight: 100)
                
                Text("\(departure, style: .date)")
                    .offset(x: 75,y: 28)
                    .font(.system(size:23)
                    .weight(.heavy))
                    .foregroundColor(Color.black)
                    .frame(width:250)
                Text("\(departure, style: .time)").offset(x: -120,y: 60).font(.system(size:25).weight(.heavy)).foregroundColor(Color.black)
        Button("Book"){
            let image = snapshot()
            UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        }.offset(x: 120 , y:0).font(.system(size:30)).foregroundColor(Color.white)
    }.background(
        Image("S_Ticket")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .frame(width:400, height: 590)
            .offset(x: 0,y: -40)
    )}
}
}

