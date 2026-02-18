import rateLimit from 'express-rate-limit';
import { ErrorKeys } from '../shared/errorKeys.js';

export const routeRateLimiter = rateLimit({
  windowMs: 10 * 1000,
  max: 4,
  standardHeaders: true,
  legacyHeaders: false,
  handler: (_req, res) => {
    res.status(429).json({ error: ErrorKeys.RATE_LIMIT_EXCEEDED });
  },
});
