import { randomUUID } from 'crypto';
import type { Database } from '../../database/db.js';
import { ErrorKeys } from '../../shared/errorKeys.js';
import type { CreateUserInput } from './createUser.schema.js';

export type CreateUserResult =
  | { ok: true; user: { id: string; name: string; email: string } }
  | { ok: false; error: string };

export function createUserService(db: Database) {
  return function execute(input: CreateUserInput): CreateUserResult {
    const existing = db.exec(
      'SELECT id FROM users WHERE email = ?',
      [input.email],
    );

    const emailTaken = existing.length > 0 && existing[0]!.values.length > 0;
    if (emailTaken) {
      return { ok: false, error: ErrorKeys.EMAIL_ALREADY_EXISTS };
    }

    const id = randomUUID();

    db.run(
      'INSERT INTO users (id, name, email) VALUES (?, ?, ?)',
      [id, input.name, input.email],
    );

    return { ok: true, user: { id, name: input.name, email: input.email } };
  };
}
