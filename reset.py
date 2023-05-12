
import requests
from PIL import Image
from datetime import datetime
from subprocess import run

requests.patch('https://apibot.stv.com.br/api/tarefa/reiniciar')
print('resetando')


##nao funcional