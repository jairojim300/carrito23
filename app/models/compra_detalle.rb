class CompraDetalle < ActiveRecord::Base
  belongs_to :compra_detalle
  belongs_to :producto
end
