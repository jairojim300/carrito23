class Compra < ActiveRecord::Base

  before_save :adicionar_fecha_total
  # Relación de 1 a muchos, indica borrar todos los relacionados
  # en caso de que se borre una compra
  has_many :compra_detalles, :dependent => :destroy
  has_many :productos, :through => :compra_detalles
  belongs_to :usuario

  attr_protected :fecha, :total
  
  # Permite que se realize una relación especial para formas maestro detalle
  accepts_nested_attributes_for :compra_detalles

private
  # Adiciona el total calculado de una compra y su fecha
  def adicionar_fecha_total
    self.fecha = DateTime.now
    self.total = compra_detalles.inject(0){|sum, v| sum + (v.precio*v.cantidad) }
  end
end
