INSERT INTO user(id, username,password,active)
values (1,'Dima', '$2a$08$IJIxzOQ3s5Ihxz9LlAQXx.R4OfwgVzrmM8Daj6zH3t5S0ULA9TtG6', true);

INSERT INTO user_role(user_id, roles)
values (1,'USER'), (1,'ADMIN');