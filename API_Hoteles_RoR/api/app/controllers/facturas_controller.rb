class FacturasController < ApplicationController
    before_action :getFactura, only: [:updateFactura, :deleteFactura, :showFactura]
    
    def getFacturas
      facturas = Factura.all
      if facturas.any?
        render json: facturas, status: :ok
      else
        render json: { message: "La colección de facturas está vacía" }, status: :unprocessable_entity
      end
    end
    
    def addFactura
      factura = Factura.new(factura_params)
      
      if factura.save
        render json: factura, status: :created
      else
        render json: { message: "No se pudo crear el factura", errors: factura.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def showFactura
      if @factura
        render json: @factura, status: :ok
      else
        render json: { message: "Factura no encontrado" }, status: :unprocessable_entity
      end
    end
    
    def updateFactura
      if @factura.update(factura_params)
        render json: @factura, status: :ok
      else
        render json: { message: "No se pudo actualizar el factura", errors: @factura.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def deleteFactura
      if @factura
        if @factura.destroy
          render json: { message: "Factura eliminado" }, status: :ok
        else
          render json: { message: "No se pudo eliminar el factura" }, status: :unprocessable_entity
        end
      else
        render json: { message: "Factura no encontrado" }, status: :unprocessable_entity
      end
    end
    
    private
    def factura_params
      params.permit(
        :id_Reservacion,
        :fechaEmision,
        :fechaVencimiento,
        :pago,
        :impuestosAdicionales,
        :metodoPago,
        :estatus
      )
    end    

    
    def getFactura
      @factura = Factura.find(params[:id])
    end
  end
  