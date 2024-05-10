class Comentario
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id_Hotel, type: BSON::ObjectId
  field :id_Cliente, type: BSON::ObjectId
  field :calificacion, type: Integer
  field :comentario, type: String
  field :fecha, type: DateTime
end
