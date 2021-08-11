CREATE DATABASE bookmark

CREATE TABLE link
(
 	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    url VARCHAR(255)
)



CREATE TABLE categories
(
 	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    description VARCHAR(255)
)



CREATE TABLE link_categories (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_link INT , 
    id_cat INT 
)


ALTER TABLE link_categories ADD INDEX(id_link);

ALTER TABLE link_categories ADD INDEX(id_cat);



ALTER TABLE link_categories
ADD FOREIGN KEY (id_link) REFERENCES link(id);

ALTER TABLE link_categories
ADD FOREIGN KEY (id_cat) REFERENCES categories(id);

INSERT INTO link (name, url)
VALUES ('name','url')


INSERT INTO categories (name, description)
VALUES ('name','description')


INSERT INTO link_categories (id_link, id_cat)
VALUES (1,2);

/* 1 = ID de l'élement de table liens (exemple)
   2 = ID de l'éléement de table catégorie(exemple) */







/*REQUETE*/

SELECT l.name as "name link", l.url as "lien link", c.name as "category name"FROM link as l 
        inner join link_categories as lc ON l.id = lc.id_link
        inner join categories as c ON c.id = lc.id_cat;


SELECT l.name as "name link", l.url as "lien link", c.name as "category name"FROM link as l 
        inner join link_categories as lc ON l.id = lc.id_link
        inner join categories as c ON c.id = lc.id_cat
        where l.id <=4 ;

SELECT l.name as "name link", l.url as "lien link", c.name as "category name"FROM link as l 
        inner join link_categories as lc ON l.id = lc.id_link
        inner join categories as c ON c.id = lc.id_cat
        where c.id = 1 ;

SELECT l.name as "name link", l.url as "lien link", c.name as "category name"FROM link as l 
        inner join link_categories as lc ON l.id = lc.id_link
        inner join categories as c ON c.id = lc.id_cat
        where l.name = 'Discord' ;