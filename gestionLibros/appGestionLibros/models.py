from django.db import models

# Create your models here.

generoLibro = [
    ('Novela','Novela'),('Ciencia ficcion','Ciencia ficcion'),
    ('Romance','Romance'),('Historia','Historia'),
]
estado = [
    ('En prestamo','En prestamo'),('Devuelto','Devuelto'),
]
class Libro(models.Model):
    libNombre = models.CharField(max_length=45,db_comment="Título del libro es el nombre principal que lo identifica")
    libAutor = models.CharField(max_length=45,db_comment="Autor del libro")
    libISBN = models.CharField(max_length=50,unique=True,db_comment="Código único asignado a cada libro")
    libGenero = models.CharField(max_length=50,choices=generoLibro,db_comment="Genero del libro")
    libAnoPublicacion = models.IntegerField(max_length=50,db_comment="Año de publicacion del libro")
class Cliente(models.Model):
    cliNombre = models.CharField(max_length=45,db_comment="Nombre del cliente")
    cliApellido = models.CharField(max_length=45,db_comment="Apellido del cliente")
    cliTelefono = models.CharField(max_length=45,db_comment="Telefono del cliente")
    cliCorreo = models.CharField(max_length=45,db_comment="Correo electronico del cliente")
    cliDireccion = models.CharField(max_length=45,db_comment="Direccion fisica del cliente")
    
class Prestamo(models.Model):
    preCodigo = models.CharField(max_length=45,unique=True,db_comment="Codigo unico de prestamo")
    preFechaPrestamo = models.DateField(db_comment="Corresponde a la fecha que el libro es retirado")
    preFechaEntrega = models.DateField(db_comment="Corresponde a la fecha que el libro es regresado ")
    preEstado = models.CharField(max_length=40,null=True,choices=estado,default="En prestamo",db_comment="Estado del prestamo")
    preCliente = models.ForeignKey(Cliente,on_delete=models.PROTECT,db_comment="Hace relación al elemento FK")
    preLibro = models.ForeignKey(Libro,on_delete=models.PROTECT,db_comment="Hace relación al elemento FK")
    
