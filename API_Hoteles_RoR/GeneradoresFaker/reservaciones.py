from faker import Faker
from pymongo import MongoClient
from bson import ObjectId
from datetime import datetime, timedelta
import random

client = MongoClient('localhost', 27017)
db = client['apiHotel']
collection_reservaciones = db['reservaciones']
collection_habitaciones = db['habitaciones']
collection_clientes = db['clientes']

fake = Faker('es_MX')

data_reservaciones = []

habitaciones = list(collection_habitaciones.find())
clientes_ids = [cliente['_id'] for cliente in collection_clientes.find()]  

for _ in range(200): 
    habitacion = random.choice(habitaciones)
    
    id_habitacion = habitacion['_id']
    costo_diario = habitacion['precioNoche']  
    
    fecha_reservacion = fake.date_time_between(start_date='-1y', end_date='now')
    fecha_entrada = fecha_reservacion + timedelta(days=random.randint(1, 30))
    fecha_salida = fecha_entrada + timedelta(days=random.randint(1, 10))
    numero_dias = (fecha_salida - fecha_entrada).days
    
    estatus = fake.random_element(elements=('Confirmada', 'Pendiente', 'Cancelada'))
    numero_personas = random.randint(1, 4)
    
    costo = costo_diario * numero_dias
    id_cliente = random.choice(clientes_ids)

    reservacion = {
        'id_Habitacion': id_habitacion,
        'id_Cliente': id_cliente,
        'fechaEntrada': fecha_entrada,
        'fechaSalida': fecha_salida,
        'fechaReservacion': fecha_reservacion,
        'estatus': estatus,
        'numeroPersonas': numero_personas,
        'costo': costo
    }
    data_reservaciones.append(reservacion)

collection_reservaciones.insert_many(data_reservaciones)

print("Datos de reservaciones insertados exitosamente.")
