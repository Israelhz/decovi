class HomeController < ApplicationController
  def index
    @content1 = Content.find(1)
    @content2 = Content.find(2)
    @content3 = Content.find(3)
    @content4 = Content.find(4)
    @content5 = Content.find(5)
    @content6 = Content.find(6)
  end

  def about
    @content1 = Content.find(8)
  end

  def productos
  end

  def servicios
  end

  def contacto
  end

  def reportes
    @reporte = ProductOrder.group("producto_id").sum(:cantidad)
    @cantPedidos = Pedido.count()
    @individuos = User.where(:individuo => true).count
    @empresas = User.where(:empresa => true).count
  end 
end
