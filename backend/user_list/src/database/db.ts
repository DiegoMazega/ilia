import initSqlJs from 'sql.js';

export type Database = Awaited<ReturnType<typeof initSqlJs>>['Database']['prototype'];

let _db: Database | null = null;

export async function getDb(): Promise<Database> {
  if (_db) return _db;

  const SQL = await initSqlJs();
  _db = new SQL.Database();

  _db.run(`
    CREATE TABLE IF NOT EXISTS users (
      id    TEXT PRIMARY KEY,
      name  TEXT NOT NULL,
      email TEXT NOT NULL UNIQUE
    );
  `);

  return _db;
}
