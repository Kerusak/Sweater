INSERT INTO user(id, username,password,active)
values (1,'Dima', '1111', true);

INSERT INTO user_role(user_id, roles)
values (1,'USER'), (1,'ADMIN');