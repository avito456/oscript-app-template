# language: ru

Функциональность: Выполнение команды продукта

Как разработчик
Я хочу иметь возможность выполнять команды продукта
Чтобы выполнять коллективную разработку приложения для OneScript

Контекст:
    Допустим Я очищаю параметры команды "oscript" в контексте 
    И я включаю отладку лога с именем "oscript.app.app-template"
    # И я включаю отладку лога с именем "bdd"

Сценарий: Получение версии продукта
    Когда Я выполняю команду "oscript" c параметрами "src/console-entry-point.os version"
    Тогда Я сообщаю вывод команды "oscript"
    И Вывод команды "oscript" содержит "1.0"
    И Вывод команды "oscript" не содержит "oscript-app-template v"
    И Код возврата команды "oscript" равен 0

Сценарий: Получение помощи продукта
    Когда Я выполняю команду "oscript" c параметрами "src/console-entry-point.os help"
    Тогда Вывод команды "oscript" содержит 
    """
    oscript-app-template v1.0
    Возможные команды:
    help     - Вывод справки по параметрам
    version  - Выводить версию приложения
    """
    И Код возврата команды "oscript" равен 0

Сценарий: Вызов исполняемого файла без параметров
    Когда Я выполняю команду "oscript" c параметрами "src/console-entry-point.os"
    Тогда Вывод команды "oscript" содержит
    """
    oscript-app-template v1.0
    ОШИБКА - Некорректные аргументы командной строки
    Возможные команды:
    help     - Вывод справки по параметрам
    version  - Выводить версию приложения
    """
    И Код возврата команды "oscript" равен 1
