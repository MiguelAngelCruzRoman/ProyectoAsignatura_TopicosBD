class Factura
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id_Reservacion, type: BSON::ObjectId
  field :fechaEmision, type: DateTime
  field :fechaVencimiento, type: DateTime
  field :pago, type: Integer
  field :impuestosAdicionales, type: Integer
  field :metodoPago, type: String
  field :estatus, type: String
end
