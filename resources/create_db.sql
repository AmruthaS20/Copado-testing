CREATE TABLE IF NOT EXISTS cases (
   case_number TEXT PRIMARY KEY,
   name TEXT,
   subject TEXT,
   status TEXT,
   date_time TEXT
);

DELETE FROM cases;

INSERT INTO cases (
   case_number,
   name,
   subject,
   status,
   date_time
) VALUES (
   '00001002',
   'SKood',
   'Caso de ejemplo 3: no es posible realizar un seguimiento de nuestro pedido',
   'En espera',
   '12/22/2025 7:09 AM'
);