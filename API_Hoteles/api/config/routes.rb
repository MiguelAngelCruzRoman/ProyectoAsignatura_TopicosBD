Rails.application.routes.draw do

  get 'getClientes', action: :getClientes, controller: :clientes
  post 'addCliente', action: :addCliente, controller: :clientes
  get 'showCliente/:id', action: :showCliente, controller: :clientes
  put 'updateCliente/:id', action: :updateCliente, controller: :clientes
  delete 'deleteCliente/:id', action: :deleteCliente, controller: :clientes

  get 'getHoteles', action: :getHoteles, controller: :hoteles
  post 'addHotel', action: :addHotel, controller: :hoteles
  get 'showHotel/:id', action: :showHotel, controller: :hoteles
  put 'updateHotel/:id', action: :updateHotel, controller: :hoteles
  delete 'deleteHotel/:id', action: :deleteHotel, controller: :hoteles

  get 'getHabitaciones', action: :getHabitaciones, controller: :habitaciones
  post 'addHabitacion', action: :addHabitacion, controller: :habitaciones
  get 'showHabitacion/:id', action: :showHabitacion, controller: :habitaciones
  put 'updateHabitacion/:id', action: :updateHabitacion, controller: :habitaciones
  delete 'deleteHabitacion/:id', action: :deleteHabitacion, controller: :habitaciones

  get 'getReservaciones', action: :getReservaciones, controller: :reservaciones
  post 'addReservacion', action: :addReservacion, controller: :reservaciones
  get 'showReservacion/:id', action: :showReservacion, controller: :reservaciones
  put 'updateReservacion/:id', action: :updateReservacion, controller: :reservaciones
  delete 'deleteReservacion/:id', action: :deleteReservacion, controller: :reservaciones

  get 'getFacturas', action: :getFacturas, controller: :facturas
  post 'addFactura', action: :addFactura, controller: :facturas
  get 'showFactura/:id', action: :showFactura, controller: :facturas
  put 'updateFactura/:id', action: :updateFactura, controller: :facturas
  delete 'deleteFactura/:id', action: :deleteFactura, controller: :facturas

  get 'getComentarios', action: :getComentarios, controller: :comentarios
  post 'addComentario', action: :addComentario, controller: :comentarios
  get 'showComentario/:id', action: :showComentario, controller: :comentarios
  put 'updateComentario/:id', action: :updateComentario, controller: :comentarios
  delete 'deleteComentario/:id', action: :deleteComentario, controller: :comentarios
end
