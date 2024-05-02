class Hotele
  include Mongoid::Document
  include Mongoid::Timestamps

  field :nombre, type: String
  field :ubicacion, type: Hash
  field :categoria, type: Integer
  field :tipo, type: String
  field :checkIn, type: String
  field :checkout, type: String
  field :amenidades, type: Array
  field :imagenes, type: Array
  field :telefono, type: String
  field :correo, type: String

  embeds_one :ubicacion
end

class Ubicacion
  include Mongoid::Document

  field :pais, type: String
  field :ciudad, type: String
  field :calle, type: String
  field :numero, type: Integer
  field :CP, type: Integer
  field :referencia, type: String
  field :latitud, type: Float
  field :longitud, type: Float

  embedded_in :hotel
end
