class Cliente
  include Mongoid::Document
  include Mongoid::Timestamps

  field :primerNombre, type: String
  field :segundoNombre, type: String, default: ""
  field :apellidoPaterno, type: String
  field :apellidoMaterno, type: String
  field :correo, type: String
  field :telefono, type: String
  field :nacionalidad, type: String

  embeds_one :documentoIdentidad, class_name: 'DocumentoIdentidad'
  embeds_one :tarjetaCredito, class_name: 'TarjetaCredito'

end

class DocumentoIdentidad
  include Mongoid::Document

  field :tipoDocumento, type: String
  field :imagen, type: String
  field :fechaValidez, type: Date

  embedded_in :cliente
end

class TarjetaCredito
  include Mongoid::Document

  field :tipo, type: String
  field :banco, type: String
  field :numero, type: String
  field :cvv, type: Integer
  field :fechaCaducidad, type: Date

  embedded_in :cliente
end
