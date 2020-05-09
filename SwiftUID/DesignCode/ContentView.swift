//
//  ContentView.swift
//  DesignCode
//
//  Created by Meng To on 12/16/19.
//  Copyright © 2019 Meng To. All rights reserved.
//6

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    
    var body: some View {
        
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
            .opacity(1)
                .animation(.default)
            
            BackCardView()
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 0 : 10))
                .rotation3DEffect(Angle(degrees: 10), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeOut(duration: 0.5))
            
            BackCardView()
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 0 : 5))
                .rotation3DEffect(Angle(degrees: 5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeIn(duration: 0.3))
            
            
            CardView()
                .offset(x: viewState.width, y: viewState.height)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
            }
           //Mover la cardView
            .gesture(DragGesture().onChanged { value in
                self.viewState = value.translation
                self.show = true
                }
               //Regresar al mismo lugar
            .onEnded( { value in
                self.viewState = .zero
                self.show = false
            })
            
            )
            
            BottomCardView()
                .offset(x: 0, y: showCard ? 360 : 1000)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Diseño UI")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    
                    Text("Certificado")
                        .foregroundColor(Color("accent"))
                }
                
                Spacer()
                
                Image("Logo1")
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Spacer()
            
            
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 310, height: 110, alignment: .top)
            
            
        }
        .frame(width: 340, height: 220)
        .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 340, height: 220)
        
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                
                Text("Certificados")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            
            Image("Background1")
            
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("¿Deseas realizar un trámite ante las dependencias de gobierno, obtener un servicio de ellas, o ser beneficiario de algún programa? Consulta e imprime en línea tu Clave Única de Registro de Población (CURP)? ¡Es muy sencillo, sólo tienes que ingresar tus datos!")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
