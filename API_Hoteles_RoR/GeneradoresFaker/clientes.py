from faker import Faker
from pymongo import MongoClient
from datetime import datetime
import random

client = MongoClient('localhost', 27017)
db = client['apiHotel']
collection_clientes = db['clientes']

fake = Faker('es_MX')

data_clientes = []

for _ in range(100):  
    segundo_nombre = fake.first_name() if random.choice([True, False]) else None 


    cliente = {
        'primerNombre': fake.first_name(),
        'segundoNombre': segundo_nombre,
        'apellidoPaterno': fake.last_name(),
        'apellidoMaterno': fake.last_name(),
        'correo': fake.unique.email(),
        'telefono': fake.random_number(digits=10),
        'documentoIdentidad': {
            'tipoDocumento': fake.random_element(elements=('DNI', 'Pasaporte', 'Carnet de identidad')),
            'imagen': fake.image_url(),
            'fechaValidez': fake.date_between(start_date='-10y', end_date='+10y').strftime('%Y-%m-%d')
        },
        'nacionalidad': fake.country(),
        'tarjetaCredito': {
            'tipo': fake.random_element(elements=('Visa', 'MasterCard', 'American Express')),
            'banco': fake.random_element(elements=('Banco Santander', 'BBVA', 'HSBC')),
            'numero': fake.credit_card_number(),
            'cvv':fake.random_number(digits=3),
            'fechaCaducidad':fake.date_between(start_date='-10y', end_date='+10y').strftime('%Y-%m-%d')
        }
    }
    data_clientes.append(cliente)

collection_clientes.insert_many(data_clientes)

print("Datos de clientes insertados exitosamente.")
