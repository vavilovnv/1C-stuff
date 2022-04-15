🍫 **Chocolatey** - менеджер, который имеет самый большой онлайн-реестр пакетов Windows. Пакеты проходят проверку на вирусы. 


## 💻 Дистрибутив и порядок установки

Дистрибутив и свежую инструкцию по установке можно найти по [ссылке](https://chocolatey.org/install).

### Установка chocolatey

1. Убедиться в том, что используются права администратора. 

2. Запустить powershell.exe и выполнить команду `Get-ExecutionPolicy`. Если результат будет `Restricted`, нужно выполнить команду `Set-ExecutionPolicy AllSigned` или `Set-ExecutionPolicy Bypass -Scope Process.`

3. Выполнить команду: `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))` 

4. Проверить, что установка прошла успешно. Для этого ввести команду `choco` или `choco -?`. Если все ок, будет выведена версия chocolatey.

### Установка пакетов приложений

Для установки пакета используется команда `choco install имя_пакета`. Например, для установки графической оболочки chocolatey выполняется командой `choco install chocolateygui`.

### Обновление chocolatey и пакетов приложений

Обновление chocolatey выполняется командой `choco upgrade chocolatey`. 

Обновление всех установленных пакетов приложений выполняется командой `choco upgrade all`.

Отдельный пакет приложения можно обновить вручную в GUI.

### Удаление пакетов приложений

Удалить пакет приложения можно в GUI или при помощи команды `choco uninstall имя_пакета`. Например, команда `choco uninstall chocolateygui` удалит пакет chocolateygui.
