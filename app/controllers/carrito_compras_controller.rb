class CarritoComprasController < ApplicationController

  before_filter :crear_paginacion


  # Inicio, metodo para presentar lista de productos
  def index
    # Paginacion
    @productos = Producto.paginate(:page => @page, :per_page => @perpage)
  end

  # Metodo para presentar el carrito de compras
  def new
    @compra = Compra.new
    # Adicionamos item si existe
    adicionar_item
    Producto.all(:conditions => {:id => session[:carrito] } ) if session[:carrito].size > 0
  end

private
  # metodo para adicionar items al carrito de compras
  def adicionar_item
    session[:carrito] ||= []
    unless params[:id].nil?
      i = session[:carrito].find_index{|v| v.id == params[:id].to_i }
      unless i
        session[:carrito] << ItemSession.new(params[:id])
      else
        session[:carrito][i].aumentar_cantidad(1)
      end
    end
  end

  # Metodo para borrar items
  def borrar_item
    unless params[:id].nil?
      p = session[:carrito].find{|v| v[:id] == params[:id] }
      session[:carrito].delete(p)
    end
  end
end
