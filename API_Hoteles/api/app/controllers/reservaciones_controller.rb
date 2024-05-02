class ReservacionesController < ApplicationController
    before_action :getReservacion, only: [:updateReservacion, :deleteReservacion, :showReservacion]
    
    def getReservaciones
      reservaciones = Reservacione.all
      if reservaciones.any?
        render json: reservaciones, status: :ok
      else
        render json: { message: "La colección de reservaciones está vacía" }, status: :unprocessable_entity
      end
    end
    
    def addReservacion
      reservacion = Reservacione.new(reservacion_params)
      
      if reservacion.save
        render json: reservacion, status: :created
      else
        render json: { message: "No se pudo crear el reservacion", errors: reservacion.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def showReservacion
      if @reservacion
        render json: @reservacion, status: :ok
      else
        render json: { message: "Reservacion no encontrado" }, status: :unprocessable_entity
      end
    end
    
    def updateReservacion
      if @reservacion.update(reservacion_params)
        render json: @reservacion, status: :ok
      else
        render json: { message: "No se pudo actualizar el reservacion", errors: @reservacion.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def deleteReservacion
      if @reservacion
        if @reservacion.destroy
          render json: { message: "Reservacion eliminado" }, status: :ok
        else
          render json: { message: "No se pudo eliminar el reservacion" }, status: :unprocessable_entity
        end
      else
        render json: { message: "Reservacion no encontrado" }, status: :unprocessable_entity
      end
    end
    
    private
    def reservacion_params
        params.permit(
            :id_Habitacion,
            :id_Cliente,
            :fechaEntrada,
            :fechaSalida,
            :fechaReservacion,
            :estatus,
            :numeroPersonas,
            :costo
        )
    end

    
    def getReservacion
      @reservacion = Reservacione.find(params[:id])
    end
  end
  