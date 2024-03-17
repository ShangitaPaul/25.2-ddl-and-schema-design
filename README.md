# 25.2-ddl-and-schema-design
https://www.springboard.com/workshops/umass-global-sec-bootcamp-foundations/learn/243/#/curriculum/39356

Modifications to given sql files are detailed in comments in each sql file 

# Conceptual 

**Project Conceptual Explanation:**

The project involves three parts, each requiring the design of a database schema and subsequent DDL operations to create the tables and relationships. Additionally, it includes tasks for inserting sample data to ensure the functionality of the designed schema. Furthermore, there's a section for schema critique, where existing schemas provided in SQL files are reviewed for potential improvements.

**Part 1: Schema Design**

1. **Medical Center:** 
   - Designing a database schema for a medical center involves modeling relationships between doctors, patients, diagnoses, and diseases.
   - Tables likely include: 
     - Doctors
     - Patients
     - Visits
     - Diagnoses
     - Diseases
   - Relationships:
     - One doctor can have many patients.
     - One patient can see many doctors.
     - During a visit, a patient may be diagnosed with one or more diseases.
   - Challenges may include handling historical medical data, ensuring data integrity, and managing privacy concerns.

2. **Craigslist:**
   - Designing a schema for Craigslist involves capturing regions, users, posts, categories, and their relationships.
   - Tables likely include:
     - Regions
     - Users
     - Posts
     - Categories
   - Relationships:
     - Users may have preferred regions.
     - Posts belong to users and regions and can fall under multiple categories.
   - Challenges may involve managing user preferences, post categorization, and ensuring geographical accuracy.

3. **Soccer League:**
   - Designing a schema for a sports league involves modeling teams, players, matches, goals, referees, seasons, and standings.
   - Tables likely include:
     - Teams
     - Players
     - Matches
     - Goals
     - Referees
     - Seasons
     - Standings
   - Relationships:
     - Players belong to teams, matches have goals scored by players, matches are officiated by referees.
     - Teams play matches in seasons.
   - Challenges may include tracking match outcomes, managing player transfers, and calculating standings accurately.

**Part 2: Schema Critique**

SEE COMMENTS INSIDE FILES FOR CRITIQUE
