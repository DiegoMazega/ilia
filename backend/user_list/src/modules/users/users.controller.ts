import type { Request, Response } from 'express';
import { getDb } from '../../database/db.js';
import { ErrorKeys } from '../../shared/errorKeys.js';
import { getUsersService } from './users.service.js';

export async function getUsersController(_req: Request, res: Response): Promise<void> {
  try {
    const db = await getDb();
    const users = getUsersService(db);
    res.status(200).json(users);
  } catch {
    res.status(500).json({ error: ErrorKeys.FETCH_USERS_ERROR });
  }
}
