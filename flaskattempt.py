from flask import Flask
from flask import jsonify

#!/usr/bin/env python
from sqlalchemy import create_engine
import pandas as pd

app = Flask(__name__)

@app.route("/")
# Connection settings
def connect_db():
    settings = {
        'serverName': "localhost",    # The name of the computer running MySQL
        'portNumber': 3306,           # The port of the MySQL server (default is 3306)
        'dbName': "mydb",    # The name of the database we are testing with (this default is installed with MySQL)
        'userName': "root",
        'password': ""
    }
    tableName = "menu"           # The name of the table we are testing with

    # Connect to the database
    conn = create_engine('mysql://{0[userName]}:{0[password]}@{0[serverName]}:{0[portNumber]}/{0[dbName]}'.format(settings))
    connection = conn.connect().connection
    cnx = conn.raw_connection()
    cursor = connection.cursor()
    print 'Connected to database'
    test_read = pd.read_sql('SELECT menu_id FROM menu', cnx)

    cursor.execute("call getMenu(1)")
    resultsMap = [{
        'menu_category': c[0]
    } for c in cursor.fetchall()]
    resultsTable = pd.DataFrame(resultsMap)

    cursor.nextset()

    cursor.execute("call getRestaurant(1)")
    resultsMap1 = [{
        'restaurant': c[0]
    } for c in cursor.fetchall()]
    resultsTable1 = pd.DataFrame(resultsMap1)

    cursor.nextset()

    cursor.execute("call getRestaurant(1)")
    resultsMap2 = [{
        'item': c[0]
    } for c in cursor.fetchall()]
    resultsTable2 = pd.DataFrame(resultsMap2)

    resultsTable = resultsTable.append(resultsTable1, ignore_index=True)

    results = resultsTable.to_json()
    cursor.close()
    connection.close()

    return results

if __name__ == "__main__":
    app.run()
