import pyautogui
import time
import requests
import urllib.request
from PIL import Image
from datetime import datetime
import os
import schedule


def bot():
    try:
        getTarefas = requests.get(
        'https://apibot.stv.com.br/api/tarefas/executar')

        tarefas = getTarefas.json()

        print(tarefas)
        if 'executando' == format(tarefas['estado']):
            print('existe uma tarefa sendo executada')
        else:
            if 'não executado' == format(tarefas['estado']):
                requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(
                    tarefas['pk_id_tarefa']), params={'estado': 'executando'})
                # arquivo = open('teste.txt', 'w')
                # arquivo.write(format(tarefas['pk_id_tarefa']))
                # arquivo.close()
                # run([sys.executable,"C:/Users/bot.rpa/Desktop/Python/automacao.exe"])

                # arquivo = open('teste.txt', 'r')
                # url = arquivo.readline(10)
                # arquivo.close()
                getEtapas = requests.get(
                    'https://apibot.stv.com.br/api/etapas/{}'.format(tarefas['pk_id_tarefa']))

                etapas = getEtapas.json()

                pyautogui.hotkey('winleft', 'm')
                for etapas in etapas:

                    if 'clicar' == format(etapas['acao']):

                        procurar = "sim"
                        tempo = float(format(etapas['tempo_execucao']))
                        urllib.request.urlretrieve(
                            'https://apibot.stv.com.br/storage/{}'.format(etapas['caminho']), 'aaa.png')
                        imagem = Image.open('aaa.png')
                        parar = 0
                        while procurar == "sim":
                            try:
                                img = pyautogui.locateCenterOnScreen(
                                    imagem, confidence=0.85,)
                                pyautogui.click(img.x, img.y)
                                procurar = "não"
                                imagem.close()
                                time.sleep(tempo)
                            except:
                                time.sleep(5)
                                print('Arquivo não encontrado')
                                parar = parar + 1
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa': format(etapas['fk_id_tarefa']),
                                            'nome_etapa': format(etapas['nome_etapa']),
                                            'fk_id_etapa': format(etapas['pk_id_etapa']),
                                            'status': 'Erro',
                                            'data_hora': format(dataHoraErro),
                                            }
                                    file = {'erro': open('error.png', 'rb')}
                                    requests.post(
                                        'https://apibot.stv.com.br/api/log/salvar', files=file, data=payload)
                                    print('Processo parou por falta de resposta')
                                    requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(
                                        tarefas['pk_id_tarefa']), params={'estado': 'erro'})
                                    
                                    quit()

                    if 'clicar 2x' == format(etapas['acao']):

                        procurar = "sim"
                        urllib.request.urlretrieve(
                            'https://apibot.stv.com.br/storage/{}'.format(etapas['caminho']), 'aaa.png')
                        imagem = Image.open('aaa.png')
                        tempo = float(format(etapas['tempo_execucao']))
                        parar = 0
                        while procurar == "sim":
                            try:
                                img = pyautogui.locateCenterOnScreen(
                                    imagem, confidence=0.85)
                                pyautogui.doubleClick(img.x, img.y)
                                procurar = "não"
                                imagem.close()
                                time.sleep(tempo)
                            except:
                                time.sleep(5)
                                print('Arquivo não encontrado')
                                parar = parar + 1
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa': format(etapas['fk_id_tarefa']),
                                            'nome_etapa': format(etapas['nome_etapa']),
                                            'fk_id_etapa': format(etapas['pk_id_etapa']),
                                            'status': 'Erro',
                                            'data_hora': format(dataHoraErro),
                                            }
                                    file = {'erro': open('error.png', 'rb')}
                                    requests.post(
                                        'https://apibot.stv.com.br/api/log/salvar', files=file, data=payload)
                                    print('Processo parou por falta de resposta')
                                    requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(
                                        tarefas['pk_id_tarefa']), params={'estado': 'erro'})
                                    
                                    quit()

                    if 'digitar' == format(etapas['acao']):

                        procurar = "sim"
                        tempo = float(format(etapas['tempo_execucao']))
                        urllib.request.urlretrieve(
                            'https://apibot.stv.com.br/storage/{}'.format(etapas['caminho']), 'aaa.png')
                        imagem = Image.open('aaa.png')
                        parar = 0
                        while procurar == "sim":
                            try:
                                img = pyautogui.locateCenterOnScreen(
                                    imagem, confidence=0.85)
                                pyautogui.click(img.x, img.y)
                                pyautogui.typewrite(
                                    format(etapas['digitar']), interval=0.05)
                                procurar = "não"
                                imagem.close()
                                time.sleep(tempo)
                            except:
                                time.sleep(5)
                                print('Arquivo não encontrado')
                                parar = parar + 1
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa': format(etapas['fk_id_tarefa']),
                                            'nome_etapa': format(etapas['nome_etapa']),
                                            'fk_id_etapa': format(etapas['pk_id_etapa']),
                                            'status': 'Erro',
                                            'data_hora': format(dataHoraErro),
                                            }
                                    file = {'erro': open('error.png', 'rb')}
                                    requests.post(
                                        'https://apibot.stv.com.br/api/log/salvar', files=file, data=payload)
                                    print('Processo parou por falta de resposta')
                                    requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(
                                        tarefas['pk_id_tarefa']), params={'estado': 'erro'})
                                    
                                    quit()

                    if 'clicar com direito' == format(etapas['acao']):

                        procurar = "sim"
                        tempo = float(format(etapas['tempo_execucao']))
                        urllib.request.urlretrieve(
                            'https://apibot.stv.com.br/storage/{}'.format(etapas['caminho']), 'aaa.png')
                        imagem = Image.open('aaa.png')
                        parar = 0
                        while procurar == "sim":
                            try:
                                img = pyautogui.locateCenterOnScreen(
                                    imagem, confidence=0.85,)
                                pyautogui.rightClick(img.x, img.y)
                                procurar = "não"
                                imagem.close()
                                time.sleep(tempo)
                            except:
                                time.sleep(5)
                                print('Arquivo não encontrado')
                                parar = parar + 1
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa': format(etapas['fk_id_tarefa']),
                                            'nome_etapa': format(etapas['nome_etapa']),
                                            'fk_id_etapa': format(etapas['pk_id_etapa']),
                                            'status': 'Erro',
                                            'data_hora': format(dataHoraErro),
                                            }
                                    file = {'erro': open('error.png', 'rb')}
                                    requests.post(
                                        'https://apibot.stv.com.br/api/log/salvar', files=file, data=payload)
                                    print('Processo parou por falta de resposta')
                                    requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(
                                        tarefas['pk_id_tarefa']), params={'estado': 'erro'})
                                    
                                    quit()

                    if 'atalho' == format(etapas['acao']):

                        procurar = "sim"
                        tempo = float(format(etapas['tempo_execucao']))
                        urllib.request.urlretrieve(
                            'https://apibot.stv.com.br/storage/{}'.format(etapas['caminho']), 'aaa.png')
                        imagem = Image.open('aaa.png')
                        parar = 0
                        while procurar == "sim":
                            try:
                                txt = format(etapas['atalho']).split(",")
                                print(txt)
                                imagem.close()
                                if len(txt) == 3:
                                    print(len(txt))
                                    pyautogui.hotkey(txt[0], txt[1], txt[2])
                                    procurar = "não"
                                    time.sleep(tempo)
                                if len(txt) == 2:
                                    print(len(txt))
                                    pyautogui.hotkey(txt[0], txt[1])
                                    procurar = "não"
                                    time.sleep(tempo)
                                if len(txt) == 1:
                                    print(len(txt))
                                    pyautogui.press(txt[0])
                                    procurar = "não"
                                    time.sleep(tempo)
                            except:
                                time.sleep(5)
                                print('Arquivo não encontrado')
                                parar = parar + 1
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa': format(etapas['fk_id_tarefa']),
                                            'nome_etapa': format(etapas['nome_etapa']),
                                            'fk_id_etapa': format(etapas['pk_id_etapa']),
                                            'status': 'Erro',
                                            'data_hora': format(dataHoraErro),
                                            }
                                    file = {'erro': open('error.png', 'rb')}
                                    requests.post(
                                        'https://apibot.stv.com.br/api/log/salvar', files=file, data=payload)
                                    print('Processo parou por falta de resposta')
                                    requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(
                                        tarefas['pk_id_tarefa']), params={'estado': 'erro'})
                                    quit()

                    if 'executar app' == format(etapas['acao']):

                        procurar = "sim"
                        tempo = float(format(etapas['tempo_execucao']))
                        urllib.request.urlretrieve(
                            'https://apibot.stv.com.br/storage/{}'.format(etapas['caminho']), 'aaa.png')
                        imagem = Image.open('aaa.png')
                        parar = 0

                        while procurar == "sim":
                            try:
                                os.system(format(etapas['digitar']))
                                procurar = "não"
                                imagem.close()
                                time.sleep(tempo)
                            except:
                                time.sleep(5)
                                print('Arquivo não encontrado')
                                parar = parar + 1
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa': format(etapas['fk_id_tarefa']),
                                            'nome_etapa': format(etapas['nome_etapa']),
                                            'fk_id_etapa': format(etapas['pk_id_etapa']),
                                            'status': 'Erro',
                                            'data_hora': format(dataHoraErro),
                                            }
                                    file = {'erro': open('error.png', 'rb')}
                                    requests.post(
                                        'https://apibot.stv.com.br/api/log/salvar', files=file, data=payload)
                                    print('Processo parou por falta de resposta')
                                    requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(
                                        tarefas['pk_id_tarefa']), params={'estado': 'erro'})
                                    quit()

                    if 'renomear arquivo' == format(etapas['acao']):

                        procurar = "sim"
                        tempo = float(format(etapas['tempo_execucao']))
                        urllib.request.urlretrieve(
                            'https://apibot.stv.com.br/storage/{}'.format(etapas['caminho']), 'aaa.png')
                        imagem = Image.open('aaa.png')
                        parar = 0

                        while procurar == "sim":
                            try:
                                
                                img = pyautogui.locateCenterOnScreen(
                                    imagem, confidence=0.85,)
                                tempoAtual = datetime.now().strftime('%d%m')
                                pyautogui.click(img.x, img.y)
                                pyautogui.hotkey('f2')
                                digitar = format(etapas['digitar']) + '(' + (str(tempoAtual)) + ')'
                                pyautogui.typewrite(
                                   digitar , interval=0.05)
                                pyautogui.hotkey('enter')
                                procurar = "não"
                                imagem.close()
                                time.sleep(tempo)
                                
                            except:
                                time.sleep(5)
                                print('Arquivo não encontrado')
                                parar = parar + 1
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa': format(etapas['fk_id_tarefa']),
                                            'nome_etapa': format(etapas['nome_etapa']),
                                            'fk_id_etapa': format(etapas['pk_id_etapa']),
                                            'status': 'Erro',
                                            'data_hora': format(dataHoraErro),
                                            }
                                    file = {'erro': open('error.png', 'rb')}
                                    requests.post(
                                        'https://apibot.stv.com.br/api/log/salvar', files=file, data=payload)
                                    print('Processo parou por falta de resposta')
                                    requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(tarefas['pk_id_tarefa']), params={'estado': 'erro'})
                                    quit()

                    if 'fechar app' == format(etapas['acao']):

                        procurar = "sim"
                        tempo = float(format(etapas['tempo_execucao']))
                        urllib.request.urlretrieve(
                            'https://apibot.stv.com.br/storage/{}'.format(etapas['caminho']), 'aaa.png')
                        imagem = Image.open('aaa.png')
                        parar = 0

                        while procurar == "sim":
                            try:
                                matarTarefa = format(etapas['digitar'])
                                os.system('taskkill /f /IM ' + matarTarefa + '.exe')
                                procurar = "não"
                                imagem.close()
                                time.sleep(tempo)
                                
                            except :
                                time.sleep(5)
                                print('Arquivo não encontrado')
                                parar = parar + 1
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa': format(etapas['fk_id_tarefa']),
                                            'nome_etapa': format(etapas['nome_etapa']),
                                            'fk_id_etapa': format(etapas['pk_id_etapa']),
                                            'status': 'Erro',
                                            'data_hora': format(dataHoraErro),
                                            }
                                    file = {'erro': open('error.png', 'rb')}
                                    requests.post(
                                        'https://apibot.stv.com.br/api/log/salvar', files=file, data=payload)
                                    print('Processo parou por falta de resposta')
                                    requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(tarefas['pk_id_tarefa']), params={'estado': 'erro'})
                                    quit()
                #Fora dos blocos               
                requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(tarefas['pk_id_tarefa']), params={'estado': 'Finalizado'})
                os.remove('aaa.png')
    except:
        data = datetime.now()
        time.sleep(1)
        print('Hora : ', data , ' : Nenhuma Tarefa para executar!')
    

schedule.every(10).seconds.do(bot)

while True:
    schedule.run_pending()
    time.sleep(5)