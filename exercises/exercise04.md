# Exercise 04: Advanced SQL, Jupyter, and Visualization

- Name:
- Course: Database for Analytics
- Module:
- Database Used: World Database
- Tools Used: PostgreSQL, SQLAlchemy, Pandas, Jupyter Notebooks

---

## Instructions

- Complete each task using the **World database** installed earlier.
- For SQL questions:
  - Write the SQL command in a fenced code block
  - Execute the command and include a **screenshot of the results**
- For Jupyter Notebook questions:
  - Include the required Python statements
  - Include **screenshots of the notebook output**
- Store all screenshots in the `screenshots/` folder and embed them below each question.

---

## Question 1

Considering the World database, write a SQL statement that will
**display the names of countries**
that speak **more than two official languages**,
along with the **number of official languages spoken**.

- Sort the results by **number of languages**, from **most to least**.
- _Hint: There are fewer than 10 countries in the results._

### SQL

```sql
SELECT co.name, COUNT(*) AS num_languages
FROM country co
JOIN countrylanguage cl ON co.code = cl.countrycode
WHERE cl.isofficial = 'T'
GROUP BY co.name
HAVING COUNT(*) > 2
ORDER BY num_languages DESC;
```

### Screenshot

![Q1 Screenshot](screenshots/q1_official_language_counts.png)

---

## Question 2

Using **Jupyter Notebooks**, you must use the
`create_engine` command to connect to your database.

After the `create_engine` command is executed,
**what are the three statements** required to
execute the query from Question 1 and
**display the results in the notebook**?

### Python Code

```python
query = "SELECT co.name, COUNT(*) AS num_languages FROM country co JOIN countrylanguage cl ON co.code = cl.countrycode WHERE cl.isofficial = 'T' GROUP BY co.name HAVING COUNT(*) > 2 ORDER BY num_languages DESC"
df = pd.read_sql(query, engine)
df
```

### Screenshot

![Q2 Screenshot](screenshots/q2_jupyter_query_results.png)

---

## Question 3

Using **Jupyter Notebooks**, write the Python code needed
to produce the following graph:

![countries.jpg](./instructions/04-countries.jpg)

(The graph shows country-level results derived from the World database.)

### Python Code

```python
import matplotlib.pyplot as plt

df.plot(x='name', y='num_languages', kind='bar', legend=True)
plt.xlabel('name')
plt.tight_layout()
plt.show()
```

### Screenshot

![Q3 Screenshot](screenshots/q3_countries_graph.png)
