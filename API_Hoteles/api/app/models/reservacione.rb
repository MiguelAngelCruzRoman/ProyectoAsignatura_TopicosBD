class Reservacione
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id_Habitacion, type: BSON::ObjectId
  field :id_Cliente, type: BSON::ObjectId
  field :fechaEntrada, type: DateTime
  field :fechaSalida, type: DateTime
  field :fechaReservacion, type: DateTime
  field :estatus, type: String
  field :numeroPersonas, type: Integer
  field :costo, type: Integer
end
