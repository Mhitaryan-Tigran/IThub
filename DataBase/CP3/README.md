# КТ № 3 - PostgreSQL

**Версия БД:** 1.0.0.1

## Что создано

- **17 таблиц**
- **32 индекса**
- **5 ролей** 
- **2 процедуры**

## Таблицы

- Department - кафедры
- Post - должности  
- Discipline - дисциплины
- Territory - корпуса
- Audience - аудитории
- User_Profile - пользователи системы

- Bussines_Role - роли в кафедре
- WrkCrr - рабочие программы
- Study_Grpoup - группы студентов
- Student - профили студентов
- Employee - профили сотрудников
- Dep_Discipl - дисциплины по курсам


- Distrib_Grps - распределение студентов по группам
- Audiens_Territ - расположение аудиторий
- Combination - сотрудники и их должности
- Workload - нагрузка
- Schedule - расписание

## Роли и права доступа

### rl_architect - архитектор кафедры
Может редактировать структуру: дисциплины, программы, учебные планы

### rl_teacher - преподаватель  
Может только просматривать расписание и данные студентов

### rl_student - студент
Может просматривать расписание и обновлять свои данные

### rl_managersd - менеджер учебного отдела
Управляет группами, студентами, расписанием

### rl_administrator - администратор
Полный доступ ко всему

## Файлы

### structure_create.sql
Основной файл - создаёт всю структуру БД, индексы, роли и права.

Запуск:
```sql
psql -U postgres -d имя_базы -f structure_create.sql
```

Или в psql:
```sql
\i structure_create.sql
```

### structure_recreate.sql  
Пересоздаёт всё с нуля (удаляет и заново создаёт).

Запуск процедуры:
```sql
CALL Structure_Re_Create();
```

### test_queries.sql
Примеры запросов для проверки структуры и тестирования прав доступа.

## Тестики

Список всех таблиц:
```sql
SELECT table_name FROM information_schema.tables 
WHERE table_schema='public' ORDER BY table_name;
```

Список индексов:
```sql
SELECT indexname FROM pg_indexes 
WHERE schemaname='public' AND indexname NOT LIKE 'pk_%';
```

Список ролей:
```sql
SELECT rolname FROM pg_roles WHERE rolname LIKE 'rl_%';
```

## Индексы

Основные индексы созданы на:
- PRIMARY KEY (автоматически)
- Поля для поиска (названия, номера)
- Аутентификация (логин + пароль)
- Поиск по ФИО
- Временные поля (даты, курсы, семестры)

