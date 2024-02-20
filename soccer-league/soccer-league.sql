/** Soccar League Schema
Schema Design:

Table: Teams
Columns: team_id (Primary Key), team_name

Table: Players
Columns: player_id (Primary Key), player_name, team_id (Foreign Key)

Table: Goals
Columns: goal_id (Primary Key), player_id (Foreign Key), game_id (Foreign Key), goals_scored

Table: Referees
Columns: referee_id (Primary Key), referee_name

Table: Matches
Columns: match_id (Primary Key), team1_id (Foreign Key), team2_id (Foreign Key), match_date

Table: Seasons
Columns: season_id (Primary Key), start_date, end_date

Table: Standings
Columns: standing_id (Primary Key), team_id (Foreign Key), season_id (Foreign Key), rank
*/

CREATE TABLE Teams (
  team_id INT PRIMARY KEY,
  team_name VARCHAR(50)
);

CREATE TABLE Players (
  player_id INT PRIMARY KEY,
  player_name VARCHAR(50),
  team_id INT,
  FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Goals (
  goal_id INT PRIMARY KEY,
  player_id INT,
  game_id INT,
  goals_scored INT,
  FOREIGN KEY (player_id) REFERENCES Players(player_id),
  FOREIGN KEY (game_id) REFERENCES Matches(match_id)
);
CREATE TABLE Referees (
  referee_id INT PRIMARY KEY,
  referee_name VARCHAR(50)
);

CREATE TABLE Matches (
  match_id INT PRIMARY KEY,
  team1_id INT,
  team2_id INT,
  match_date DATE,
  FOREIGN KEY (team1_id) REFERENCES Teams(team_id),
  FOREIGN KEY (team2_id) REFERENCES Teams(team_id)
);

CREATE TABLE Seasons (
    season_id INT PRIMARY KEY,
    start_date DATE,
    end_date DATE
    );

CREATE TABLE Standings (
    standing_id INT PRIMARY KEY,
    team_id INT,
    season_id INT,
    rank INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (season_id) REFERENCES Seasons(season_id)
    );
```