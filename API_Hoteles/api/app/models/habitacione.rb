class Habitacione
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id_Hotel, type: BSON::ObjectId
  field :numero, type: Integer
  field :tipo, type: String
  field :precioNoche, type: Integer
  field :disponible, type: Boolean
  field :capacidad, type: Integer
  field :vista, type: String
  field :serviciosIncluidos, type: Array
  field :imagenes, type: Array
end
