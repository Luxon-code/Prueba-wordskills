from django.shortcuts import render
from appGestionLibros.models import *
from django.db import Error,transaction
# Create your views here.

def inicio(request):
    return render(request,"inicio.html")

def vistaRegistrarCliente(request):
    return render(request,"frmRegistrarCliente.html");

def registrarCliente(request):
    try:
        nombres = request.POST["txtNombres"]
        apellidos = request.POST["txtApellidos"]
        correo = request.POST["txtCorreo"]
        telefono = request.POST["txtTelefono"]
        direccion = request.POST["txtDireccion"]
        with transaction.atomic():
            Cliente.objects.create(cliNombre=nombres,cliApellido=apellidos,cliTelefono=telefono,cliCorreo=correo,
                                   cliDireccion=direccion)
            mensaje= "Cliente Registrado"
    except Error as error:
        transaction.rollback()
        mensaje= f"{error}"
    retorno = {"mensaje":mensaje}
    return render(request,"frmRegistrarCliente.html",retorno)

def vistaRegistrarLibro(request):
    retorno = {"generos":generoLibro}
    return render(request,"frmRegistrarLibro.html",retorno)

def registrarLibro(request):
    estado= False
    try:
        titulo = request.POST['txtTitulo']
        autor = request.POST['txtAutor']
        isbn = request.POST['txtISBN']
        genero = request.POST['cbGenero']
        añoPublicacion = request.POST['txtAno']
        with transaction.atomic():
            Libro.objects.create(libNombre=titulo,libAutor=autor,libISBN=isbn,
                                 libGenero=genero,libAnoPublicacion=añoPublicacion)
            estado= True
            mensaje = "Libro registrado"
    except Error as error:
        transaction.rollback()
        mensaje= f"{error}"
    retorno = {"mensaje":mensaje,"estado":estado,"generos":generoLibro}
    return render(request,"frmRegistrarLibro.html",retorno)

def vistaRegistrarPrestamo(request):
    retorno = {"clientes":Cliente.objects.all(),"libros":Libro.objects.all()}
    return render(request,"frmRegistrarPrestamo.html",retorno)


def registrarPrestamo(request):
    estado = False
    try:
        fechaPrestamo = request.POST['txtFechaPrestamo']
        fechaEntrega = request.POST['txtFechaEntrega']
        cliente = request.POST['cbCliente']
        libro  = request.POST['cbLibro']
        #crear codigo propio del prestamo
        cantidad = Prestamo.objects.all().count()
        codigo = "PRES"  + str(cantidad+1).rjust(5, '0')
        with transaction.atomic():
            #buscar el cliente
            cli = Cliente.objects.get(pk=cliente)
            #buscar el libro
            lib = Libro.objects.get(pk=libro)
            Prestamo.objects.create(preCodigo=codigo,preFechaPrestamo=fechaPrestamo,
                                    preFechaEntrega=fechaEntrega,preCliente=cli,preLibro=lib)
            estado = True
            mensaje = "Prestamo Registrado"
    except Error as error:
        transaction.rollback()
        mensaje= f"{error}"
    retorno = {"mensaje":mensaje,"estado":estado,"generos":generoLibro}
    return render(request,"frmRegistrarPrestamo.html",retorno)

def vistaListarPrestamos(request):
    retorno = {"prestamos":Prestamo.objects.all()}
    return render(request,"listarPrestamos.html",retorno)


    