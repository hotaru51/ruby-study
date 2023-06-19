CREATE TABLE bbsdata (
  id    integer PRIMARY KEY,
  name  varchar(30),
  entry varchar(150)
);

INSERT INTO bbsdata values (1, 'You Watanabe', 'zensoku zenshin yo-soro-');
INSERT INTO bbsdata values (2, 'Kotori Minami', '(・８・)');

CREATE TABLE members (
  id   integer PRIMARY KEY,
  name varchar(30)
);

INSERT INTO members (id, name) VALUES
  (1, 'Nico Yazawa'),
  (2, 'Maki, Nishikino');
