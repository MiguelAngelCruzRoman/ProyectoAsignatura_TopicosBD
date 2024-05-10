from faker import Faker
from pymongo import MongoClient
import random

client = MongoClient('localhost', 27017)
db = client['apiHotel']
collection_hoteles = db['hoteles']

fake = Faker('es_MX')

ciudades_mas_visitadas = [
    {'ciudad': 'Bangkok', 'pais': 'Tailandia'},
    {'ciudad': 'Londres', 'pais': 'Reino Unido'},
    {'ciudad': 'París', 'pais': 'Francia'},
    {'ciudad': 'Dubái', 'pais': 'Emiratos Árabes Unidos'},
    {'ciudad': 'Nueva York', 'pais': 'Estados Unidos'},
    {'ciudad': 'Singapur', 'pais': 'Singapur'},
    {'ciudad': 'Kuala Lumpur', 'pais': 'Malasia'},
    {'ciudad': 'Estambul', 'pais': 'Turquía'},
    {'ciudad': 'Tokio', 'pais': 'Japón'},
    {'ciudad': 'Seúl', 'pais': 'Corea del Sur'}
]

data_hoteles = []

for _ in range(100):
    ciudad_elegida = random.choice(ciudades_mas_visitadas)
    
    hotel = {
        'nombre': fake.company(),
        'ubicación': {
            'pais': ciudad_elegida['pais'],
            'ciudad': ciudad_elegida['ciudad'],
            'calle': fake.street_name(),
            'numero': random.randint(1, 100),
            'CP': random.randint(10000, 99999),
            'referencia': fake.text(),
            'latitud': random.uniform(-90, 90),
            'longitud': random.uniform(-180, 180)
        },
        'categoría': random.randint(1, 5),
        'tipo': fake.random_element(elements=('Resort', 'Hotel', 'Hostal', 'Motel', 'AutoHotel')),
        'checkIn': fake.time(pattern="%H:%M:%S"),
        'checkout': fake.time(pattern="%H:%M:%S"),
        'amenidades': [fake.word() for _ in range(random.randint(3, 10))],
        'imágenes': [fake.image_url() for _ in range(random.randint(1, 5))],
        'telefono': fake.random_number(digits=10),
        'correo': fake.unique.email()
    }
    data_hoteles.append(hotel)

collection_hoteles.insert_many(data_hoteles)

print("Datos de hoteles insertados exitosamente.")
