from faker import Faker
from pymongo import MongoClient
from bson import ObjectId
import random

client = MongoClient('localhost', 27017)
db = client['apiHotel']
collection_habitaciones = db['habitaciones']
collection_hoteles = db['hoteles']

fake = Faker('es_MX')

hoteles_ids = [hotel['_id'] for hotel in collection_hoteles.find()]

data_habitaciones = []

for hotel_id in hoteles_ids:
    num_habitaciones = random.randint(1, 20)  
    
    for num_habitacion in range(1, num_habitaciones + 1):
        habitacion = {
            'id_Hotel': hotel_id,
            'numero': num_habitacion,
            'tipo': fake.random_element(elements=('Individual', 'Doble', 'Suite')),
            'precioNoche': random.randint(50, 5000),  
            'disponible': fake.boolean(chance_of_getting_true=80), 
            'capacidad': random.randint(1, 4),  
            'vista': fake.random_element(elements=('Vista al mar', 'Vista a la ciudad', 'Sin vista')),
            'serviciosIncluidos': [fake.word() for _ in range(random.randint(1, 5))],
            'imagenes': [fake.image_url() for _ in range(random.randint(1, 3))]
        }
        data_habitaciones.append(habitacion)

collection_habitaciones.insert_many(data_habitaciones)

print("Datos de habitaciones insertados exitosamente.")
