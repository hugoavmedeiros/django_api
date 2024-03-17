from django.contrib import admin
#### MODELOS ####
from .models import FundoImobiliario

@admin.register(FundoImobiliario) # chama diretamente
class FundoImobiliarioAdmin(admin.ModelAdmin): # lista_display permite mostrar campos customizados
    list_display = ("codigo", "setor",)
