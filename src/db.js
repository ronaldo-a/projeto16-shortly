import pg from "pg";

const { Pool } = pg;

const connection = new Pool ({
    user: "postgres",
    password: "orkutorkut",
    host: "localhost",
    port: 5432,
    database: "shortly"
});

export default connection;