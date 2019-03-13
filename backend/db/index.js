const pgp = require('pg-promise')({});
const db = pgp('postgres://localhost:5432/movie_buff');

module.exports = { db };
