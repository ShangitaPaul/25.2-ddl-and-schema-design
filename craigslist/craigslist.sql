/**
Craigslist Schema Design
Table: Regions
Columns: region_id (Primary Key), region_name

Table: Users
Columns: user_id (Primary Key), username, preferred_region_id (Foreign Key)

Table: Posts
Columns: post_id (Primary Key), title, text, user_id (Foreign Key), location, region_id (Foreign Key)

Table: Categories
Columns: category_id (Primary Key), category_name

Table: PostCategories
Columns: post_id (Foreign Key), category_id (Foreign Key)
*/

CREATE TABLE Regions (
    region_id INT NOT NULL AUTO_INCREMENT,
    region_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (region_id)
);

CREATE TABLE Users (
    user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    preferred_region_id INT,
    PRIMARY KEY (user_id),
    FOREIGN KEY (preferred_region_id) REFERENCES Regions(region_id)
);

CREATE TABLE Posts (
    post_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    text TEXT,
    user_id INT,
    location VARCHAR(255),
    region_id INT,
    PRIMARY KEY (post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (region_id) REFERENCES Regions(region_id)
);

CREATE TABLE Categories (
    category_id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (category_id)
);

CREATE TABLE PostCategories (
    post_id INT,
    category_id INT,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
```
