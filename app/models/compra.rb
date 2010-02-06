class Compra < ActiveRecord::Base
  # Relación de 1 a muchos, indica borrar todos los relacionados
  # en caso de que se borre una compra
  has_many :compra_detalles, :dependent => :destroy
  
  # Permite que se realize una relación especial para formas maestro detalle
  accepts_nested_attributes_for :compra_detalles
end
