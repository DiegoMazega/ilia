import type { Database } from '../../database/db.js';

export interface UserRecord {
  id: string;
  name: string;
  email: string;
}

export function getUsersService(db: Database): UserRecord[] {
  const result = db.exec('SELECT id, name, email FROM users ORDER BY rowid ASC');

  if (result.length === 0) return [];

  const first = result[0];
  if (!first) return [];

  const { columns, values } = first;

  return values.map((row) =>
    Object.fromEntries(columns.map((col, i) => [col, row[i]])) as unknown as UserRecord,
  );
}
