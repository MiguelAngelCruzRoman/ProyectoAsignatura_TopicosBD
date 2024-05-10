from faker import Faker
from pymongo import MongoClient
from bson import ObjectId
from datetime import datetime, timedelta
import random

client = MongoClient('localhost', 27017)
db = client['apiHotel']
collection_facturas = db['facturas']
collection_reservaciones = db['reservaciones']

fake = Faker('es_MX')

data_facturas = []

reservaciones = list(collection_reservaciones.find())

for _ in range(200):  
    reservacion = random.choice(reservaciones)
    
    id_reservacion = reservacion['_id']
    
    fecha_emision = fake.date_time_between(start_date='-1y', end_date='now')
    fecha_vencimiento = fecha_emision + timedelta(days=random.randint(1, 30))
    
    pago = random.randint(50, 500)  
    impuestos_adicionales = random.randint(0, 50)  
    
    metodo_pago = fake.random_element(elements=('Tarjeta de crédito', 'Transferencia bancaria', 'Efectivo'))
    estatus = fake.random_element(elements=('Pendiente', 'Pagada', 'Vencida'))
    
    factura = {
        'id_Reservacion': id_reservacion,
        'fechaEmision': fecha_emision,
        'fechaVencimiento': fecha_vencimiento,
        'pago': pago,
        'impuestosAdicionales': impuestos_adicionales,
        'metodoPago': metodo_pago,
        'estatus': estatus
    }
    data_facturas.append(factura)

collection_facturas.insert_many(data_facturas)

print("Datos de facturas insertados exitosamente.")
