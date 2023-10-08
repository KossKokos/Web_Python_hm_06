import sqlite3
from datetime import datetime, date, timedelta
from random import randint

from faker import Faker


disciplines = [
    'Maths',
    'English',
    'IT',
    'PE',
    'History of Ukraine',
    'Philosophy',
    'Physic',
    'Chemistry'
]

groups = ['C331', 'TP-05-1', 'KN-51']
NUMBER_TEACHERS = 5
NUMBER_STUDENTS = 50

connect = sqlite3.connect('hw.db')
cur = connect.cursor()

fake = Faker()

def seed_teachers():
    teachers = [fake.name() for _ in range(NUMBER_TEACHERS)]
    sql = """
    INSERT INTO 'teachers' (full_name) VALUES(?);
    """
    cur.executemany(sql, zip(teachers, ))

def seed_disciplines():
    sql = """
    INSERT INTO 'disciplines' (name, teacher_id) VALUES(?, ?);
    """
    cur.executemany(sql, zip(disciplines, iter(randint(1, NUMBER_TEACHERS) for _ in range(len(disciplines)))))

def seed_groups():
    sql = """
    INSERT INTO 'groups' (name) VALUES(?);
    """
    cur.executemany(sql, zip(groups, ))

def seed_students():
    students = [fake.name() for _ in range(NUMBER_STUDENTS)]
    sql = """
    INSERT INTO 'students' (full_name, group_id) VALUES(?, ?);
    """
    cur.executemany(sql, zip(students, iter(randint(1, 3) for _ in range(len(students)))))

def seed_grades():
    start_date = datetime.strptime("2022-09-03", "%Y-%m-%d")
    end_date = datetime.strptime("2023-06-10", "%Y-%m-%d")
    sql = """
    INSERT INTO 'grades' (disciplines_id, student_id, grade, date_of) VALUES(?, ?, ?, ?);
    """
    def grade_days(start: date, end: date):
        result = []
        while start <= end:
            if start.isoweekday() < 6:
                result.append(start)
            start += timedelta(days=1)
        return result
    
    lst_dates = grade_days(start_date, end_date)
    grades = []

    for day in lst_dates:
        disciplines_grade = randint(1, len(disciplines))
        students = [randint(1, NUMBER_STUDENTS) for _ in range(5)]
        for student in  students:
            grades.append((disciplines_grade, student, randint(1, 12), day.date()))
    
    cur.executemany(sql, grades)


if __name__ == '__main__':
    try:
        seed_teachers()
        seed_disciplines()
        seed_groups()
        seed_students()
        seed_grades()
        connect.commit()
    except sqlite3.Error as err:
        print(err)
    finally:
        connect.close()