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
                .offset(x: 20,y: 130)
                .font(.system(size:23)
                .weight(.heavy))
                .colorInvert()
                .frame(minWidth: 300, idealWidth: 300, maxWidth: 300, minHeight: 100, idealHeight: 100, maxHeight: 100)
                Text(destination)
                    .colorInvert()
                    .offset(x: 30,y: 75)
                    .font(.system(size:23)
                    .weight(.heavy))
                    .frame(minWidth: 300, idealWidth: 300, maxWidth: 300, minHeight: 100, idealHeight: 100, maxHeight: 100)
                
                Text("\(departure, style: .date)")
                    .offset(x: 60,y: 265)
                    .font(.system(size:19)
                    .weight(.heavy))
                    .colorInvert()
                    .frame(width:250)
                Text("\(departure, style: .time)").offset(x: -75,y: 320).font(.system(size:25).weight(.heavy)).colorInvert()
        Button("Book"){
            let image = snapshot()
            UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        }.offset(x: 0 , y:0).font(.system(size:30)).colorInvert()
    }.background(
        Image("Ticket2")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .frame(width:300, height: 650)
    )}
}
}

