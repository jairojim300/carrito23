# coding: utf-8
#
# Metodo para poder manejar la sesion de los items
class ItemSession
  attr_reader :id, :precio, :foto, :nombre
  attr_accessor :cantidad

  # inicia la clase con los valores
  def initialize(id)
    p = Producto.find(id)
    if p
      @id = p.id
      @nombre = p.nombre
      @foto = p.foto.url(:mini)
      @precio = p.precio
      @cantidad = 1
    else
      return false
    end
  end

  # aumenta la cantidad del item
  # @param Integer cant # cantidad por defecto 1
  def aumentar_cantidad(cant = 1)
    @cantidad += cant
  end

  # calcula el subtotal del item
  def subtotal
    precio * cantidad
  end

  # Metodo para presentar la foto
  def ver_foto
    %Q(<img src="#{foto}" alt="#{nombre}" />)
  end

end
