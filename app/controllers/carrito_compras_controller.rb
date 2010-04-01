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
    # Adicionamos o actualizamos la cantidad
    adicionar_o_actualizar_item(params[:id])
    Producto.all(:conditions => {:id => session[:carrito] } ) if session[:carrito].size > 0
  end

  # actualiza los items que se haya seleccionado
  def update
    @compra = Compra.new
    # Iteramos a traves de todos los productos
    params[:producto].each do |k, prod|
      adicionar_o_actualizar_item(k)
    end

    render :action => "new"
  end

private
  # metodo para adicionar items al carrito de compras
  # por defecto con el valor de id = nil
  def adicionar_o_actualizar_item(id = nil)
    session[:carrito] ||= []
    # Si no existe id no se realiza la accion
    unless id.nil?
      id = id.to_i
      index = session[:carrito].find_index{|v| v.id == id }
      # Si no encuentra el item no realizar nada
      session[:carrito] << ItemSession.new(id) if index.nil?
      # Se cambia la cantidad o se mantiene en base a los parametros
      if params[:producto]
        cantidad = params[:producto][id.to_s][:cantidad].to_i
      else
        cantidad = session[:carrito].last.cantidad
        # Necesitamos el indice
        index = session[:carrito].size - 1
      end
      # Adicion o borrado de cantidad
      if cantidad == 0
        borrar_item(id)
      else
        session[:carrito][index].cantidad = cantidad
      end
    end
  end

  # Metodo para borrar items
  # @param Integer id
  def borrar_item(id)
    p = session[:carrito].find{|v| v.id == id }
    # Borrar item si existe
    session[:carrito].delete(p) if p
  end
end
