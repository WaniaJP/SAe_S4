from faker import Faker

fake = Faker()
sql=""

for i in range(1000):
    # generate fake data
    name = fake.name()
    email = fake.email()
    city = fake.city()
    date=fake.date()
    mdp=fake.password()
    email=fake.email()
    tel = fake.phone_number()
    
    # create INSERT SQL statement
    # Nom_ VARCHAR(50), Prenom_ VARCHAR(50), Naissance_ VARCHAR(10), mdp_ VARCHAR(50), email_ VARCHAR(50), Ville_ VARCHAR(100), Telephone_ CHAR(14)
    nomComplet = name.split(" ")
    prenom = nomComplet[0]
    nom = nomComplet[1]
    sql += "addUtilisateur('{}', '{}', '{}')".format(nom, prenom, date, mdp, email, city, tel)+"\n"


# write SQL statement to file
with open('ajoutDonnees.sql', 'w') as f:
    f.write(sql)