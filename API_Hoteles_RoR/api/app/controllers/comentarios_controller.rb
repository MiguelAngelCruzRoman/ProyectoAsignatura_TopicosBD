class ComentariosController < ApplicationController
    before_action :getComentario, only: [:updateComentario, :deleteComentario, :showComentario]
    
    def getComentarios
      comentarios = Comentario.all
      if comentarios.any?
        render json: comentarios, status: :ok
      else
        render json: { message: "La colección de comentarios está vacía" }, status: :unprocessable_entity
      end
    end
    
    def addComentario
      comentario = Comentario.new(comentario_params)
      
      if comentario.save
        render json: comentario, status: :created
      else
        render json: { message: "No se pudo crear el comentario", errors: comentario.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def showComentario
      if @comentario
        render json: @comentario, status: :ok
      else
        render json: { message: "Comentario no encontrado" }, status: :unprocessable_entity
      end
    end
    
    def updateComentario
      if @comentario.update(comentario_params)
        render json: @comentario, status: :ok
      else
        render json: { message: "No se pudo actualizar el comentario", errors: @comentario.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def deleteComentario
      if @comentario
        if @comentario.destroy
          render json: { message: "Comentario eliminado" }, status: :ok
        else
          render json: { message: "No se pudo eliminar el comentario" }, status: :unprocessable_entity
        end
      else
        render json: { message: "Comentario no encontrado" }, status: :unprocessable_entity
      end
    end
    
    private
    def comentario_params
        params.permit(
            :id_Hotel,
            :id_Cliente,
            :calificacion,
            :comentario,
            :fecha
        )
    end
  
    def getComentario
      @comentario = Comentario.find(params[:id])
    end
  end
  