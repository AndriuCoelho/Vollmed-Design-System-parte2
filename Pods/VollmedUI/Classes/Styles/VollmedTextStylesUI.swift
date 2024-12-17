//
//  VollmedTextStylesUI.swift
//  Pods
//
//  Created by ALURA on 25/10/24.
//

import SwiftUI

struct VollmedTextStylesUI: View {
    
    let boldColor = Color(red: 0.0/255.0, green: 33.0/255.0, blue: 61.0/255.0, opacity: 1.0)
    
    var body: some View {
        VStack {
            Text("Title L Regular")
                .titleLRegularStyle()
            
            Text("Title L Bold")
                .titleLBoldStyle()
            
            Text("Title Md Regular")
                .titleMdRegularStyle()
            
            Text("Title Md Bold")
                .titleMdBoldStyle()
            
            Text("Title S Regular")
                .titleSRegularStyle()
            
            Text("Title S Bold")
                .titleSBoldStyle()
            
            Text("Body Regular")
                .bodyRegularStyle()
            
            Text("Body Bold")
                .bodyBoldStyle()
            
            Text("Caption")
                .captionStyle()
        }
    }
}

struct TitleStyleLRegular: ViewModifier {
    
    /// Modifica o conteúdo do Text (View)
    /// - Parameter content: O conteúdo da View que será modificada (nessa caso, o texto)
    /// - Returns: Retorna o 'Text' modificado, com o estilo L Regular
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22))
            .foregroundStyle(.gray)
            .fontWeight(.regular)
    }
}

struct TitleStyleLBold: ViewModifier {
    
    /// Modifica o conteúdo do Text (View)
    /// - Parameter content: O conteúdo da View que será modificada (nessa caso, o texto)
    /// - Returns: Retorna o 'Text' modificado, com o estilo L Bold
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22))
            .foregroundStyle(Color(red: 0.0/255.0, green: 33.0/255.0, blue: 61.0/255.0, opacity: 1.0))
            .fontWeight(.bold)
    }
}

struct TitleStyleMdRegular: ViewModifier {
    
    /// Modifica o conteúdo do Text (View)
    /// - Parameter content: O conteúdo da view que será modificado
    /// - Returns: O conteúdo modificado com o estilo do título regular M
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .foregroundStyle(.gray)
            .fontWeight(.regular)
    }
}

struct TitleStyleMdBold: ViewModifier {
    
    /// Modifica o conteúdo do Text (View)
    /// - Parameter content: O conteúdo da view que será modificado
    /// - Returns: O conteúdo modificado com o estilo do título Bold
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .foregroundStyle(Color(red: 0.0/255.0, green: 33.0/255.0, blue: 61.0/255.0, opacity: 1.0))
            .fontWeight(.bold)
    }
}

struct TitleStyleSRegular: ViewModifier {
    
    /// Modifica o conteúdo do Text (View)
    /// - Parameter content: O conteúdo da view que será modificado
    /// - Returns: O conteúdo modificado com o estilo do título S Regular
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18))
            .foregroundStyle(.gray)
            .fontWeight(.regular)
    }
}

struct TitleStyleSBold: ViewModifier {
    
    /// Modifica o conteúdo do Text (View)
    /// - Parameter content: O conteúdo da view que será modificado
    /// - Returns: O conteúdo modificado com o estilo do título S Bold
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18))
            .foregroundStyle(Color(red: 0.0/255.0, green: 33.0/255.0, blue: 61.0/255.0, opacity: 1.0))
            .fontWeight(.bold)
    }
}

struct BodyRegular: ViewModifier {
    
    /// Modifica o conteúdo do Text (View)
    /// - Parameter content: O conteúdo da view que será modificado
    /// - Returns: O conteúdo modificado com o estilo do corpo do texto como Regular
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17))
            .foregroundStyle(.gray)
            .fontWeight(.regular)
    }
}

struct BodyBold: ViewModifier {
    
    /// Modifica o conteúdo do Text (View)
    /// - Parameter content: O conteúdo da view que será modificado
    /// - Returns: O conteúdo modificado com o estilo do corpo do texto como Bold
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17))
            .foregroundStyle(.gray)
            .fontWeight(.bold)
    }
}

struct Caption: ViewModifier {
    
    /// Modifica o conteúdo do Text (View)
    /// - Parameter content: O conteúdo da view que será modificado
    /// - Returns: O conteúdo modificado com o estilo Caption do texto
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .foregroundStyle(.gray)
            .fontWeight(.regular)
    }
}

extension View {
    
    /// Essa extension aplica um estilo com fonte de tamanho 22, cor cinza e peso da fonte: Regular
    /// - Returns: O Texto modificado com o estilo Regular
    public func titleLRegularStyle() -> some View {
        modifier(TitleStyleLRegular())
    }
    
    /// Essa extension aplica um estilo com fonte de tamanho 22, cor azul escuro e peso da fonte Bold
    /// - Returns: O Texto modificado com o estilo Bold
    public func titleLBoldStyle() -> some View {
        modifier(TitleStyleLBold())
    }
    
    /// Essa extension aplica um estilo com fonte de tamanho 20, cor cinza escuro e peso da fonte Regular
    /// - Returns: O Texto modificado com o estilo Regular
    public func titleMdRegularStyle() -> some View {
        modifier(TitleStyleMdRegular())
    }
    
    /// Essa extension aplica um estilo com fonte de tamanho 20, cor azul escuro e peso da fonte Bold
    /// - Returns: O Texto modificado com o estilo Bold
    public func titleMdBoldStyle() -> some View {
        modifier(TitleStyleMdBold())
    }
    
    /// Essa extension aplica um estilo com fonte de tamanho 20, cor azul escuro e peso da fonte Bold
    /// - Returns: O Texto modificado com o estilo Bold
    public func titleSRegularStyle() -> some View {
        modifier(TitleStyleSRegular())
    }
    
    /// Essa extension aplica um estilo com fonte de tamanho 18, cor azul escuro e peso da fonte Bold
    /// - Returns: O Texto modificado com o estilo Bold
    public func titleSBoldStyle() -> some View {
        modifier(TitleStyleSBold())
    }
    
    /// Essa extension aplica um estilo com fonte de tamanho 17, cor azul escuro e peso da fonte Regular
    /// - Returns: O Texto modificado com o estilo Regular
    public func bodyRegularStyle() -> some View {
        modifier(BodyRegular())
    }
    
    /// Essa extension aplica um estilo com fonte de tamanho 17, cor azul escuro e peso da fonte Bold
    /// - Returns: O Texto modificado com o estilo Bold
    public func bodyBoldStyle() -> some View {
        modifier(BodyBold())
    }
    
    /// Essa extension aplica um estilo com fonte de tamanho 14, cor azul escuro e peso da fonte Regular
    /// - Returns: O Texto modificado com o estilo Regular
    public func captionStyle() -> some View {
        modifier(Caption())
    }
}

#Preview {
    VollmedTextStylesUI()
}

