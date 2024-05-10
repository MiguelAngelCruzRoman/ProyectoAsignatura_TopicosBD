class HabitacionesController < ApplicationController
    before_action :getHabitacion, only: [:updateHabitacion, :deleteHabitacion, :showHabitacion]
    
    def getHabitaciones
      habitaciones = Habitacione.all
      if habitaciones.any?
        render json: habitaciones, status: :ok
      else
        render json: { message: "La colección de habitaciones está vacía" }, status: :unprocessable_entity
      end
    end
    
    def addHabitacion
      habitacion = Habitacione.new(habitacion_params)
      
      if habitacion.save
        render json: habitacion, status: :created
      else
        render json: { message: "No se pudo crear el habitacion", errors: habitacion.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def showHabitacion
      if @habitacion
        render json: @habitacion, status: :ok
      else
        render json: { message: "Habitacion no encontrado" }, status: :unprocessable_entity
      end
    end
    
    def updateHabitacion
      if @habitacion.update(habitacion_params)
        render json: @habitacion, status: :ok
      else
        render json: { message: "No se pudo actualizar el habitacion", errors: @habitacion.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def deleteHabitacion
      if @habitacion
        if @habitacion.destroy
          render json: { message: "Habitacion eliminado" }, status: :ok
        else
          render json: { message: "No se pudo eliminar el habitacion" }, status: :unprocessable_entity
        end
      else
        render json: { message: "Habitacion no encontrado" }, status: :unprocessable_entity
      end
    end
    
    private
    def habitacion_params
        params.permit(
          :id_Hotel,
          :numero,
          :tipo,
          :precioNoche,
          :disponible,
          :capacidad,
          :vista,
          :serviciosIncluidos => [],
          :imagenes => []
        )
    end
      
      
    
    def getHabitacion
      @habitacion = Habitacione.find(params[:id])
    end
  end
  