import pyautogui
import time
import requests
import urllib.request
from PIL import Image
from datetime import datetime
from datetime import timedelta
import os
import schedule
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders


def bot():
    try:
        getTarefas = requests.get(
            'https://apibot.stv.com.br/api/tarefas/executar')
        
        tarefas = getTarefas.json()
        
        print(tarefas)
        
        # getTarefas = requests.get(
        #     'https://apibot.stv.com.br/api/tarefas/executar')
        
        

        # tarefas = getTarefas.json()

        # print(tarefas)
        
        if 'executando' == format(tarefas['estado']):
            print('existe uma tarefa sendo executada')
        else:
            if 'não executado' == format(tarefas['estado']):
                requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(
                    tarefas['pk_id_horario_tarefas']), params={'estado': 'executando'})

                getEtapas = requests.get(
                    'https://apibot.stv.com.br/api/etapas/{}'.format(tarefas['fk_id_tarefa_horarios']))

                getObstaculos = requests.get(
                    'https://apibot.stv.com.br/api/tarefa/obstaculo/{}'.format(tarefas['fk_id_tarefa_horarios']))

                etapas = getEtapas.json()
                obstaculos = getObstaculos.json()

                pyautogui.hotkey('winleft', 'm')

                for etapas in etapas:
                    print(etapas)

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
                                if obstaculos != []:
                                    try:
                                        for obstaculos in obstaculos:
                                            print('tentando')
                                            urllib.request.urlretrieve(
                                                'https://apibot.stv.com.br/storage/{}'.format(obstaculos['acao']), 'acao.png')
                                            acao = Image.open('acao.png')
                                            clicar = pyautogui.locateCenterOnScreen(
                                                acao, confidence=0.85,)
                                            pyautogui.click(clicar.x, clicar.y)
                                            acao.close()
                                    except:
                                        print('Obstaculo não encontrado')
                                    acao.close()
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa_log': format(etapas['fk_id_tarefa_etapa']),
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
                                        tarefas['pk_id_horario_tarefas']), params={'estado': 'erro'})

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
                                if obstaculos != []:
                                    try:
                                        for obstaculos in obstaculos:
                                            print('tentando')
                                            urllib.request.urlretrieve(
                                                'https://apibot.stv.com.br/storage/{}'.format(obstaculos['acao']), 'acao.png')
                                            acao = Image.open('acao.png')
                                            clicar = pyautogui.locateCenterOnScreen(
                                                acao, confidence=0.85,)
                                            pyautogui.click(clicar.x, clicar.y)
                                            acao.close()
                                    except:
                                        print('Obstaculo não encontrado')
                                    acao.close()
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa_log': format(etapas['fk_id_tarefa_etapa']),
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
                                        tarefas['pk_id_horario_tarefas']), params={'estado': 'erro'})

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
                                if obstaculos != []:
                                    try:
                                        for obstaculos in obstaculos:
                                            print('tentando')
                                            urllib.request.urlretrieve(
                                                'https://apibot.stv.com.br/storage/{}'.format(obstaculos['acao']), 'acao.png')
                                            acao = Image.open('acao.png')
                                            clicar = pyautogui.locateCenterOnScreen(
                                                acao, confidence=0.85,)
                                            pyautogui.click(clicar.x, clicar.y)
                                            acao.close()
                                    except:
                                        print('Obstaculo não encontrado')
                                    acao.close()
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa_log': format(etapas['fk_id_tarefa_etapa']),
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
                                        tarefas['pk_id_horario_tarefas']), params={'estado': 'erro'})

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
                                if obstaculos != []:
                                    try:
                                        for obstaculos in obstaculos:
                                            print('tentando')
                                            urllib.request.urlretrieve(
                                                'https://apibot.stv.com.br/storage/{}'.format(obstaculos['acao']), 'acao.png')
                                            acao = Image.open('acao.png')
                                            clicar = pyautogui.locateCenterOnScreen(
                                                acao, confidence=0.85,)
                                            pyautogui.click(clicar.x, clicar.y)
                                            acao.close()
                                    except:
                                        print('Obstaculo não encontrado')
                                    acao.close()
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa_log': format(etapas['fk_id_tarefa_etapa']),
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
                                        tarefas['pk_id_horario_tarefas']), params={'estado': 'erro'})

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
                                    payload = {'fk_id_tarefa_log': format(etapas['fk_id_tarefa_etapa']),
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
                                        tarefas['pk_id_horario_tarefas']), params={'estado': 'erro'})
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
                                    payload = {'fk_id_tarefa_log': format(etapas['fk_id_tarefa_etapa']),
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
                                        tarefas['pk_id_horario_tarefas']), params={'estado': 'erro'})
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
                                diaAtual = datetime.today()
                                diaAnterior = diaAtual - timedelta(days=1)
                                verificar = format(etapas['renomear_data'])
                                pyautogui.click(img.x, img.y)
                                pyautogui.hotkey('f2')
                                if verificar == 'anterior':
                                    digitar = format(
                                        etapas['digitar']) + '(' + (str(diaAnterior.strftime('%d-%m-%y'))) + ')'
                                    pyautogui.typewrite(
                                        digitar, interval=0.05)
                                    pyautogui.hotkey('enter')
                                else:
                                    digitar = format(
                                        etapas['digitar']) + '(' + (str(diaAtual.strftime('%d-%m-%y'))) + ')'
                                    pyautogui.typewrite(
                                        digitar, interval=0.05)
                                    pyautogui.hotkey('enter')
                                procurar = "não"
                                imagem.close()
                                time.sleep(tempo)

                            except:
                                time.sleep(5)
                                print('Arquivo não encontrado')
                                parar = parar + 1
                                if obstaculos != []:
                                    try:
                                        for obstaculos in obstaculos:
                                            print('tentando')
                                            urllib.request.urlretrieve(
                                                'https://apibot.stv.com.br/storage/{}'.format(obstaculos['acao']), 'acao.png')
                                            acao = Image.open('acao.png')
                                            clicar = pyautogui.locateCenterOnScreen(
                                                acao, confidence=0.85,)
                                            pyautogui.click(clicar.x, clicar.y)
                                            acao.close()
                                    except:
                                        print('Obstaculo não encontrado')
                                    acao.close()
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa_log': format(etapas['fk_id_tarefa_etapa']),
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
                                        tarefas['pk_id_horario_tarefas']), params={'estado': 'erro'})
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
                                os.system('taskkill /f /IM ' +
                                          matarTarefa + '.exe')
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
                                    payload = {'fk_id_tarefa_log': format(etapas['fk_id_tarefa_etapa']),
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
                                        tarefas['pk_id_horario_tarefas']), params={'estado': 'erro'})
                                    quit()

                    if 'digitar data' == format(etapas['acao']):

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
                                mesAtual = datetime.today()
                                mesAnterior = mesAtual.replace(
                                    day=1) - timedelta(days=1)
                                verificar = format(etapas['renomear_data'])
                                pyautogui.click(img.x, img.y)
                                if verificar == 'anterior':
                                    digitar = format(
                                        etapas['digitar']) + (str(mesAnterior.strftime('%m%y')))
                                    pyautogui.typewrite(
                                        digitar, interval=0.05)
                                    pyautogui.hotkey('enter')
                                elif verificar == 'atual':
                                    digitar = format(
                                        etapas['digitar']) + (str(diaAtual.strftime('%m%y')))
                                    pyautogui.typewrite(
                                        digitar, interval=0.05)
                                    pyautogui.hotkey('enter')
                                elif verificar == 'semana':
                                    hoje = datetime.today()
                                    # MON = 0, SUN = 6 -> SUN = 0 .. SAT = 6
                                    idx = (hoje.weekday() + 1) % 7
                                    segunda = hoje - timedelta(idx-1)
                                    terça = hoje - timedelta(idx-2)
                                    quarta = hoje - timedelta(idx-3)
                                    quinta = hoje - timedelta(idx-4)
                                    sexta = hoje - timedelta(idx-5)
                                    sabado = hoje - timedelta(idx-6)
                                    if format(etapas['digitar']) == 'segunda':
                                        digitar = str(
                                            segunda.strftime('%d/%m/%y'))
                                    elif format(etapas['digitar']) == 'terça':
                                        digitar = str(
                                            terça.strftime('%d/%m/%y'))
                                    elif format(etapas['digitar']) == 'quarta':
                                        digitar = str(
                                            quarta.strftime('%d/%m/%y'))
                                    elif format(etapas['digitar']) == 'quinta':
                                        digitar = str(
                                            quinta.strftime('%d/%m/%y'))
                                    elif format(etapas['digitar']) == 'sexta':
                                        digitar = str(
                                            sexta.strftime('%d/%m/%y'))
                                    elif format(etapas['digitar']) == 'sabado':
                                        digitar = str(
                                            sabado.strftime('%d/%m/%y'))
                                    pyautogui.typewrite(
                                        digitar, interval=0.05)
                                    pyautogui.hotkey('enter')
                                procurar = "não"
                                imagem.close()
                                time.sleep(tempo)

                            except:
                                time.sleep(5)
                                print('Arquivo não encontrado')
                                parar = parar + 1
                                if obstaculos != []:
                                    for obstaculos in obstaculos:
                                        print('tentando')
                                        urllib.request.urlretrieve(
                                            'https://apibot.stv.com.br/storage/{}'.format(obstaculos['acao']), 'acao.png')
                                        acao = Image.open('acao.png')
                                        clicar = pyautogui.locateCenterOnScreen(
                                            acao, confidence=0.85,)
                                        pyautogui.click(clicar.x, clicar.y)
                                    acao.close()
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa_log': format(etapas['fk_id_tarefa_etapa']),
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
                                        tarefas['pk_id_horario_tarefas']), params={'estado': 'erro'})
                                    quit()

                    if 'enviar email' == format(etapas['acao']):

                        procurar = "sim"
                        tempo = float(format(etapas['tempo_execucao']))
                        urllib.request.urlretrieve(
                            'https://apibot.stv.com.br/storage/{}'.format(etapas['caminho']), 'aaa.png')
                        imagem = Image.open('aaa.png')
                        parar = 0

                        servidor_smtp = "192.168.0.49"
                        remetente = "rpa@stv.com.br"
                        emails = format(etapas['digitar'])
                        subject = "RPA - Retorno"

                        nomeArquivo = format(etapas['atalho'])
                        if nomeArquivo == 'SerpoPCD.pdf,,,,':
                            corpo_email = 'Bom dia, Segue a informação semanal com o ranking para identificar aqueles que estão com as cotas estabelecidas. \nAtt,\nBOT de Automação'
                        else:
                            corpo_email = 'Segue em anexo o Arquivo ' + \
                                str(nomeArquivo) + '\nAtt,\nBOT de Automação'

                        email_msg = MIMEMultipart()
                        email_msg['From'] = remetente
                        email_msg['To'] = emails
                        email_msg['Subject'] = subject
                        email_msg.attach(MIMEText(corpo_email, 'plain'))
                        print(emails)

                        anexo = "C:/RPA/Arquivos/"

                        filenames = next(os.walk(anexo), (None, None, []))[2]
                        for f in filenames:
                            attachment = open(anexo + f, 'rb')
                            att = MIMEBase('application', 'octet-stream')
                            att.set_payload(attachment.read())
                            encoders.encode_base64(att)
                            att.add_header('Content-Disposition',
                                           f'attachment; filename={f}')
                            attachment.close()
                            email_msg.attach(att)

                        while procurar == "sim":
                            try:
                                smtpObj = smtplib.SMTP(servidor_smtp)
                                smtpObj.sendmail(email_msg['From'], emails.split(
                                    ';'), email_msg.as_string())
                                imagem.close()
                                time.sleep(tempo)
                                procurar = "não"
                                for f in filenames:
                                    os.remove(anexo + f)
                                print('Email Enviado!!')
                            except:
                                time.sleep(5)
                                print('Arquivo não encontrado')
                                parar = parar + 1
                                if parar == 5:
                                    dataHoraErro = datetime.now()
                                    myScreenshot = pyautogui.screenshot()
                                    myScreenshot.save('error.png')
                                    payload = {'fk_id_tarefa_log': format(etapas['fk_id_tarefa_etapa']),
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
                                        tarefas['pk_id_horario_tarefas']), params={'estado': 'erro'})
                                    quit()

                    if 'Se...se não...' == format(etapas['acao']):

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
                                pyautogui.moveTo(img.x, img.y)
                                imagem.close()
                                print('Imagem encontrada!')
                                procurar = "não"
                                time.sleep(tempo)
                            except:
                                print('Não encontrado!')
                                parar = parar + 1
                                time.sleep(5)
                                if parar == 5:
                                    requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(
                                        tarefas['pk_id_horario_tarefas']), params={'estado': 'Exceção'})
                                    print("trocando para tarefa filha!")
                                    requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(
                                        etapas['digitar']), params={'estado': 'não executado'})
                                    time.sleep(5)
                                    procurar = "não"
                                    exit()

                # Fora dos blocos
                requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(
                    tarefas['pk_id_horario_tarefas']), params={'estado': 'Finalizado'})
                dataHoraFinal = datetime.now()
                payload = {'fk_id_tarefa_log': format(tarefas['fk_id_tarefa_horarios']),
                           'status': 'Sucesso',
                           'data_hora': format(dataHoraFinal),
                           }
                requests.post(
                    'https://apibot.stv.com.br/api/log/salvar', data=payload)
                os.remove('aaa.png')
                os.remove('acao.png')
                os.remove('obstaculo.png')
                
                # if format(tarefas['dia_da_semana']) == 'Tarefa Filha':
                #     requests.put('https://apibot.stv.com.br/api/tarefa/editar/{}'.format(
                #         etapas['digitar']), params={'estado': 'Desativado'})

    except:
        data = datetime.now()
        time.sleep(1)
        print('Hora : ', data, ' : Nenhuma Tarefa para executar!')


schedule.every(5).seconds.do(bot)

while True:
    schedule.run_pending()
    time.sleep(5)
