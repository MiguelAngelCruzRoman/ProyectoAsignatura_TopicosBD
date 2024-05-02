class ClientesController < ApplicationController
    before_action :getCliente, only: [:updateCliente, :deleteCliente, :showCliente]
    
    def getClientes
      clientes = Cliente.all
      if clientes.any?
        render json: clientes, status: :ok
      else
        render json: { message: "La colección de clientes está vacía" }, status: :unprocessable_entity
      end
    end
    
    def addCliente
      cliente = Cliente.new(cliente_params)
      
      if cliente.save
        render json: cliente, status: :created
      else
        render json: { message: "No se pudo crear el cliente", errors: cliente.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def showCliente
      if @cliente
        render json: @cliente, status: :ok
      else
        render json: { message: "Cliente no encontrado" }, status: :unprocessable_entity
      end
    end
    
    def updateCliente
      if @cliente.update(cliente_params)
        render json: @cliente, status: :ok
      else
        render json: { message: "No se pudo actualizar el cliente", errors: @cliente.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def deleteCliente
      if @cliente
        if @cliente.destroy
          render json: { message: "Cliente eliminado" }, status: :ok
        else
          render json: { message: "No se pudo eliminar el cliente" }, status: :unprocessable_entity
        end
      else
        render json: { message: "Cliente no encontrado" }, status: :unprocessable_entity
      end
    end
    
    private
    
    def cliente_params
      params.permit(
        :primerNombre,
        :segundoNombre,
        :apellidoPaterno,
        :apellidoMaterno,
        :correo,
        :telefono,
        :nacionalidad,
        documentoIdentidad: [:tipoDocumento, :imagen, :fechaValidez],
        tarjetaCredito: [:tipo, :banco, :numero]
      )
    end
    
    def getCliente
      @cliente = Cliente.find(params[:id])
    end
  end
  