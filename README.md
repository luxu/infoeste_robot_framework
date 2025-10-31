## Mini-curso **Robot Framework** - Infoeste 2005

- Instalar o python com o path selecionado
- Instalar as libs:
```bash

pip install robotframework
```
```bash

pip install robotframework-seleniumlibrary
```
- Driver do firefox:
    https://github.com/mozilla/geckodriver/releases
- Para capturar os xpaths da página
    Extensões do Chrome:
```
letXPath
```
    Extensões do Firefox:
```
TruePath
```
- Incluir a extensão no vscode
```
Robot Framework Language Server
```

#### #### #### #### #### #### ATENÇÃO #### #### #### #### #### #### #### 
O atributo: *Pause Execution* só funciona no linux se tiver instalado o tkinter pelo comando:
- sudo apt install python3-tk 
e depois importado a lib: Dialogs