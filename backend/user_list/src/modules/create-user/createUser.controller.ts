import { z } from 'zod';
import type { Request, Response } from 'express';
import { getDb } from '../../database/db.js';
import { ErrorKeys } from '../../shared/errorKeys.js';
import { createUserSchema } from './createUser.schema.js';
import { createUserService } from './createUser.service.js';

export async function createUserController(req: Request, res: Response): Promise<void> {
  const parsed = createUserSchema.safeParse(req.body);

  if (!parsed.success) {
    res.status(400).json({ error: ErrorKeys.INVALID_PAYLOAD, details: z.treeifyError(parsed.error) });
    return;
  }

  const db = await getDb();
  const result = createUserService(db)(parsed.data);

  if (!result.ok) {
    res.status(409).json({ error: result.error });
    return;
  }

  res.status(201).json(result.user);
}
