import sqlparse
import csv

# Fonction pour extraire les requêtes CREATE TABLE et INSERT du fichier SQL
def extract_queries(sql_file):
    queries = []
    with open(sql_file, 'r') as file:
        statements = sqlparse.split(file.read())
        for statement in statements:
            parsed = sqlparse.parse(statement)
            for item in parsed:
                if item.get_type() == 'CREATE':
                    queries.append(statement.strip())
                elif item.get_type() == 'INSERT':
                    queries.append(statement.strip())
    return queries

# Fonction pour exécuter les requêtes et récupérer les données
def execute_queries(queries):
    data = {}
    for query in queries:
        # Ici, vous devez remplacer cette partie du code par la logique pour exécuter les requêtes SQL
        # et récupérer les données de la base de données
        # Voici un exemple simplifié pour simuler l'exécution des requêtes et récupérer les données
        table_name = query.split()[2]  # Nom de la table
        rows = []
        if "INSERT INTO" in query:
            # Simuler l'exécution de la requête INSERT et récupérer les données insérées
            rows.append(query.split("VALUES")[1].strip())
        data[table_name] = rows
    return data

# Fonction pour enregistrer les données dans un fichier CSV
def save_to_csv(data):
    for table_name, rows in data.items():
        if rows:
            with open(f"{table_name}.csv", 'w', newline='') as csvfile:
                csv_writer = csv.writer(csvfile)
                # Si vous avez des en-têtes de colonnes dans les données, vous pouvez les ajouter ici
                # csv_writer.writerow(['colonne1', 'colonne2', ...])
                for row in rows:
                    csv_writer.writerow(row)

# Chemin vers votre fichier SQL
sql_file = 'bdd_med&phar.sql'

# Extraire les requêtes CREATE TABLE et INSERT du fichier SQL
queries = extract_queries(sql_file)

# Exécuter les requêtes et récupérer les données
data = execute_queries(queries)

# Enregistrer les données dans des fichiers CSV
save_to_csv(data)
