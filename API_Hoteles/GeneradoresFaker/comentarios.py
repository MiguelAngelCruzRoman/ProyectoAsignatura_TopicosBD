from faker import Faker
from pymongo import MongoClient
from bson import ObjectId
from datetime import datetime, timedelta
import random

client = MongoClient('localhost', 27017)
db = client['apiHotel']
collection_comentarios = db['comentarios']
collection_hoteles = db['hoteles']
collection_clientes = db['clientes']

fake = Faker('es_MX')

data_comentarios = []

hoteles_ids = [hotel['_id'] for hotel in collection_hoteles.find()]
clientes_ids = [cliente['_id'] for cliente in collection_clientes.find()]

for _ in range(200): 
    id_hotel = random.choice(hoteles_ids)
    id_cliente = random.choice(clientes_ids)
    
    calificacion = random.randint(1, 5)  
    comentario = fake.text()
    fecha = fake.date_time_between(start_date='-1y', end_date='now')
    
    comentario_data = {
        'id_Hotel': id_hotel,
        'id_Cliente': id_cliente,
        'calificacion': calificacion,
        'comentario': comentario,
        'fecha': fecha
    }
    data_comentarios.append(comentario_data)

collection_comentarios.insert_many(data_comentarios)

print("Datos de comentarios insertados exitosamente.")
