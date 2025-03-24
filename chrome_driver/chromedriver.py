from selenium  import webdriver
from selenium.webdriver.chrome.service import Service
import time 


caminho = r"D:\\Bruna Rosa\\Prime\\Cadastro\\WebTesting\\chrome_driver\\chromedriver.exe"

service = Service(caminho)

navegador = webdriver.Chrome(service=service)
navegador.get("https://www.google.com.br/")
#time.sleep(2)

