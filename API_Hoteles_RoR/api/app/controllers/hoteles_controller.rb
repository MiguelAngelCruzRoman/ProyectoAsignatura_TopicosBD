class HotelesController < ApplicationController
    before_action :getHotel, only: [:updateHotel, :deleteHotel, :showHotel]
    
    def getHoteles
      hoteles = Hotele.all
      if hoteles.any?
        render json: hoteles, status: :ok
      else
        render json: { message: "La colección de hoteles está vacía" }, status: :unprocessable_entity
      end
    end
    
    def addHotel
      hotel = Hotele.new(hotel_params)
      
      if hotel.save
        render json: hotel, status: :created
      else
        render json: { message: "No se pudo crear el hotel", errors: hotel.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def showHotel
      if @hotel
        render json: @hotel, status: :ok
      else
        render json: { message: "Hotel no encontrado" }, status: :unprocessable_entity
      end
    end
    
    def updateHotel
      if @hotel.update(hotel_params)
        render json: @hotel, status: :ok
      else
        render json: { message: "No se pudo actualizar el hotel", errors: @hotel.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def deleteHotel
      if @hotel
        if @hotel.destroy
          render json: { message: "Hotel eliminado" }, status: :ok
        else
          render json: { message: "No se pudo eliminar el hotel" }, status: :unprocessable_entity
        end
      else
        render json: { message: "Hotel no encontrado" }, status: :unprocessable_entity
      end
    end
    
    private
    
    def hotel_params
        params.permit(
          :nombre,
          :categoria,
          :tipo,
          :checkIn,
          :checkout,
          :telefono,
          :correo,
          :ubicacion => [:pais, :ciudad, :calle, :numero, :CP, :referencia, :latitud, :longitud],
          :amenidades => [],
          :imagenes => []
        )
    end
      
    
    def getHotel
      @hotel = Hotele.find(params[:id])
    end
  end
  