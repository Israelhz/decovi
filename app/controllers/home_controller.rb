class HomeController < ApplicationController
  def index
  end

  def about
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
