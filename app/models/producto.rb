# coding: utf-8

# Clase prodcto que permite acceder a la tabla productos en la base de datos
class Producto < ActiveRecord::Base

  has_many :compra_detalles
  has_many :compras, :through => :compra_detalles
  # Para que funcione la gema paperclip es necesario añadir esto
  # donde :foto es el campo que se usara, :styles son los estilos o
  # tamaños de las fotos que se generaran, Muy importante es recordar
  # instalar imagemagick http://www.imagemagick.org/script/
  has_attached_file :foto, :styles => {:mini => "90x90>", :medio => "200x200>"}
  validates_presence_of :nombre # valida la presencia de :nombre
  validates_numericality_of :precio # valida de que precio sea numerico

  # Método para presenta un tag "img" con la fotografía
  # @param style # Indica el estilo (por defecto :mini)
  # ver como se usa en app/views/productos/index.html.erb
  def ver_foto(style = :mini)
    %(<img src="#{foto.url(style)}" alt="#{nombre}" />)
  end
end
