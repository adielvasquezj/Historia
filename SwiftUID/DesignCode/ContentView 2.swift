//
//  ContentView.swift
//  DesignCode
//
//  Created by Meng To on 12/16/19.
//  Copyright © 2019 Meng To. All rights reserved.
//6

import SwiftUI
//
struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    
    var body: some View {
        
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(Animation.default.delay(0.1)
                    //.speed(2).repeatCount(3, autoreverses: false)
            )
            
            
            
            BackCardView()
                //.frame(width: 340, height: 220)
                .frame(width:showCard ? 300 : 340, height: 220)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(Angle(degrees: show ? 0 : 10))
                .rotationEffect(Angle(degrees: showCard ?  -10: 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 10), axis: (x:10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeOut(duration: 0.5))
            
            BackCardView()
                //.frame(width: 340, height: 220)
                .frame(width: 340, height: 220)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(Angle(degrees: show ? 0 : 5))
                .rotationEffect(Angle(degrees: showCard ? -5 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeIn(duration: 0.3))
            
            
            CardView()
                .frame(width: showCard ? 375 : 340, height: 220)
                .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                //  .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
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
                .frame(width: 300, height: 110, alignment: .top)
            
            
        }
        
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
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
